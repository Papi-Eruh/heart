import 'package:hydrated_bloc/hydrated_bloc.dart';

class PrimitiveBloc<T> extends Bloc<T, T> {
  PrimitiveBloc(super.initState) {
    on<T>((event, emit) => emit(event));
  }
}

class PrimitiveHydratedBloc<T> extends HydratedBloc<T, T> {
  PrimitiveHydratedBloc(super.initState) {
    on<T>((event, emit) => emit(event));
  }

  @override
  T? fromJson(Map<String, dynamic> json) {
    return json['value'] as T?;
  }

  @override
  Map<String, dynamic>? toJson(T state) {
    return {'value': state};
  }
}
