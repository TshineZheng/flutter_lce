// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// LCEGenerator
// **************************************************************************

extension HomePageStoreBaseCatchExt on HomePageStoreBase {
  Future<dynamic> random$retry() async {
    try {
      return await random();
    } catch (e) {
      showRetry(
        e.toString(),
        onRetry: () => random$retry(),
        title: null,
      );
    }
  }
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on HomePageStoreBase, Store {
  Computed<bool>? _$progressComputed;

  @override
  bool get progress =>
      (_$progressComputed ??= Computed<bool>(() => super.progress,
              name: 'HomePageStoreBase.progress'))
          .value;

  late final _$fetchRandomAtom =
      Atom(name: 'HomePageStoreBase.fetchRandom', context: context);

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
      Atom(name: 'HomePageStoreBase.counter', context: context);

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
      AsyncAction('HomePageStoreBase.random', context: context);

  @override
  Future<dynamic> random() {
    return _$randomAsyncAction.run(() => super.random());
  }

  late final _$HomePageStoreBaseActionController =
      ActionController(name: 'HomePageStoreBase', context: context);

  @override
  void incrementCounter() {
    final _$actionInfo = _$HomePageStoreBaseActionController.startAction(
        name: 'HomePageStoreBase.incrementCounter');
    try {
      return super.incrementCounter();
    } finally {
      _$HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCounter() {
    final _$actionInfo = _$HomePageStoreBaseActionController.startAction(
        name: 'HomePageStoreBase.resetCounter');
    try {
      return super.resetCounter();
    } finally {
      _$HomePageStoreBaseActionController.endAction(_$actionInfo);
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
