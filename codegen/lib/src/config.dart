import 'package:build/build.dart';

class Config {
  final String weakCatchSuffix;
  final String strongCatchSuffix;
  final String retryCatchSuffix;

  static const _defaultWeak = '\$catch';
  static const _defaultStrong = '\$\$catch';
  static const _defaultRetry = '\$retry';

  Config({
    this.weakCatchSuffix = _defaultWeak,
    this.strongCatchSuffix = _defaultStrong,
    this.retryCatchSuffix = _defaultRetry,
  });

  factory Config.fromMap(Map map) {
    return Config(
      weakCatchSuffix: map['weakCatchSuffix'] ?? _defaultWeak,
      strongCatchSuffix: map['strongCatchSuffix'] ?? _defaultStrong,
      retryCatchSuffix: map['retryCatchSuffix'] ?? _defaultRetry,
    );
  }

  factory Config.fromBuilderOptions(BuilderOptions options) {
    return Config.fromMap(options.config);
  }
}
