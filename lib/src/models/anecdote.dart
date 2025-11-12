import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heart/src/models/models.dart';

part 'anecdote.freezed.dart';

part 'anecdote.g.dart';

enum ArtistWorkType {
  illustration,
  music,
  animation;
}

@freezed
class ArtistData with _$ArtistData {
  const factory ArtistData({
    required ArtistWorkType workType,

    /// main link
    required String link,
    required String label,
    @Default({}) Map<String, String> descriptionByLc,
    String? linkShop,
  }) = _ArtistData;

  const ArtistData._();

  factory ArtistData.fromJson(Map<String, dynamic> json) =>
      _$ArtistDataFromJson(json);
}

@freezed
class ArtistBusinessCard with _$ArtistBusinessCard {
  const factory ArtistBusinessCard({
    required ArtistData artist,
    required String pathShowReel,
  }) = _ArtistBusinessCard;

  factory ArtistBusinessCard.fromJson(Map<String, dynamic> json) =>
      _$ArtistBusinessCardFromJson(json);
}

@freezed
class Anecdote with _$Anecdote implements KeyListBloc, Comparable<Anecdote> {
  const factory Anecdote({
    /// < 0 => origins, ==0 => tutorial, > 0 => rest
    required int id,
    @Default(0) int version,

    /// For url purpose
    String? hiddenId,
    String? music,
    String? animCardFilename,
    @Default({}) Map<String, String> titleByLocale,
    @Default({}) Map<String, String> periodByLocale,
    @Default([]) List<IMeasure> measures,
    @Default({}) Set<String> idQuizSet,
    // do not use Map as tags will not be numerous
    @Default({}) Set<String> tags,
    @Default([]) List<ArtistBusinessCard> artistBusinessCardList,
    (double, double)? coordinates,
  }) = _Anecdote;

  const Anecdote._();

  factory Anecdote.fromJson(Map<String, dynamic> json) =>
      _$AnecdoteFromJson(json);

  @override
  String get key => '$id';

  List<String> get localPathList {
    return [
      if (music != null) music!,
      ...measures.expand((e) => e.localPathList),
    ];
  }

  String? filenameMatching<IMT>() {
    final matchingMeasure =
        measures.firstWhereOrNull((element) => element is IMT);
    if (matchingMeasure == null) return null;
    return matchingMeasure.mapOrNull(
      rive: (value) => value.file,
    );
  }

  List<String> assetPaths({
    required String languageCode,
  }) {
    return [
      if (music != null) 'assets/audio/$music',
      ...measures.expand(
        (element) => element.assetPaths(
          language: languageCode,
        ),
      ),
    ];
  }

  Anecdote toLocal({required String languageCode}) {
    final localMeasures =
        measures.map((e) => e.toLocal(language: languageCode)).toList();
    if (music != null) {
      return copyWith(music: 'anecdotes/$music', measures: localMeasures);
    }
    return copyWith(measures: localMeasures);
  }

  @override
  int compareTo(Anecdote other) {
    if (id < 0 && other.id < 0) return id.abs().compareTo(other.id.abs());
    return id.compareTo(other.id);
  }

  bool anyFrom(Set<String> idQuizSet) {
    return this.idQuizSet.intersection(idQuizSet).isNotEmpty;
  }
}
