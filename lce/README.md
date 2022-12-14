# Flutter LCE (Load content error) 
这是一个 Flutter LCE 实现

## Getting started

项目增加库依赖
```shell
flutter pub add lce
```

可选依赖（用于支持 @LCECatch 注解）
```shell
flutter pub add lce_codegen
```

## Usage
### 1. 页面 store
```dart
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
  MyHomePageStore initStore() => MyHomePageStore();

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Text(
            '${store.counter}',
          );
        },
      ),
    );
  }
}
```
## Additional information

更多内容详见 example
