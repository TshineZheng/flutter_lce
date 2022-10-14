import 'package:mobx/mobx.dart';

extension ObservableFutureExtension on ObservableFuture {
  bool get pending => status == FutureStatus.pending;
}

extension FutureExtension<T> on Future<T> {
  /// Future 转换为 ObservableFuture
  // ObservableFuture<T> get obf => OBF<T>(this);
  ObservableFuture<T> get obf => OBF<T>(this);
}

/// 方便新建一个 ObservableFuture
// ignore: non_constant_identifier_names
ObservableFuture<T> OBF<T>([Future<T>? future]) =>
    ObservableFuture<T>(future ?? ObservableFuture.value(null) as Future<T>);
