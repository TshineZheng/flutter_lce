import 'package:mobx/mobx.dart';
part 'msg_store.g.dart';

// ignore: library_private_types_in_public_api
class MsgStore = _MsgStore with _$MsgStore;

abstract class _MsgStore with Store {
  late List<ReactionDisposer> _disposers;

  _MsgStore() {
    _disposers = [
      reaction((_) => message, resetMessage, delay: 200), // 此处 200 秒会存在不清理的问题，比如用户快速点击触发错误的时候。
      reaction((_) => dialogMsg, resetDialogMsg, delay: 200),
    ];
  }

  @observable
  String? message = '';

  @observable
  String? dialogMsg;

  @observable
  String? dialogTitle;

  @observable
  String? dialogButton;

  @action
  void setErrorMessage(String message) {
    this.message = message;
  }

  @action
  void resetMessage(String? value) {
    message = '';
  }

  @action
  void error(dynamic err, [StackTrace? stackTrace]) {
    // final errorMsg = DioErrorUtil.handleError(err);
    if (null != err) {
      // message = errorMsg;
      message = err.toString();
    }
  }

  @action
  void resetDialogMsg(String? msg) {
    dialogMsg = null;
    dialogTitle = null;
    dialogButton = '知道了';
  }

  @action
  void showDialog({String? title, required String? msg, String? button}) {
    dialogTitle = title;
    dialogButton = button;
    dialogMsg = msg;
  }

  @action
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
