import 'dart:async';

import 'package:heart/src/models/constants.dart';

typedef VoidCallback = void Function();

/// Function to call that give a Value [T]
typedef GetValue<T> = T Function();

typedef ValueChanged<T> = void Function(T value);

/// Extension to chain callbacks.
extension ChainingCallback on VoidCallback? {
  /// Chain this with another [callback].
  VoidCallback chain(VoidCallback? callback) {
    return () {
      this?.call();
      callback?.call();
    };
  }

  VoidCallback afterBounceChain(VoidCallback? callback, {Duration? duration}) {
    return () {
      this?.call();
      Future.delayed(duration ?? Constants.bounceDuration, callback);
    };
  }
}

/// Wrap with try catch to let continue if throw.
FutureOr<void> tryContinue(FutureOr<void> Function() callback) async {
  try {
    return await callback();
  } catch (_) {
    //do nothing
  }
}
