import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../lce.dart';

part 'lce_store.g.dart';

/// LOAD CONTENT ERROR
class LCEStore extends _LCEStoreBase with _$LCEStore {}

abstract class _LCEStoreBase with Store {
  /// 是否加载中
  @computed
  bool get loading => progress;

  /// 显示转圈
  @computed
  bool get progress => progressTrigger;

  /// 手动触发转圈圈
  ///
  /// 最好别用，如果存在多个异步时，可能会冲突。需要自己处理冲突关系
  @observable
  bool progressTrigger = false;

  /// 页面导航动画是否结束
  @observable
  bool navAnimDone = false;

  @readonly
  LCERetry? _lceRetry;

  @readonly
  LCEMessage? _lceMessage;

  /// [onRetry] 要返回一个 Future，比如：()=>futureFun()
  ///
  /// futureFun 的签名：Future futureFun({parameters}) async
  ///
  /// [title] 对话框标题，[message] 对话框信息，[error] 实际错误信息。
  @action
  void showRetry(String message, {Function? onRetry, String? title}) {
    _lceRetry = LCERetry(
      message,
      onRetry: onRetry,
      title: title,
    );
  }

  @action
  void showMessage(String msg, {Duration? duration}) =>
      _lceMessage = LCEMessage(
        msg,
        duration: duration,
      );

  /// 显示对话框 [title] 对话框标题，[msg] 对话框内容，[button] 对话框按钮
  @action
  void showMessageDialog(String msg, {String? title, String? button}) =>
      _lceMessage = LCEMessage(
        msg,
        dialogTitle: title,
        dialogButton: button,
        isDialog: true,
      );

  @action
  @mustCallSuper
  void dispose() {
    _lceRetry = null;
    _lceMessage = null;
  }
}
