import 'package:freezed_annotation/freezed_annotation.dart';

part 'boat_island.freezed.dart';
part 'boat_island.g.dart';

@freezed
class BoatIsland with _$BoatIsland {
  const factory BoatIsland({
    //todo replace with FileSource
    required String asset,
    required int year,
    @Default(false) bool isApproximation,
  }) = _BoatIsland;

  const BoatIsland._();

  factory BoatIsland.fromJson(Map<String, dynamic> json) =>
      _$BoatIslandFromJson(json);

  String get prefix {
    if (isApproximation) return '~';
    return '';
  }
}
