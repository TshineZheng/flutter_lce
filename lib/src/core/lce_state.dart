import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lce/lce.dart';
import 'package:lce/src/utils/logger.dart';
import 'package:mobx/mobx.dart';

abstract class LCEState<W extends StatefulWidget, S extends LCEStore> extends State<W>
    with RouteAware, AutomaticKeepAliveClientMixin {
  List<ReactionDisposer>? _lceDisposers;

  /// 是否在前台展示
  bool get showing => _showing;
  bool _showing = false;

  S get store => _store;
  late S _store;

  @override
  bool get wantKeepAlive => _wantKeepAlive;
  late bool _wantKeepAlive;

  @mustCallSuper
  LCEState({bool wantKeepAlive = false}) : super() {
    _store = initStore();
    _wantKeepAlive = wantKeepAlive;
  }

  S initStore();

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _lceDisposers ??= [
      reaction((_) => store.lceMessage, _showLCEMessage),
      reaction((_) => store.lceRetry, showRetry),
      reaction((_) => globalLCE.lceMessage, (v) {
        if (!showing) return;
        _showLCEMessage(v);
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

  void _showLCEMessage(LCEMessage? msg) {
    if (msg == null) return;
    if (msg.isDialog == true) {
      showMessageDialog(
        msg.message,
        title: msg.dialogTitle,
        buttonText: msg.dialogButton,
      );
    } else {
      showMessage(msg.message, msg.duration);
    }
  }

  /// show message toast
  void showMessage(String msg, [Duration? duration]) {
    if (msg.isEmpty) return;
    LCEDelegate.showToast(context, msg, duration);
  }

  /// show message dialog with 'confirm' button
  void showMessageDialog(String msg, {String? title, String? buttonText}) {
    if (msg.isEmpty) return;

    var dialog = LCEDelegate.showMessageDialogFunction(context, msg, title, buttonText);
    showDialog(context: context, builder: (_) => dialog);
  }

  /// show retry dialog
  void showRetry(LCERetry? retry) {
    if (null == retry) return;
    LCEDelegate.showRetryFunction(context, retry);
  }

  bool anmListen = false;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);

    anmListen = true;

    /// 监听导航动画是否播放完毕
    var route = ModalRoute.of(context) as ModalRoute<dynamic>;
    void handler(status) {
      if (status == AnimationStatus.completed) {
        logger.d('AnimationStatus.completed');
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
