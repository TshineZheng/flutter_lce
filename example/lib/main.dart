/// --------------------------------------------------
/// 本示例展示 Flutter lce 基本用法
/// 特别关注注释行
/// --------------------------------------------------

import 'dart:math';
import 'package:flutter/material.dart' hide showDialog;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';
import 'main.config.dart';
part 'main.g.dart';

/// injectable 配置
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future configureDependencies() async => $initGetIt(GetIt.instance);

void main() async {
  /// 初始化 injectable
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

/// 定义 mobx store 并继承 LCEStore
/// @injectable 标记 store 可自动注入
@injectable
class MyHomePageStore = MyHomePageStoreBase with _$MyHomePageStore;

abstract class MyHomePageStoreBase extends LCEStore with Store {
  @override
  @computed
  bool get progress => super.progress || fetchRandom.pending; // 当 fetchRandom 执行时，显示加载中

  @observable
  var fetchRandom = OBF<int?>(); // 定义可观察的 ObservableFuture

  @observable
  var counter = 0;

  @action
  void incrementCounter() {
    counter++;
  }

  @action
  void resetCounter() {
    counter = 0;
    showMsg('reset'); // 显示消息，一般是 Toast
  }

  @action
  Future random() async {
    fetchRandom = randomApi().obf; // 将 future 转换为可观察的 ObservableFuture

    try {
      var r = await fetchRandom;
      counter += r!;
      showMsgDlg('random value is $r'); // 显示对话框消息
    } catch (e) {
      showRetry(e.toString(), onRetry: () => random()); // 当发生错误时，显示重试对话框
    }
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// PageState 继承 LCEState，并关联 StatefulWidget 和对应的 LCEStore
class _MyHomePageState extends LCEState<MyHomePage, MyHomePageStore> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text(
                '${store.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 此处 store 通过 injectable 自动注入
                IconButton(onPressed: () => store.incrementCounter(), icon: const Icon(Icons.add)),
                IconButton(onPressed: () => store.random(), icon: const Icon(Icons.onetwothree)),
                IconButton(onPressed: () => store.resetCounter(), icon: const Icon(Icons.clear)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
