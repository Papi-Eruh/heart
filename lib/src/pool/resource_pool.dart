import 'dart:async';

import 'package:synchronized/synchronized.dart';

abstract class Pool<T> {
  Future<T> acquire();

  Future<void> release(T value);

  Future<void> disposeAll();
}

class PoolImpl<T> implements Pool<T> {
  PoolImpl({required this.buildItem, required this.releaseItem}) {
    _freeResource = buildItem();
  }

  final T Function() buildItem;
  final Future<void> Function(T value) releaseItem;
  T? _freeResource;
  final Set<T> _busyResources = {};
  final _lock = Lock();

  @override
  Future<T> acquire() async {
    final resource = await _lock.synchronized(
      () {
        final next = _freeResource ?? buildItem();
        _busyResources.add(next);
        _freeResource = null;
        return next;
      },
    );
    return resource;
  }

  @override
  Future<void> release(T res) async {
    T? toDispose;
    await _lock.synchronized(
      () async {
        if (!_busyResources.contains(res)) return;
        if (_freeResource != null) toDispose = res;
        _freeResource ??= res;
        _busyResources.remove(res);
      },
    );
    if (toDispose != null) unawaited(releaseItem(res));
  }

  @override
  Future<void> disposeAll() async {
    return _lock.synchronized(
      () async {
        await Future.wait([
          if (_freeResource != null) releaseItem(_freeResource as T),
          ..._busyResources.map(releaseItem),
        ]);
        _busyResources.clear();
        _freeResource = null;
      },
    );
  }
}
