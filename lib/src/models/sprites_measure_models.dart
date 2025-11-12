import 'dart:collection';
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heart/heart.dart';

part 'sprites_measure_models.freezed.dart';

part 'sprites_measure_models.g.dart';

@freezed
class CharacterMeasureEntity with _$CharacterMeasureEntity {
  const factory CharacterMeasureEntity({
    required String filename,
    @Default(0) int x,
    @Default(0) int y,
    @Default(false) bool isTurnedLeft,
  }) = _CharacterMeasureSprite;

  const CharacterMeasureEntity._();

  factory CharacterMeasureEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterMeasureEntityFromJson(json);

  (int, int) get coordinates => (x, y);
}

@freezed
class CoreMeasureEntity with _$CoreMeasureEntity {
  const factory CoreMeasureEntity({
    required CoreSprites sprite,
    @Default(0) int x,
    @Default(0) int y,
  }) = _CoreMeasureEntity;

  const CoreMeasureEntity._();

  factory CoreMeasureEntity.fromJson(Map<String, dynamic> json) =>
      _$CoreMeasureEntityFromJson(json);

  String get path => sprite.path;
}

@freezed
class TileMeasureEntity with _$TileMeasureEntity {
  const factory TileMeasureEntity({
    required TileSprites sprite,
    @Default(0) int x,
    @Default(0) int y,
    @Default(0) int z,
  }) = _TileMeasureEntity;

  const TileMeasureEntity._();

  factory TileMeasureEntity.fromJson(Map<String, dynamic> json) =>
      _$TileMeasureEntityFromJson(json);

  String get path => sprite.path;
}

@freezed
class EntitiesMeasureState with _$EntitiesMeasureState {
  const factory EntitiesMeasureState({
    required CharacterMeasureEntity mainCharacter,
    @Default([]) List<CharacterMeasureEntity> characters,
    @Default([]) List<TileMeasureEntity> tiles,
    @Default([]) List<CoreMeasureEntity> cores,
    int? bgHexColor,
  }) = _EntitiesMeasureState;

  const EntitiesMeasureState._();

  factory EntitiesMeasureState.fromJson(Map<String, dynamic> json) =>
      _$EntitiesMeasureStateFromJson(json);

  /// Column, row
  (int, int) get playableArea => (7, 7);

  List<CharacterMeasureEntity> get allCharacters {
    return [...characters, mainCharacter];
  }

  List<(int, int)> getShortestPathToExit() {
    final (gridWidth, gridHeight) = playableArea;
    if (mainCharacter.x == gridWidth - 1) return [];
    final occupied = occupiedPositions();
    const directions = [(0, -1), (0, 1), (-1, 0), (1, 0)];
    final exitPositions = <(int, int)>[];
    for (var y = 0; y < gridHeight; y++) {
      final exitPos = (gridWidth - 1, y);
      if (!occupied.contains(exitPos)) {
        exitPositions.add(exitPos);
      }
    }

    if (exitPositions.isEmpty) return [];
    final queue = Queue<List<(int, int)>>();
    final visited = <(int, int)>{};

    queue.add([(mainCharacter.x, mainCharacter.y)]);
    visited.add((mainCharacter.x, mainCharacter.y));

    while (queue.isNotEmpty) {
      final path = queue.removeFirst();
      final (x, y) = path.last;
      if (exitPositions.contains((x, y))) return path.sublist(1);
      for (final (dx, dy) in directions) {
        final newX = x + dx;
        final newY = y + dy;
        final newPos = (newX, newY);

        if (newX >= 0 &&
            newX < gridWidth &&
            newY >= 0 &&
            newY < gridHeight &&
            !occupied.contains(newPos) &&
            !visited.contains(newPos)) {
          visited.add(newPos);
          queue.add([...path, newPos]);
        }
      }
    }
    return [];
  }

  int cellCountForLeaving() {
    return getShortestPathToExit().length;
  }

  Set<(int, int)> occupiedPositions() {
    return {
      /*
      ...cores
          .where((element) => !element.sprite.canGoThrough)
          .map((e) => (e.x, e.y)),

       */
      ...tiles
          .where((element) => !element.sprite.canGoThrough)
          .map((e) => (e.x, e.y)),
      ...allCharacters.map((e) => (e.x, e.y)),
    };
  }

  /// Copy this with a new random generated main char position.
  EntitiesMeasureState copyWithRandMainCharPos() {
    final (xMax, yMax) = playableArea;
    final allPos = {
      for (var x = 0; x < xMax ~/ 2; x++)
        for (var y = 0; y < yMax; y++) (x, y),
    };
    final occupiedPos = occupiedPositions();
    final availablePos = allPos.difference(occupiedPos).toList();
    final index = Random().nextInt(availablePos.length);
    final (x, y) = availablePos[index];
    return copyWith(mainCharacter: mainCharacter.copyWith(x: x, y: y));
  }
}
