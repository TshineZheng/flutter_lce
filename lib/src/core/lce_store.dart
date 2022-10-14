import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'msg_store.dart';
import 'lce_retry.dart';

part 'lce_store.g.dart';

/// LOAD CONTENT ERROR
// ignore: library_private_types_in_public_api
class LCEStore = _LCEStoreBase with _$LCEStore;

abstract class _LCEStoreBase with Store {
  final MsgStore msgStore = MsgStore();

  /// 是否加载中
  @computed
  bool get loading => progress;

  /// 显示转圈
  @computed
  bool get progress => progressTrigger;

  /// 手动触发转圈圈
  @observable
  bool progressTrigger = false;

  @observable
  LCERetry? lceRetry;

  /// 页面导航动画是否结束
  @observable
  bool navAnimDone = false;

  @mustCallSuper
  void dispose() {
    msgStore.dispose();
  }

  /// 显示加载转圈圈，这个函数最好别用，如果存在多个异步时，可能会冲突。需要自己处理冲突关系
  @action
  void progressStart() {
    progressTrigger = true;
  }

  /// 关闭加载转圈圈
  @action
  void progressEnd() {
    progressTrigger = false;
  }

  /// 显示对话框 [title] 对话框标题，[msg] 对话框内容，[button] 对话框按钮
  @action
  void showDialog({String? title, required String msg, String? button}) {
    msgStore.showDialog(msg: msg, title: title, button: button);
  }

  /// [onRetry] 要返回一个 Future，比如：()=>futureFun()
  ///
  /// futureFun 的签名：Future futureFun({parameters}) async
  ///
  /// [title] 对话框标题，[message] 对话框信息，[error] 实际错误信息。
  @action
  void showRetry({RetryFunction? onRetry, String? message, String? title, dynamic error}) {
    // if (error != null) logger.e('$title -> $message', error);
    lceRetry = genRetry(
      onRetry: onRetry,
      message: message,
      title: title,
      error: error,
    );
  }

  @action
  void showError(dynamic err, [StackTrace? stackTrace]) {
    msgStore.error(err, stackTrace);
  }

  @action
  void showToast(String msg) => msgStore.message = msg;
}
