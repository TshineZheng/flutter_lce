// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart' hide showDialog;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';

import 'main.config.dart';
part 'main.g.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future configureDependencies() async => $initGetIt(GetIt.instance);

void main() async {
  await configureDependencies();

  LCEDelegate.showToast = (context, msg) => showToast(msg);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

@injectable
class MyHomePageStore = _MyHomePageStoreBase with _$MyHomePageStore;

abstract class _MyHomePageStoreBase extends LCEStore with Store {
  @observable
  var counter = 0;

  @override
  @computed
  bool get progress => super.progress || fetchRandom.pending;

  @observable
  var fetchRandom = OBF<int?>();

  @action
  void incrementCounter() {
    counter++;
  }

  @action
  void resetCounter() {
    counter = 0;
    showToast('reset');
  }

  @action
  Future random() async {
    fetchRandom = randomApi().obf;

    try {
      var r = await fetchRandom;
      counter += r!;
      showDialog(msg: 'random value is $r');
    } catch (e) {
      showRetry(onRetry: () => random(), error: e);
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
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends LCEState<MyHomePage, MyHomePageStore> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
