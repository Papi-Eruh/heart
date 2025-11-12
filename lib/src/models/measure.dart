import 'package:heart/heart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'measure.freezed.dart';

part 'measure.g.dart';

@freezed
class IMeasure with _$IMeasure {
  /// id start at 1 & is displayed to the user
  const factory IMeasure.rive({
    required int id,
    required String file,
    required String voice,
    required String textFile,
  }) = RiveMeasure;

  /// Erd measures
  const factory IMeasure.eruhTalking({
    required int id,
    required String voice,
    required String textFile,
    ErdBgTrigger? trigger,
  }) = EruhTalkingMeasure;

  const factory IMeasure.worldMap({
    required int id,
    required String countryCode,
    required String voice,
    required String textFile,
  }) = WorldMapMeasure;

  const factory IMeasure.boatTrip({
    required int id,
    required String voice,
    required String textFile,
    required List<BoatIsland> islands,
    required int indexIsland,
  }) = BoatTripMeasure;

  const factory IMeasure.boatStart({
    required int id,
    required String voice,
    required String textFile,
  }) = BoatStartMeasure;

  const IMeasure._();

  factory IMeasure.fromJson(Map<String, dynamic> json) =>
      _$IMeasureFromJson(json);

  List<String> get localPathList {
    final filepath = mapOrNull<String>(
        //todo
        );
    return [voice, textFile, if (filepath != null) filepath];
  }

  bool get showCaptions {
    return true;
  }

  bool get hasSound {
    return false;
  }

  Iterable<String> assetPaths({required String language}) {
    final filepath = mapOrNull<String>();
    return [
      'assets/voices/$language-$voice',
      'assets/captions/$language-$textFile.json',
      if (filepath != null) filepath,
    ];
  }

  T accept<T>(IMeasureVisitor<T> visitor) {
    return map(
      rive: (value) => visitor.visitRiveMeasure(value),
      eruhTalking: (value) => visitor.visitEruhTalking(value),
      worldMap: (value) => visitor.visitWorldMap(value),
      boatTrip: (value) => visitor.visitBoatTrip(value),
      boatStart: (value) => visitor.visitBoatStart(value),
    );
  }

  IMeasure toLocal({required String language}) {
    const basePath = 'anecdotes';
    return copyWith(
      textFile: '$basePath/$language-$textFile.json',
      voice: '$basePath/$language-$voice',
    );
  }
}
