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

  late final _$_lceRetryAtom =
      Atom(name: '_LCEStoreBase._lceRetry', context: context);

  LCERetry? get lceRetry {
    _$_lceRetryAtom.reportRead();
    return super._lceRetry;
  }

  @override
  LCERetry? get _lceRetry => lceRetry;

  @override
  set _lceRetry(LCERetry? value) {
    _$_lceRetryAtom.reportWrite(value, super._lceRetry, () {
      super._lceRetry = value;
    });
  }

  late final _$_lceMessageAtom =
      Atom(name: '_LCEStoreBase._lceMessage', context: context);

  LCEMessage? get lceMessage {
    _$_lceMessageAtom.reportRead();
    return super._lceMessage;
  }

  @override
  LCEMessage? get _lceMessage => lceMessage;

  @override
  set _lceMessage(LCEMessage? value) {
    _$_lceMessageAtom.reportWrite(value, super._lceMessage, () {
      super._lceMessage = value;
    });
  }

  late final _$_LCEStoreBaseActionController =
      ActionController(name: '_LCEStoreBase', context: context);

  @override
  void showRetry(String message, {Function? onRetry, String? title}) {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.showRetry');
    try {
      return super.showRetry(message, onRetry: onRetry, title: title);
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showMessage(String msg, {Duration? duration}) {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.showMessage');
    try {
      return super.showMessage(msg, duration: duration);
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showMessageDialog(String msg, {String? title, String? button}) {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.showMessageDialog');
    try {
      return super.showMessageDialog(msg, title: title, button: button);
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_LCEStoreBaseActionController.startAction(
        name: '_LCEStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
progressTrigger: ${progressTrigger},
navAnimDone: ${navAnimDone},
loading: ${loading},
progress: ${progress}
    ''';
  }
}
