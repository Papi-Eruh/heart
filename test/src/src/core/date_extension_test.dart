import 'package:heart/heart.dart';
import 'package:test/test.dart';

void main() {
  test('toStringDayPrecision => 2024-02-03', () {
    final date = DateTime.utc(2024, 2, 3);
    expect(date.toStringDayPrecision(), '2024-02-03');
  });

  test('isSameDay => true', () {
    final date = DateTime.utc(2024, 2, 3, 10);
    final other = DateTime.utc(2024, 2, 3, 8);
    final other2 = DateTime.utc(2024, 2, 3, 11);
    expect(date.isSameDay(other), true);
    expect(date.isSameDay(other2), true);
  });

  test(
      'daysBetween with "01/01/24 - 04/01/24 12h12 => '
      '02/01/24, 03/01/24."', () {
    final date = DateTime(2024);
    final other = DateTime(2024, 1, 4, 12, 12);
    expect(
      date.daysBetween(other),
      [DateTime(2024, 1, 2), DateTime(2024, 1, 3)],
    );
  });
}
