// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lce_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LCEStore on LCEStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: 'LCEStoreBase.loading'))
      .value;
  Computed<bool>? _$progressComputed;

  @override
  bool get progress => (_$progressComputed ??=
          Computed<bool>(() => super.progress, name: 'LCEStoreBase.progress'))
      .value;

  late final _$progressTriggerAtom =
      Atom(name: 'LCEStoreBase.progressTrigger', context: context);

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
      Atom(name: 'LCEStoreBase.navAnimDone', context: context);

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

  late final _$lceRetryAtom =
      Atom(name: 'LCEStoreBase.lceRetry', context: context);

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

  late final _$lceMessageAtom =
      Atom(name: 'LCEStoreBase.lceMessage', context: context);

  @override
  LCEMessage? get lceMessage {
    _$lceMessageAtom.reportRead();
    return super.lceMessage;
  }

  @override
  set lceMessage(LCEMessage? value) {
    _$lceMessageAtom.reportWrite(value, super.lceMessage, () {
      super.lceMessage = value;
    });
  }

  late final _$LCEStoreBaseActionController =
      ActionController(name: 'LCEStoreBase', context: context);

  @override
  void progressStart() {
    final _$actionInfo = _$LCEStoreBaseActionController.startAction(
        name: 'LCEStoreBase.progressStart');
    try {
      return super.progressStart();
    } finally {
      _$LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void progressEnd() {
    final _$actionInfo = _$LCEStoreBaseActionController.startAction(
        name: 'LCEStoreBase.progressEnd');
    try {
      return super.progressEnd();
    } finally {
      _$LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showRetry(String message, {Function? onRetry, String? title}) {
    final _$actionInfo = _$LCEStoreBaseActionController.startAction(
        name: 'LCEStoreBase.showRetry');
    try {
      return super.showRetry(message, onRetry: onRetry, title: title);
    } finally {
      _$LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showMessage(String msg, {Duration? duration}) {
    final _$actionInfo = _$LCEStoreBaseActionController.startAction(
        name: 'LCEStoreBase.showMessage');
    try {
      return super.showMessage(msg, duration: duration);
    } finally {
      _$LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showMessageDialog(String msg, {String? title, String? button}) {
    final _$actionInfo = _$LCEStoreBaseActionController.startAction(
        name: 'LCEStoreBase.showMessageDialog');
    try {
      return super.showMessageDialog(msg, title: title, button: button);
    } finally {
      _$LCEStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
progressTrigger: ${progressTrigger},
navAnimDone: ${navAnimDone},
lceRetry: ${lceRetry},
lceMessage: ${lceMessage},
loading: ${loading},
progress: ${progress}
    ''';
  }
}
