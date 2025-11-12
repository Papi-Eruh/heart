import 'dart:async';

import 'package:heart/src/callbacks/callbacks.dart';

class ErdTimer {
  ErdTimer();

  Timer? _timer;

  bool get isActive => _timer?.isActive ?? false;

  /// Return true when it has started timer.
  /// False when already running.
  bool mayRun({required Duration duration, VoidCallback? action}) {
    if (isActive) return false;
    _timer = Timer(duration, action ?? () {});
    return true;
  }
}
