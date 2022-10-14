import 'package:lce/lce.dart';
import 'package:mobx/mobx.dart';
part 'lce_retry.g.dart';

// ignore: library_private_types_in_public_api
class LCERetry = _LCERetryBase with _$LCERetry;

typedef RetryFunction = Future Function();

abstract class _LCERetryBase with Store {
  final RetryFunction? onRetry;
  final String message;
  final String? title;

  // ignore: unused_element
  _LCERetryBase({this.title, this.onRetry, this.message = ''});
}

/// [onRetry] 要返回一个 Future，比如：()=>futureFun()
///
/// futureFun 的签名：Future futureFun({parameters}) async
///
/// [title] 对话框标题，[message] 对话框信息，[error] 实际错误信息。
LCERetry genRetry({RetryFunction? onRetry, String? message, String? title, dynamic error}) {
  var sb = StringBuffer();

  if (null != message) sb.write(message);

  if (null != error) {
    sb.write(LCEDelegate.errorDecode(error));
  }

  return LCERetry(
    onRetry: onRetry,
    message: sb.toString(),
    title: title,
  );
}
