enum TileSprites {
  grass(),
  dirt();

  const TileSprites({this.canGoThrough = true});

  final bool canGoThrough;

  String get path => 'assets/eternal/sprites/tiles/$name.png';

  String get description {
    var precision = '';
    if (canGoThrough) precision = '(can go through)';
    return '$name$precision';
  }
}
