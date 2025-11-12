extension ErdString on String {
  /// With extension
  String get filename {
    return substring(lastIndexOf('/') + 1);
  }

  String get filenameWithoutExtension {
    return substring(lastIndexOf('/') + 1, lastIndexOf('.'));
  }

  String get extension {
    return substring(lastIndexOf('.') + 1);
  }

  String cleanSpecial() {
    final cleanAccent = replaceAll(RegExp(r'[àáâãäåÀÁÂÃÄÅ]'), 'a')
        .replaceAll(RegExp(r'[èéêëÈÉÊË]'), 'e')
        .replaceAll(RegExp(r'[ìíîïÌÍÎÏ]'), 'i')
        .replaceAll(RegExp(r'[òóôõöÒÓÔÕÖ]'), 'o')
        .replaceAll(RegExp(r'[ùúûüÙÚÛÜ]'), 'u')
        .replaceAll(RegExp(r'[ýÿÝ]'), 'y')
        .replaceAll(RegExp(r'[çÇ]'), 'c')
        .replaceAll(RegExp(r'[ñÑ]'), 'n');
    final result = cleanAccent
        .replaceAll("'", ' ')
        .replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '')
        .replaceAll(' ', '_')
        .replaceAll(RegExp(r'(?<=[.?!])\s+(?=[A-ZÀÂÆÇÉÈÊËÎÏÔŒÙÛÜ])'), '');
    return result;
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
