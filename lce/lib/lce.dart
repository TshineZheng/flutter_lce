library lce;

import 'package:flutter/widgets.dart';

import 'lce.dart';

export 'src/core/lce_ext.dart';
export 'src/core/lce_message.dart';
export 'src/core/lce_state.dart';
export 'src/core/lce_store.dart';

var globalLCE = LCEStore();

final lceRouteObserver = RouteObserver<PageRoute>();
