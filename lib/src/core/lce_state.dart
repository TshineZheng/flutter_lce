import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';

abstract class LCEState<W extends StatefulWidget, S extends LCEStore> extends State<W> with RouteAware {
  List<ReactionDisposer>? _lceDisposers;

  /// 是否在前台展示
  bool get showing => _showing;
  bool _showing = false;

  final store = GetIt.instance<S>();

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _lceDisposers ??= [
      reaction((_) => store.lceMessage, _showLCEMsg),
      reaction((_) => store.lceRetry, showRetry),
      reaction((_) => globalLCE.lceMessage, (v) {
        if (!showing) return;
        _showLCEMsg(v);
      }),
      reaction((_) => globalLCE.lceRetry, (v) {
        if (!showing) return;
        showRetry(v);
      }),
    ];

    if (ModalRoute.of(context) is PageRoute) {
      lceRouteObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
    }

    super.didChangeDependencies();
  }

  /// show message toast
  void showMsg(String? msg, [Duration? duration]) {
    if (null == msg || msg.isEmpty) return;
    LCEDelegate.showToast(context, msg, duration);
  }

  /// show message dialog with 'confirm' button
  void showMsgDlg(String msg, {String? title, String? buttonText}) {
    if (msg.isEmpty) return;

    var dialog = LCEDelegate.showMessageDialogFunction(context, msg, title, buttonText);
    showDialog(context: context, builder: (_) => dialog);
  }

  void _showLCEMsg(LCEMessage? msg) {
    if (msg == null) return;
    if (msg.isDialog == true) {
      showMsgDlg(
        msg.message,
        title: msg.dialogTitle,
        buttonText: msg.dialogButton,
      );
    } else {
      showMsg(msg.message, msg.duration);
    }
  }

  /// show retry dialog
  void showRetry(LCERetry? retry) {
    if (null == retry) return;
    LCEDelegate.showRetryFunction(context, retry);
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    /// 监听导航动画是否播放完毕
    var route = ModalRoute.of(context) as ModalRoute<dynamic>;
    void handler(status) {
      if (status == AnimationStatus.completed) {
        store.navAnimDone = true;
        route.animation?.removeStatusListener(handler);
      }
    }

    route.animation?.addStatusListener(handler);

    return Container(
      color: Colors.red,
      child: Stack(
        children: <Widget>[
          buildContent(context),
          _buildLoadingView(),
        ],
      ),
    );
  }

  /// 加载进度条，通过 [store.progress] 变量驱动
  Observer _buildLoadingView() {
    return Observer(builder: (context) {
      return Visibility(
        visible: store.progress || globalLCE.progress,
        child: LCEDelegate.loadingWidget,
      );
    });
  }

  @override
  @mustCallSuper
  void didPopNext() {
    _showing = true;
  }

  @override
  @mustCallSuper
  void didPush() {
    _showing = true;
  }

  @override
  @mustCallSuper
  void didPop() {
    _showing = false;
  }

  @override
  @mustCallSuper
  void didPushNext() {
    _showing = false;
  }

  @override
  @mustCallSuper
  void dispose() {
    _lceDisposers?.forEach((element) => element());
    store.dispose();
    lceRouteObserver.unsubscribe(this);
    super.dispose();
  }

  Widget buildContent(BuildContext context);
}
