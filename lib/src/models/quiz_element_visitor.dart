import 'package:heart/heart.dart';

abstract class QuizElementVisitor {
  void visitQa(QaElement value);

  void visitFlag(FlagElement value);
}
