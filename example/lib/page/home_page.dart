import 'package:example/page/home_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lce/lce.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// PageState 继承 LCEState，并关联 StatefulWidget 和对应的 LCEStore
class _HomePageState extends LCEState<HomePage, HomePageStore> {
  @override
  HomePageStore buildStore() => HomePageStore();

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
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => store.incrementCounter(), icon: const Icon(Icons.add)),
                IconButton(onPressed: () => store.random$retry(), icon: const Icon(Icons.onetwothree)),
                IconButton(onPressed: () => store.resetCounter(), icon: const Icon(Icons.clear)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
