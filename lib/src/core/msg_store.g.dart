// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MsgStore on _MsgStore, Store {
  late final _$messageAtom = Atom(name: '_MsgStore.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$dialogMsgAtom =
      Atom(name: '_MsgStore.dialogMsg', context: context);

  @override
  String? get dialogMsg {
    _$dialogMsgAtom.reportRead();
    return super.dialogMsg;
  }

  @override
  set dialogMsg(String? value) {
    _$dialogMsgAtom.reportWrite(value, super.dialogMsg, () {
      super.dialogMsg = value;
    });
  }

  late final _$dialogTitleAtom =
      Atom(name: '_MsgStore.dialogTitle', context: context);

  @override
  String? get dialogTitle {
    _$dialogTitleAtom.reportRead();
    return super.dialogTitle;
  }

  @override
  set dialogTitle(String? value) {
    _$dialogTitleAtom.reportWrite(value, super.dialogTitle, () {
      super.dialogTitle = value;
    });
  }

  late final _$dialogButtonAtom =
      Atom(name: '_MsgStore.dialogButton', context: context);

  @override
  String? get dialogButton {
    _$dialogButtonAtom.reportRead();
    return super.dialogButton;
  }

  @override
  set dialogButton(String? value) {
    _$dialogButtonAtom.reportWrite(value, super.dialogButton, () {
      super.dialogButton = value;
    });
  }

  late final _$_MsgStoreActionController =
      ActionController(name: '_MsgStore', context: context);

  @override
  void setErrorMessage(String message) {
    final _$actionInfo = _$_MsgStoreActionController.startAction(
        name: '_MsgStore.setErrorMessage');
    try {
      return super.setErrorMessage(message);
    } finally {
      _$_MsgStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetMessage(String? value) {
    final _$actionInfo =
        _$_MsgStoreActionController.startAction(name: '_MsgStore.resetMessage');
    try {
      return super.resetMessage(value);
    } finally {
      _$_MsgStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void error(dynamic err, [StackTrace? stackTrace]) {
    final _$actionInfo =
        _$_MsgStoreActionController.startAction(name: '_MsgStore.error');
    try {
      return super.error(err, stackTrace);
    } finally {
      _$_MsgStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDialogMsg(String? msg) {
    final _$actionInfo = _$_MsgStoreActionController.startAction(
        name: '_MsgStore.resetDialogMsg');
    try {
      return super.resetDialogMsg(msg);
    } finally {
      _$_MsgStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showDialog({String? title, required String? msg, String? button}) {
    final _$actionInfo =
        _$_MsgStoreActionController.startAction(name: '_MsgStore.showDialog');
    try {
      return super.showDialog(title: title, msg: msg, button: button);
    } finally {
      _$_MsgStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo =
        _$_MsgStoreActionController.startAction(name: '_MsgStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_MsgStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
dialogMsg: ${dialogMsg},
dialogTitle: ${dialogTitle},
dialogButton: ${dialogButton}
    ''';
  }
}
