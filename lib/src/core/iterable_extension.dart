extension ListComparableExtension<E extends Comparable<E>> on List<E> {
  List<E> sortGen() {
    return this
      ..sort()
      ..toList();
  }
}

extension ToMapIterableExtension<E> on Iterable<E> {
  Map<E, T> toMapItemKey<T>(T Function(E e) toValue) {
    return Map.fromEntries(map((e) => MapEntry(e, toValue(e))));
  }

  Map<T, E> toMap<T>(T Function(E e) toKey) {
    return Map.fromEntries(map((e) => MapEntry(toKey(e), e)));
  }
}

extension ListExtension<E> on List<E> {
  List<E> takeFrom(int startingIndex, int count) {
    var toReturn = <E>[];
    for (var i = startingIndex; i < startingIndex + count; i++) {
      final nextI = i % length;
      toReturn = [...toReturn, this[nextI]];
    }
    return toReturn;
  }

  /// If [count] > [length], returns the list.
  List<E> takeLast(int count) {
    if (length < count) return this;
    return sublist(length - count);
  }
}

extension MapEntryIterable<K, V> on Iterable<MapEntry<K, V>> {
  Map<K, V2> toMapCopyWithValue<V2>(V2 Function(V value) copyWith) {
    return Map.fromEntries(map((e) => MapEntry(e.key, copyWith(e.value))));
  }

  Map<K, V> toMap() {
    return Map.fromEntries(this);
  }
}
