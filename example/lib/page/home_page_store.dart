// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:lce/anotations.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = HomePageStoreBase with _$HomePageStore;

/// 定义 mobx store 并继承 LCEStore
abstract class HomePageStoreBase extends LCEStore with Store {
  @override
  @computed
  bool get progress => super.progress || fetchRandom.pending; // 当 fetchRandom 执行时，显示加载中

  @observable
  var fetchRandom = OBF<int>(); // 定义可观察的 ObservableFuture

  @observable
  var counter = 0;

  @action
  void incrementCounter() {
    counter++;
  }

  @action
  void resetCounter() {
    counter = 0;
    showMessage('reset'); // 显示消息，一般是 Toast
  }

  @retryCatch //生成 random$retry 方法
  @action
  Future random() async {
    fetchRandom = randomApi().obf; // 将 future 转换为可观察的 ObservableFuture
    var r = await fetchRandom;
    counter += r;
    showMessageDialog(
      'random value is $r',
      title: 'Random succeed',
    ); // 显示对话框消息
  }

  bool randomFailed = true;

  Future<int> randomApi() async {
    await Future.delayed(const Duration(milliseconds: 300));
    var rng = Random();

    if (!randomFailed && rng.nextBool()) {
      randomFailed = true;
      throw Exception('random failed');
    }

    randomFailed = false;

    return rng.nextInt(10);
  }
}
