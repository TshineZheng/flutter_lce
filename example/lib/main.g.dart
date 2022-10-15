// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyHomePageStore on MyHomePageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress,
              name: 'MyHomePageStoreBase.progress'))
          .value;

  late final _$fetchRandomAtom =
      Atom(name: 'MyHomePageStoreBase.fetchRandom', context: context);

  @override
  ObservableFuture<int?> get fetchRandom {
    _$fetchRandomAtom.reportRead();
    return super.fetchRandom;
  }

  @override
  set fetchRandom(ObservableFuture<int?> value) {
    _$fetchRandomAtom.reportWrite(value, super.fetchRandom, () {
      super.fetchRandom = value;
    });
  }

  late final _$counterAtom =
      Atom(name: 'MyHomePageStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$randomAsyncAction =
      AsyncAction('MyHomePageStoreBase.random', context: context);

  @override
  Future<dynamic> random() {
    return _$randomAsyncAction.run(() => super.random());
  }

  late final _$MyHomePageStoreBaseActionController =
      ActionController(name: 'MyHomePageStoreBase', context: context);

  @override
  void incrementCounter() {
    final _$actionInfo = _$MyHomePageStoreBaseActionController.startAction(
        name: 'MyHomePageStoreBase.incrementCounter');
    try {
      return super.incrementCounter();
    } finally {
      _$MyHomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCounter() {
    final _$actionInfo = _$MyHomePageStoreBaseActionController.startAction(
        name: 'MyHomePageStoreBase.resetCounter');
    try {
      return super.resetCounter();
    } finally {
      _$MyHomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchRandom: ${fetchRandom},
counter: ${counter},
progress: ${progress}
    ''';
  }
}
