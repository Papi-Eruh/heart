extension DateExtension on DateTime {
  bool isSameDay(DateTime otherDate) {
    return year == otherDate.year &&
        month == otherDate.month &&
        day == otherDate.day;
  }

  String toStringDayPrecision() {
    return toIso8601String().substring(0, 10);
  }

  String toStringMonthPrecision() {
    return toIso8601String().substring(0, 7);
  }

  List<DateTime> daysBetween(DateTime other) {
    var currentDate = add(const Duration(days: 1));
    if (currentDate.isAfter(other)) return [];
    final toReturn = <DateTime>[];
    while (!currentDate.isSameDay(other)) {
      toReturn.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }
    return toReturn;
  }

  String toStringSmallPrecision() {
    final str = toIso8601String();
    return str.substring(str.indexOf('T') + 1);
  }
}

int daysInMonth(int year, int month) {
  final nextMonth = DateTime(year, month + 1);
  final lastDayOfMonth = nextMonth.subtract(const Duration(days: 1));
  return lastDayOfMonth.day;
}
