import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'set_bloc.freezed.dart';
part 'set_bloc.g.dart';

@freezed
class SetBlocState<T> with _$SetBlocState<T> {
  const factory SetBlocState({@Default({}) Set<dynamic> set}) = _SetBlocState;

  const SetBlocState._();

  factory SetBlocState.fromJson(Map<String, dynamic> json) =>
      _$SetBlocStateFromJson(json);

  Set<T> get setT => set.cast<T>();

  bool get isEmpty => set.isEmpty;

  T get last => setT.last;

  int get length => set.length;

  bool contains(T value) {
    return setT.contains(value);
  }

  bool containsAll(Set<T> values) {
    return setT.containsAll(values);
  }
}

abstract class SetEvent<T> {}

@freezed
class AddSetElements<T> with _$AddSetElements<T> implements SetEvent<T> {
  const factory AddSetElements(Set<dynamic> set) = _AddSetElements;

  factory AddSetElements.fromJson(Map<String, dynamic> json) =>
      _$AddSetElementsFromJson(json);
}

@freezed
class DeleteSetElements<T> with _$DeleteSetElements<T> implements SetEvent<T> {
  const factory DeleteSetElements(Set<dynamic> set) = _DeleteSetElements;

  factory DeleteSetElements.fromJson(Map<String, dynamic> json) =>
      _$DeleteSetElementsFromJson(json);
}

@freezed
class ReplaceSetElements<T>
    with _$ReplaceSetElements<T>
    implements SetEvent<T> {
  const factory ReplaceSetElements(Set<dynamic> set) = _ReplaceSetElements;

  factory ReplaceSetElements.fromJson(Map<String, dynamic> json) =>
      _$ReplaceSetElementsFromJson(json);
}

mixin SetBlocMixin<T> on Bloc<SetEvent<T>, SetBlocState<T>> {
  FutureOr<void> addSetElements(
    AddSetElements<T> event,
    Emitter<SetBlocState<T>> emit,
  ) {
    emit(state.copyWith(set: {...state.set, ...event.set}));
  }

  FutureOr<void> deleteSetElements(
    DeleteSetElements<T> event,
    Emitter<SetBlocState<T>> emit,
  ) {
    emit(state.copyWith(set: state.set.difference(event.set)));
  }

  FutureOr<void> replaceSetElements(
    ReplaceSetElements<T> event,
    Emitter<SetBlocState<T>> emit,
  ) {
    emit(state.copyWith(set: event.set));
  }
}

class SetHydratedBloc<T> extends HydratedBloc<SetEvent<T>, SetBlocState<T>>
    with SetBlocMixin<T> {
  SetHydratedBloc([SetBlocState<T>? initState])
      : super(initState ?? SetBlocState<T>()) {
    on<AddSetElements<T>>(addSetElements);
    on<DeleteSetElements<T>>(deleteSetElements);
    on<ReplaceSetElements<T>>(replaceSetElements);
  }

  @override
  SetBlocState<T>? fromJson(Map<String, dynamic> json) {
    return SetBlocState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SetBlocState<T> state) {
    return state.toJson();
  }
}

class SetBloc<T> extends Bloc<SetEvent<T>, SetBlocState<T>>
    with SetBlocMixin<T> {
  SetBloc({Set<T> set = const {}}) : super(SetBlocState<T>(set: set)) {
    on<AddSetElements<T>>(addSetElements);
    on<DeleteSetElements<T>>(deleteSetElements);
    on<ReplaceSetElements<T>>(replaceSetElements);
  }
}
