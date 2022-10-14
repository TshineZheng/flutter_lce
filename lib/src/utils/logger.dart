import 'package:flutter/cupertino.dart';

final logger = Logger();

class Logger {
  void d(String msg) {
    debugPrint(msg);
  }
}
