import 'package:heart/heart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';

part 'quiz.g.dart';

@freezed
class QuizElement
    with _$QuizElement
    implements KeyListBloc, Searchable, Comparable<QuizElement> {
  /// A question & answer element.
  ///
  /// [optionsByLc] contains **only the incorrect answer options**
  /// for each language, not including the correct answer
  /// (which is stored in [answerByLc]).
  const factory QuizElement.qa({
    required String id,

    //todo delete
    /// language code
    required String lc,

    /// Other (incorrect) answer options, grouped by language code.
    ///
    /// The correct answer is stored separately in [answerByLc].
    @Default({}) Map<String, List<String>> optionsByLc,

    /// Question text by language code.
    @Default({}) Map<String, String> questionByLc,

    /// Correct answer text by language code.
    @Default({}) Map<String, String> answerByLc,
  }) = QaElement;

  /// A flag-based question element.
  ///
  /// [ccOptions] contains **only the incorrect country codes**
  /// used as distractors, not including [countryCodeAnswer]
  /// (which holds the correct answer).
  const factory QuizElement.flag({
    required String id,

    //todo delete
    /// language code
    required String lc,

    /// The correct answer country code.
    required String countryCodeAnswer,
    @Default({}) Map<String, String> questionByLc,

    /// Other (incorrect) country code options.
    ///
    /// Does *not* include [countryCodeAnswer].
    @Default({}) Set<String> ccOptions,
  }) = FlagElement;

  const QuizElement._();

  factory QuizElement.fromJson(Map<String, dynamic> json) =>
      _$QuizElementFromJson(json);

  factory QuizElement.fromJsonAndLc(Map<String, dynamic> json, String lc) {
    final element = QuizElement.fromJson(json);
    return element.copyWith(lc: lc);
  }

  static const qKey = 'question';

  @override
  String get key {
    return map(qa: (value) => value.id, flag: (value) => value.id);
  }

  String get question => questionByLc[lc]!;

  String get answer {
    return map(
      qa: (value) => value.answerByLc[lc]!,
      flag: (value) => value.countryCodeAnswer,
    );
  }

  @override
  int compareTo(QuizElement other) {
    return question.compareTo(other.question);
  }

  @override
  bool match(String search) {
    return question.toLowerCase().contains(search) ||
        answer.toLowerCase().contains(search);
  }

  void accept(QuizElementVisitor visitor) {
    map(
      qa: (value) => visitor.visitQa(value),
      flag: (value) => visitor.visitFlag(value),
    );
  }
}
