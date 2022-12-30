import 'package:mobx/mobx.dart';

extension ObfPendingExt on ObservableFuture {
  bool get pending => status == FutureStatus.pending;
}

extension Future2ObfExt<T> on Future<T> {
  /// Future 转换为 ObservableFuture
  ObservableFuture<T> get obf => OBF(this);
}

/// 方便新建一个 ObservableFuture
// ignore: non_constant_identifier_names
ObservableFuture<T> OBF<T>([Future<T>? future]) =>
    ObservableFuture<T>(future ?? ObservableFuture<T>.error(0));
