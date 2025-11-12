T? ifThen<T>({required bool i, required T t}) {
  if (i) return t;
  return null;
}

T? ifThenCb<T>({required bool i, required T Function() t}) {
  if (i) return t();
  return null;
}

abstract class Disposable {
  void dispose();
}
