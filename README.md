# Flutter LCE (Load content error) 
这是一个 Flutter LCE 实现

## Getting started

需要配合 get_it、mobx、injectable ，使用前务必了解他们的使用方法。

## Usage
### 1. 页面 store
```dart
/// 配合 injectable 自动注入
@injectable
class MyHomePageStore = _MyHomePageStoreBase with _$MyHomePageStore;

/// 创建 mobx store 并继承 LCEStore
abstract class _MyHomePageStoreBase extends LCEStore with Store {
  @observable
  var counter = 0;
}
```
### 2. 页面
```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// 创建页面 State，继承 LCEState
class _MyHomePageState extends LCEState<MyHomePage, MyHomePageStore> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Text(
            '${store.counter}', // store 是通过 injectable 注入的
          );
        },
      ),
    );
  }
}
```
## Additional information

更多内容详见 example
