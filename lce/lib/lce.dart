library lce;

export 'src/core/lce_ext.dart';
export 'src/core/lce_message.dart';
export 'src/core/lce_state.dart';
export 'src/core/lce_store.dart';

import 'package:flutter/material.dart';
import 'src/core/lce_message.dart';
import 'src/core/lce_store.dart';

var globalLCE = LCEStore();

final lceRouteObserver = RouteObserver<PageRoute>();

typedef ShowMessageFunction = void Function(BuildContext context, String msg, Duration? duration);

typedef ShowMessageDialogFunction = AlertDialog Function(
    BuildContext context, String msg, String? title, String? dialogButton);

typedef ShowRetryFunction = void Function(BuildContext context, LCERetry retry);

class LCEDelegate {
  LCEDelegate._();

  static Widget loadingWidget = Container(
    height: 100,
    constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(color: Colors.transparent),
    child: FittedBox(
      fit: BoxFit.none,
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: const Padding(
            padding: EdgeInsets.all(25.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    ),
  );

  static ShowMessageFunction showToast = (context, msg, Duration? duration) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: duration ?? const Duration(seconds: 1),
    ));
  };

  static ShowMessageDialogFunction showMessageDialogFunction = (context, msg, title, buttonText) {
    return AlertDialog(
      title: null == title ? null : Text(title),
      content: Text(msg),
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.pop(context), child: Text(buttonText ?? 'OK')),
      ],
    );
  };

  static ShowRetryFunction showRetryFunction = (context, retry) {
    var dialog = AlertDialog(
      title: null == retry.title ? null : Text(retry.title!),
      content: Text(retry.message),
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.pop(context, 0), child: const Text('CANCEL')),
        TextButton(onPressed: () => Navigator.pop(context, 1), child: const Text('RETRY')),
      ],
    );

    showDialog(context: context, builder: (_) => dialog).then((v) async {
      if (v == 1 && retry.onRetry != null) {
        retry.onRetry!();
      }
    });
  };
}
