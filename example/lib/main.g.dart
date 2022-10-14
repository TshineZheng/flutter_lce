// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyHomePageStore on _MyHomePageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress, name: '_MyHomePageStoreBase.progress')).value;

  late final _$counterAtom = Atom(name: '_MyHomePageStoreBase.counter', context: context);

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

  late final _$fetchRandomAtom = Atom(name: '_MyHomePageStoreBase.fetchRandom', context: context);

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

  late final _$randomAsyncAction = AsyncAction('_MyHomePageStoreBase.random', context: context);

  @override
  Future<dynamic> random() {
    return _$randomAsyncAction.run(() => super.random());
  }

  late final _$_MyHomePageStoreBaseActionController = ActionController(name: '_MyHomePageStoreBase', context: context);

  @override
  void incrementCounter() {
    final _$actionInfo =
        _$_MyHomePageStoreBaseActionController.startAction(name: '_MyHomePageStoreBase.incrementCounter');
    try {
      return super.incrementCounter();
    } finally {
      _$_MyHomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCounter() {
    final _$actionInfo = _$_MyHomePageStoreBaseActionController.startAction(name: '_MyHomePageStoreBase.clearCounter');
    try {
      return super.resetCounter();
    } finally {
      _$_MyHomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
fetchRandom: ${fetchRandom},
progress: ${progress}
    ''';
  }
}
