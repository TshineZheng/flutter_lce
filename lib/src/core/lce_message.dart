class LCEMessage {
  final String message;
  final Duration? duration;
  final bool isDialog;
  final String? dialogTitle;
  final String? dialogButton;

  LCEMessage(
    this.message, {
    this.duration,
    this.dialogTitle,
    this.dialogButton,
    this.isDialog = false,
  });
}

typedef RetryFunction = Future Function();

class LCERetry {
  final String message;
  final RetryFunction? onRetry;
  final String? title;

  LCERetry(this.message, {this.title, this.onRetry});
}
