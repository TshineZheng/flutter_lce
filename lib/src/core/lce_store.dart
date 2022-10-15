import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import '../../lce.dart';

part 'lce_store.g.dart';

/// LOAD CONTENT ERROR
class LCEStore = LCEStoreBase with _$LCEStore;

abstract class LCEStoreBase with Store {
  /// 是否加载中
  @computed
  bool get loading => progress;

  /// 显示转圈
  @computed
  bool get progress => progressTrigger;

  /// 手动触发转圈圈
  @observable
  bool progressTrigger = false;

  /// 页面导航动画是否结束
  @observable
  bool navAnimDone = false;

  @observable
  LCERetry? lceRetry;

  @observable
  LCEMessage? lceMessage;

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

  /// [onRetry] 要返回一个 Future，比如：()=>futureFun()
  ///
  /// futureFun 的签名：Future futureFun({parameters}) async
  ///
  /// [title] 对话框标题，[message] 对话框信息，[error] 实际错误信息。
  @action
  void showRetry(String message, {RetryFunction? onRetry, String? title}) {
    lceRetry = LCERetry(
      message,
      onRetry: onRetry,
      title: title,
    );
  }

  @action
  void showMsg(String msg, {Duration? duration}) => lceMessage = LCEMessage(
        msg,
        duration: duration,
      );

  /// 显示对话框 [title] 对话框标题，[msg] 对话框内容，[button] 对话框按钮
  @action
  void showMsgDlg(String msg, {String? title, String? button}) => lceMessage = LCEMessage(
        msg,
        dialogTitle: title,
        dialogButton: button,
      );

  @mustCallSuper
  void dispose() {
    lceRetry = null;
    lceMessage = null;
  }
}
