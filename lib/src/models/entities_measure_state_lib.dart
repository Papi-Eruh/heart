import 'package:heart/heart.dart';

enum EmsExamples { nature, indoor, city, field }

abstract class EmsExamplesFactory {
  static EntitiesMeasureState fromEnum(
    EmsExamples example,
    String mainCharFilename,
  ) {
    final state = switch (example) {
      EmsExamples.nature => nature(mainCharFilename),
      EmsExamples.indoor => indoor(mainCharFilename),
      EmsExamples.city => city(mainCharFilename),
      EmsExamples.field => field(mainCharFilename),
    };
    return state.copyWithRandMainCharPos();
  }

  /// [mainCharFilename] theme_filename (including extension)
  static EntitiesMeasureState nature(String mainCharFilename) {
    final tiles = <TileMeasureEntity>[
      for (var y = 0; y < 6; y++)
        TileMeasureEntity(sprite: TileSprites.dirt, x: -1, y: y),
      for (var x = 0; x < 6; x++)
        TileMeasureEntity(sprite: TileSprites.dirt, x: x, y: -1),
      const TileMeasureEntity(sprite: TileSprites.grass),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 1),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 1, y: 1),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 2, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 4, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 5, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 2),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 1, y: 2),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 2, y: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 2),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 4, y: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 5, y: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 3),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 1, y: 3),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 2, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 4, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 5, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 1, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 2, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 4),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 4, y: 4),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 5, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 1, y: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 2, y: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 5),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 4, y: 5),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 5, y: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 5),
      for (var x = 0; x < 7; x++)
        TileMeasureEntity(sprite: TileSprites.grass, x: x, y: 6),
    ];
    const cores = [
      CoreMeasureEntity(sprite: CoreSprites.tree, x: -1),
      CoreMeasureEntity(sprite: CoreSprites.tree, x: -1, y: 4),
      CoreMeasureEntity(sprite: CoreSprites.tree, x: 2, y: -1),
    ];
    return EntitiesMeasureState(
      mainCharacter: CharacterMeasureEntity(filename: mainCharFilename),
      tiles: tiles.toList(),
      cores: cores,
      bgHexColor: 0xff9CD7DE,
    );
  }

  /// [mainCharFilename] theme_filename (including extension)
  static EntitiesMeasureState indoor(String mainCharFilename) {
    final tiles = <TileMeasureEntity>[
      for (var y = 0; y < 6; y++)
        TileMeasureEntity(sprite: TileSprites.dirt, x: -1, y: y),
      for (var x = 0; x < 6; x++)
        TileMeasureEntity(sprite: TileSprites.dirt, x: x, y: -1),
      const TileMeasureEntity(sprite: TileSprites.grass),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 1),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 1, y: 1),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 2, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 4, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 5, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 1),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 2),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 1, y: 2),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 2, y: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 2),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 4, y: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 5, y: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 2),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 3),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 1, y: 3),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 2, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 4, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 5, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 3),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 1, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 2, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 4),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 4, y: 4),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 5, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 4),
      const TileMeasureEntity(sprite: TileSprites.grass, y: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 1, y: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 2, y: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 3, y: 5),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 4, y: 5),
      const TileMeasureEntity(sprite: TileSprites.dirt, x: 5, y: 5),
      const TileMeasureEntity(sprite: TileSprites.grass, x: 6, y: 5),
      for (var x = 0; x < 7; x++)
        TileMeasureEntity(sprite: TileSprites.grass, x: x, y: 6),
    ];
    const cores = [
      CoreMeasureEntity(sprite: CoreSprites.tree, x: -1),
      CoreMeasureEntity(sprite: CoreSprites.tree, x: -1, y: 4),
      CoreMeasureEntity(sprite: CoreSprites.tree, x: 2, y: -1),
    ];
    return EntitiesMeasureState(
      mainCharacter: CharacterMeasureEntity(filename: mainCharFilename),
      tiles: tiles.toList(),
      cores: cores,
      bgHexColor: 0xff9CD7DE,
    );
  }

  static EntitiesMeasureState city(String mainCharFilename) {
    final tiles = <TileMeasureEntity>{};
    const cores = <CoreMeasureEntity>[];

    return EntitiesMeasureState(
      mainCharacter: CharacterMeasureEntity(filename: mainCharFilename),
      tiles: tiles.toList(),
      cores: cores,
    );
  }

  static EntitiesMeasureState field(String mainCharFilename) {
    final tiles = <TileMeasureEntity>{};
    const cores = <CoreMeasureEntity>[];

    return EntitiesMeasureState(
      mainCharacter: CharacterMeasureEntity(filename: mainCharFilename),
      tiles: tiles.toList(),
      cores: cores,
    );
  }
}
