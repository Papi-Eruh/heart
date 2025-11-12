enum CoreSprites {
  table(),
  tree();

  const CoreSprites({
    this.width = 1,
    this.height = 1,
  });

  final int width;
  final int height;

  String get path {
    return 'assets/eternal/sprites/core/$name.png';
  }

  String get description {
    var details = '';
    if (details.isNotEmpty) details = '($details)';
    return '$name$details';
  }
}
