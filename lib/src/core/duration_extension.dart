extension DurationDivision on Duration {
  Duration operator /(num part) {
    return Duration(milliseconds: inMilliseconds ~/ part);
  }

  Duration operator *(num part) {
    return Duration(milliseconds: (inMilliseconds * part).toInt());
  }
}
