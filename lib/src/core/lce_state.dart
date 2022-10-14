import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';
import '../utils/logger.dart';

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
      reaction((_) => store.msgStore.message, showToast),
      reaction((_) => store.lceRetry, showRetry),
      reaction(
        (_) => store.msgStore.dialogMsg,
        (dynamic v) => messageDialog(
          msg: v,
          title: store.msgStore.dialogTitle,
          buttonText: store.msgStore.dialogButton,
        ),
      ),
      reaction((_) => globalLCE.lceRetry, (dynamic v) {
        if (!showing || null == v) return;
        logger.d('$runtimeType show global retry');
        showRetry(v);
      }),
      reaction((_) => globalLCE.msgStore.dialogMsg, (dynamic v) {
        if (!showing || null == v) return;
        logger.d('$runtimeType show global messageDialog');
        var es = globalLCE.msgStore;
        messageDialog(msg: es.dialogMsg, title: es.dialogTitle, buttonText: es.dialogButton);
      }),
      reaction((_) => globalLCE.msgStore.message, showToast),
    ];

    if (ModalRoute.of(context) is PageRoute) {
      lceRouteObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
    }

    super.didChangeDependencies();
  }

  /// 重试对话框
  void showRetry(LCERetry? retry) {
    if (null == retry) return;
    LCEDelegate.showRetryFunction(context, retry);
  }

  /// 单选项对话框
  void messageDialog({String? msg, String? title, String? buttonText}) {
    if (null == msg || msg == '') return;
    var dialog = LCEDelegate.showMessageDialogFunction(context, msg, title, buttonText);
    showDialog(context: context, builder: (_) => dialog);
  }

  /// 显示错误信息
  void showToast(String? msg) {
    if (null == msg || msg == '') return;
    LCEDelegate.showToast(context, msg);
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
