import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lce/lce.dart';
import 'package:lce/src/utils/logger.dart';
import 'package:mobx/mobx.dart';

abstract class LCEState<W extends StatefulWidget, S extends LCEStore>
    extends LCEStateBase<W, S> {
  @override
  void showMessage(LCEMessage msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg.message),
      duration: msg.duration ?? const Duration(seconds: 1),
    ));
  }

  @override
  void showMessageDialog(LCEMessage msg) {
    final dialog = AlertDialog(
      title: null == msg.dialogTitle ? null : Text(msg.dialogTitle!),
      content: Text(msg.message),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(msg.dialogButton ?? 'OK')),
      ],
    );

    showDialog(context: context, builder: (_) => dialog);
  }

  @override
  void showRetry(LCERetry retry) {
    var dialog = AlertDialog(
      title: null == retry.title ? null : Text(retry.title!),
      content: Text(retry.message),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context, 0),
            child: const Text('CANCEL')),
        TextButton(
            onPressed: () => Navigator.pop(context, 1),
            child: const Text('RETRY')),
      ],
    );

    showDialog(context: context, builder: (_) => dialog).then((v) async {
      if (v == 1 && retry.onRetry != null) {
        retry.onRetry!();
      }
    });
  }

  @override
  Widget buildLoadingView() {
    return Container(
      height: 100,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: FittedBox(
        fit: BoxFit.none,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: const Padding(
              padding: EdgeInsets.all(25.0),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

abstract class LCEStateBase<W extends StatefulWidget, S extends LCEStore>
    extends State<W> with RouteAware, AutomaticKeepAliveClientMixin {
  List<ReactionDisposer>? _lceDisposers;

  /// 是否在前台展示
  bool get showing => _showing;
  bool _showing = false;

  S get store => _store;
  late S _store;

  @override
  bool get wantKeepAlive => _wantKeepAlive;
  late bool _wantKeepAlive;

  LCEStateBase({bool wantKeepAlive = false}) : super() {
    _store = buildStore();
    _wantKeepAlive = wantKeepAlive;
  }

  S buildStore();

  @override
  @mustCallSuper
  void didChangeDependencies() {
    _lceDisposers ??= [
      reaction((_) => store.lceMessage, _showLCEMessage),
      reaction((_) => store.lceRetry, _showLCERetry),
      reaction((_) => globalLCE.lceMessage, (v) {
        if (!showing) return;
        _showLCEMessage(v);
      }),
      reaction((_) => globalLCE.lceRetry, (v) {
        if (!showing) return;
        _showLCERetry(v);
      }),
    ];

    if (ModalRoute.of(context) is PageRoute) {
      lceRouteObserver.subscribe(
          this, ModalRoute.of(context) as PageRoute<dynamic>);
    }

    super.didChangeDependencies();
  }

  void _showLCEMessage(LCEMessage? msg) {
    if (msg == null) return;
    if (msg.message.isEmpty) return;

    if (msg.isDialog == true) {
      showMessageDialog(msg);
    } else {
      showMessage(msg);
    }
  }

  void _showLCERetry(LCERetry? retry) {
    if (null == retry) return;
    showRetry(retry);
  }

  /// show message toast
  void showMessage(LCEMessage msg);

  /// show message dialog with 'confirm' button
  void showMessageDialog(LCEMessage msg);

  /// show retry dialog
  void showRetry(LCERetry retry);

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
          Observer(
            builder: (context) => Visibility(
              visible: store.progress || globalLCE.progress,
              child: buildLoadingView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context);

  /// 加载进度条，通过 [store.progress] 变量驱动
  Widget buildLoadingView();

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
}
