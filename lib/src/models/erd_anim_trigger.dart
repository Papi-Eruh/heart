import 'package:collection/collection.dart';

enum ErdBgTrigger {
  read(
    inputName: 'Read',
    eventName: 'Reading',
  ),
  speak(
    inputName: 'Speak',
    eventName: 'Speaking',
    initStateNames: {'Speaking', 'StartSpeaking'},
  ),
  owl(inputName: 'Owl', eventName: 'Reading'),
  write(inputName: 'Write', eventName: 'Writing'),
  appear(inputName: 'Appear', eventName: 'Appearing'),
  none(inputName: 'none'),
  disappear(inputName: 'Disappear', eventName: 'Reading');

  const ErdBgTrigger({
    required this.inputName,
    this.eventName,
    this.initStateNames = const {},
  });

  final String inputName;
  final String? eventName;
  final Set<String> initStateNames;

  static ErdBgTrigger? fromStateName(String stateName) {
    return ErdBgTrigger.values
        .firstWhereOrNull((element) => element.eventName == stateName);
  }

  static const Set<String> eventNames = {
    'Reading',
    'Speaking',
    'StartSpeaking',
    'Writing',
    'Appearing',
    'EndSpeaking',
  };
}
