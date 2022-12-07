import 'package:flutter/cupertino.dart';

final logger = Logger._();

class Logger {
  Logger._();
  void d(String msg) {
    debugPrint(msg);
  }
}
