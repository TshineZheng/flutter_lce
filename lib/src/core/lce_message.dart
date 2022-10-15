class LCEMessage {
  final String message;
  final Duration? duration;
  final String? dialogTitle;
  final String? dialogButton;

  LCEMessage(
    this.message, {
    this.duration,
    this.dialogTitle,
    this.dialogButton,
  });

  bool get isDialog => dialogButton != null && dialogButton!.isNotEmpty;
}

typedef RetryFunction = Future Function();

class LCERetry {
  final String message;
  final RetryFunction? onRetry;
  final String? title;

  LCERetry(this.message, {this.title, this.onRetry});
}
