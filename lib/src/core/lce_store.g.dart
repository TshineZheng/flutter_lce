// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lce_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LCEStore on _LCEStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_LCEStoreBase.loading'))
      .value;
  Computed<bool>? _$progressComputed;

  @override
  bool get progress => (_$progressComputed ??=
          Computed<bool>(() => super.progress, name: '_LCEStoreBase.progress'))
      .value;

  late final _$progressTriggerAtom =
      Atom(name: '_LCEStoreBase.progressTrigger', context: context);

  @override
  bool get progressTrigger {
    _$progressTriggerAtom.reportRead();
    return super.progressTrigger;
  }

  @override
  set progressTrigger(bool value) {
    _$progressTriggerAtom.reportWrite(value, super.progressTrigger, () {
      super.progressTrigger = value;
    });
  }

  late final _$lceRetryAtom =
      Atom(name: '_LCEStoreBase.lceRetry', context: context);

  @override
  LCERetry? get lceRetry {
    _$lceRetryAtom.reportRead();
    return super.lceRetry;
  }

  @override
  set lceRetry(LCERetry? value) {
    _$lceRetryAtom.reportWrite(value, super.lceRetry, () {
      super.lceRetry = value;
    });
  }

  late final _$navAnimDoneAtom =
      Atom(name: '_LCEStoreBase.navAnimDone', context: context);

  @override
  bool get navAnimDone {
    _$navAnimDoneAtom.reportRead();
    return super.navAnimDone;
  }

  @override
  set navAnimDone(bool value) {
    _$navAnimDoneAtom.reportWrite(value, super.navAnimDone, () {
      super.navAnimDone = value;
    });
  }

  late final _$_LCEStoreBaseActionController =
      ActionController(name: '_LCEStoreBase', context: context);

  @override
  void progressStart() {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.progressStart');
    try {
      return super.progressStart();
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void progressEnd() {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.progressEnd');
    try {
      return super.progressEnd();
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showDialog({String? title, required String msg, String? button}) {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.showDialog');
    try {
      return super.showDialog(title: title, msg: msg, button: button);
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showRetry(
      {RetryFunction? onRetry, String? message, String? title, dynamic error}) {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.showRetry');
    try {
      return super.showRetry(
          onRetry: onRetry, message: message, title: title, error: error);
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showError(dynamic err, [StackTrace? stackTrace]) {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.showError');
    try {
      return super.showError(err, stackTrace);
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showToast(String msg) {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.showToast');
    try {
      return super.showToast(msg);
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
progressTrigger: ${progressTrigger},
lceRetry: ${lceRetry},
navAnimDone: ${navAnimDone},
loading: ${loading},
progress: ${progress}
    ''';
  }
}
