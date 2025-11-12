import 'package:freezed_annotation/freezed_annotation.dart';

part 'captions.freezed.dart';

part 'captions.g.dart';

@freezed
class Captions with _$Captions {
  const factory Captions({
    @JsonKey(name: 'word') required String text,
    @JsonKey(name: 'start_time') required double startTime,
    @JsonKey(name: 'end_time') required double endTime,
  }) = _Captions;

  const Captions._();

  factory Captions.fromJson(Map<String, dynamic> json) =>
      _$CaptionsFromJson(json);

  int get ms {
    return ((endTime - startTime) * 1000).toInt();
  }
}
