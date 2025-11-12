import 'package:collection/collection.dart';

enum Era {
  prehistoric(
    lower: -3000000,
    higher: -3000,
    color: 0xffFFABAB,
  ),
  antiquity(lower: -3000, higher: 476, color: 0xffD1C2EB),
  earlyMiddleAge(
    lower: 476,
    higher: 1000,
    color: 0xffFDC1FF,
  ),
  lateMiddleAge(
    lower: 1000,
    higher: 1450,
    color: 0xffAEE7FF,
  ),
  renaissance(
    lower: 1450,
    higher: 1600,
    color: 0xffFFCBC0,
  ),
  earlyModernPeriod(
    lower: 1600,
    higher: 1800,
    color: 0xffBDFCC3,
  ),
  ageOfRevolutions(
    lower: 1800,
    higher: 1850,
    color: 0xffC7A4FF,
  ),
  industrialRevolutions(
    lower: 1750,
    higher: 1914,
    color: 0xffDAFFD4,
  ),
  firstWorldWar(
    lower: 1914,
    higher: 1918,
    color: 0xffFE9BEE,
  ),
  interwarPeriod(
    lower: 1918,
    higher: 1939,
    color: 0xffFFF5BA,
  ),
  secondWorldWar(
    lower: 1939,
    higher: 1945,
    color: 0xffEFB6C8,
  ),
  coldWar(
    lower: 1945,
    higher: 1991,
    color: 0xff8174A0,
  ),
  contemporaryPeriod(
    lower: 1991,
    higher: 2025,
    color: 0xffFFD2A0,
  );

  const Era({
    required this.lower,
    required this.higher,
    this.color,
  });

  final int lower;
  final int higher;
  final int? color;

  //String get path => 'assets/eternal/sprites/epoch_characters/$name.svg';

  static Era? getEraForDate(int year) {
    return Era.values
        .firstWhereOrNull((era) => year >= era.lower && year <= era.higher);
  }
}
