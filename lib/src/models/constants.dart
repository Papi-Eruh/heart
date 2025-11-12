abstract class Constants {
  static const double vRadius = 12;
  static const double vPadding = 8;
  static const double bottomNavBarHeight = 56;
  static const Duration bounceDuration = Duration(milliseconds: 350);

  /// Inner view animation duration
  static const Duration viewAnimDuration = Duration(milliseconds: 800);

  /// Horizontal page view animation duration
  static const Duration hpvAnimDuration = Duration(milliseconds: 400);

  /// time to see something after animation
  static const Duration gapDuration = Duration(milliseconds: 200);

  /// To have delay between measures
  static const Duration animDelay = Duration(milliseconds: 400);

  static const Duration pageDelayAnimationDuration =
      Duration(milliseconds: 300);

  static const Duration bottomSheetDuration = Duration(milliseconds: 300);

  static const Duration bouncyIntroDuration = Duration(milliseconds: 600);

  static const String searchHero = 'search_hero';

  static const Duration visibilityDuration = Duration(milliseconds: 600);

  static const Duration keyboardDuration = Duration(milliseconds: 450);

  static const Duration fcButtonsGuardDuration = Duration(milliseconds: 1500);

  static const ancPauseWidgetsDuration = Duration(milliseconds: 250);

  static const maxQrAncScanCount = 3;
}

typedef Json = Map<String, dynamic>;
typedef FileReaderFn = Future<String> Function(String key, {bool cache});
typedef Undisguise = String Function(String content);
