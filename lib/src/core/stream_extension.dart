import 'package:rxdart/rxdart.dart';

/// Provides utilities for conditionally switching between streams.
///
/// Adds [whenTrueSwitchTo], which allows reacting to another stream
/// only when the current boolean stream emits `true`.
extension ConditionalSwitchMap on Stream<bool> {
  /// Switches to [other] when this stream emits `true`.
  ///
  /// When the latest value emitted by this boolean stream is `true`,
  /// the resulting stream mirrors [other].
  /// When it's `false`, the resulting stream stays silent (emits nothing).
  ///
  /// Example:
  /// ```dart
  /// final isVisibleStream = Stream<bool>.fromIterable([false, true, false]);
  /// final dataStream = Stream<String>.periodic(Duration(seconds: 1), (_) => 'tick');
  ///
  /// final visibleDataStream = isVisibleStream.whenTrueSwitchTo(dataStream);
  ///
  /// visibleDataStream.listen(print); // prints 'tick' only while isVisible is true
  /// ```
  ///
  /// This is particularly useful for UI state management, where a child
  /// widget should only react to another stream while a certain condition holds.
  Stream<T> whenTrueSwitchTo<T>(Stream<T> other) {
    return switchMap((isTrue) => isTrue ? other : const Stream.empty());
  }
}
