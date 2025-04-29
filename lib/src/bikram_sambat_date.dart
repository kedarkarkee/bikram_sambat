part 'dates.dart';

extension BikramSambatConverter on DateTime {
  /// Converts the [DateTime] to [BikramSambat].
  BikramSambat toBikramSambat() {
    final utcNow = toUtc();

    // Time is adjusted later
    final utcDate = DateTime.utc(utcNow.year, utcNow.month, utcNow.day);
    var difference = utcDate.difference(_referenceDateAD).inDays;

    // Setting nepali reference to 1969/1/1 with english date 1912/4/12
    var nepaliYear = _minSupportedYear;
    var nepaliMonth = 1;
    var nepaliDay = 1;

    // Getting nepali year until the difference remains less than [daysInYear]
    var daysInYear = _nepaliDates[nepaliYear]!.first;
    while (difference >= daysInYear) {
      nepaliYear += 1;
      difference -= daysInYear;
      daysInYear = _nepaliDates[nepaliYear]!.first;
    }

    // Getting nepali month until the difference remains less than [daysInMonth]
    var daysInMonth = _nepaliDates[nepaliYear]![nepaliMonth];
    while (difference >= daysInMonth) {
      difference -= daysInMonth;
      nepaliMonth += 1;
      daysInMonth = _nepaliDates[nepaliYear]![nepaliMonth];
    }

    // Remaining days is the actual day;
    nepaliDay += difference;

    return BikramSambat(
      nepaliYear,
      nepaliMonth,
      nepaliDay,
      utcNow.hour,
      // Adjust the nepali timezone offset
      utcNow.minute + _nepalTimeZoneOffset.inMinutes,
      utcNow.second,
      utcNow.millisecond,
      utcNow.microsecond,
    );
  }
}

class BikramSambat implements DateTime {
  /// Constructs a BikramSambat instance in Nepal Time Zone.
  factory BikramSambat(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]) {
    millisecond += microsecond ~/ Duration.microsecondsPerMillisecond;
    microsecond %= Duration.microsecondsPerMillisecond;
    if (microsecond < 0) {
      microsecond += Duration.microsecondsPerMillisecond;
      millisecond--;
    }

    second += millisecond ~/ Duration.millisecondsPerSecond;
    millisecond %= Duration.millisecondsPerSecond;
    if (millisecond < 0) {
      millisecond += Duration.millisecondsPerSecond;
      second--;
    }

    minute += second ~/ Duration.secondsPerMinute;
    second %= Duration.secondsPerMinute;
    if (second < 0) {
      second += Duration.secondsPerMinute;
      minute--;
    }

    hour += minute ~/ Duration.minutesPerHour;
    minute %= Duration.minutesPerHour;
    if (minute < 0) {
      minute += Duration.minutesPerHour;
      hour--;
    }

    day += hour ~/ Duration.hoursPerDay;
    hour %= Duration.hoursPerDay;
    if (hour < 0) {
      hour += Duration.hoursPerDay;
      day--;
    }

    // Adjusting month
    if (month > 12) {
      year += (month - 1) ~/ 12;
      month = (month - 1) % 12 + 1;
    } else if (month < 1) {
      year -= month.abs() ~/ 12 + 1;
      month = 12 - month.abs() % 12;
    }
    // Adjusting day
    while (true) {
      final currentMonthDays = _getMonthList(year)[month];
      if (day > 0 && day <= currentMonthDays) {
        break;
      }
      if (day > currentMonthDays) {
        day -= currentMonthDays;
        if (++month > 12) {
          month = 1;
          year++;
        }
      } else if (day < 1) {
        if (--month < 1) {
          month = 12;
          year--;
        }
        day += _getMonthList(year)[month];
      }
    }

    return BikramSambat._internal(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  const BikramSambat._internal(
    this.year, [
    this.month = 1,
    this.day = 1,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
    this.millisecond = 0,
    this.microsecond = 0,
  ]) : assert(year >= _minSupportedYear && year <= _maxSupportedYear,
            'Supported year is $_minSupportedYear-$_maxSupportedYear');

  /// Constructs a BikramSambat instance with current date and time
  factory BikramSambat.now() => DateTime.timestamp().toBikramSambat();

  /// Converts the specified [DateTime] to [BikramSambat].
  factory BikramSambat.fromDateTime(DateTime dateTime) {
    return dateTime.toBikramSambat();
  }

  @override
  final int year;

  @override
  final int month;

  @override
  final int day;

  @override
  final int hour;

  @override
  final int minute;

  @override
  final int second;

  @override
  final int millisecond;

  @override
  final int microsecond;

  ///Constructs a new [BikramSambat] instance based on [formattedString].
  ///
  ///Throws a [FormatException] if the input cannot be parsed.
  static BikramSambat parse(String formattedString) {
    final re = _parseFormat;
    final match = re.firstMatch(formattedString);
    if (match != null) {
      int parseIntOrZero(String? matched) {
        if (matched == null) return 0;
        return int.parse(matched);
      }

      // Parses fractional second digits of '.(\d+)' into the combined
      // microseconds. We only use the first 6 digits because of DateTime
      // precision of 999 milliseconds and 999 microseconds.
      int parseMilliAndMicroseconds(String? matched) {
        if (matched == null) return 0;
        final length = matched.length;
        assert(length >= 1, 'matched string is empty');
        var result = 0;
        for (var i = 0; i < 6; i++) {
          result *= 10;
          if (i < matched.length) {
            result += matched.codeUnitAt(i) ^ 0x30;
          }
        }
        return result;
      }

      final years = int.parse(match[1]!);
      final month = int.parse(match[2]!);
      final day = int.parse(match[3]!);
      final hour = parseIntOrZero(match[4]);
      final minute = parseIntOrZero(match[5]);
      final second = parseIntOrZero(match[6]);
      final milliAndMicroseconds = parseMilliAndMicroseconds(match[7]);
      final millisecond =
          milliAndMicroseconds ~/ Duration.microsecondsPerMillisecond;
      final microsecond =
          milliAndMicroseconds.remainder(Duration.microsecondsPerMillisecond);

      return BikramSambat(
        years,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );
    } else {
      throw FormatException('Invalid BikramSambat format', formattedString);
    }
  }

  ///Constructs a new BikramSambat instance based on formattedString.
  static BikramSambat? tryParse(String formattedString) {
    try {
      return parse(formattedString);
    } on FormatException {
      return null;
    }
  }

  static final RegExp _parseFormat = RegExp(
      r'^([+-]?\d{4,6})-?(\d\d)-?(\d\d)' // Day part.
      r'(?:[ T](\d\d)(?::?(\d\d)(?::?(\d\d)(?:[.,](\d{1,6}))?)?)?' // Time part.
      r'( ?[zZ]| ?([-+])(\d\d)(?::?(\d\d))?)?)?$');

  @override
  BikramSambat add(Duration duration) => BikramSambat(
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond + duration.inMicroseconds,
      );

  @override
  BikramSambat subtract(Duration duration) => BikramSambat(
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond - duration.inMicroseconds,
      );

  @override
  int compareTo(covariant BikramSambat other) {
    if (isBefore(other)) {
      return -1;
    } else if (isAfter(other)) {
      return 1;
    }
    return 0;
  }

  @override
  Duration difference(covariant BikramSambat other) {
    return toUtc().difference(other.toUtc());
  }

  @override
  bool isBefore(covariant BikramSambat other) {
    return toUtc().isBefore(other.toUtc());
  }

  @override
  bool isAfter(covariant BikramSambat other) {
    return toUtc().isAfter(other.toUtc());
  }

  @override
  bool isAtSameMomentAs(covariant BikramSambat other) {
    return toUtc().isAtSameMomentAs(other.toUtc());
  }

  @override
  bool get isUtc => false;

  /// Gets the days passed since 1969/1/1 BS
  int get _daysSinceBSEpoch {
    int totalDays = 0;

    for (int y = _minSupportedYear; y < year; y++) {
      totalDays += _getMonthList(y)[0];
    }

    for (int m = 1; m < month; m++) {
      totalDays += _nepaliDates[year]![m];
    }

    totalDays += day - 1;

    return totalDays;
  }

  @override
  int get microsecondsSinceEpoch => toUtc().microsecondsSinceEpoch;

  @override
  int get millisecondsSinceEpoch => toUtc().millisecondsSinceEpoch;

  /// Returns the weekday of the date. Starts at Sunday = 1
  @override
  int get weekday {
    return ((_referenceDateAD.weekday + _daysSinceBSEpoch) % 7) + 1;
  }

  @override
  String get timeZoneName => 'Nepal Standard Time';

  @override
  Duration get timeZoneOffset => _nepalTimeZoneOffset;

  @override
  String toIso8601String() {
    final buffer = StringBuffer();
    buffer.write(year.toString().padLeft(4, '0'));
    buffer.write('-');
    buffer.write(month.toString().padLeft(2, '0'));
    buffer.write('-');
    buffer.write(day.toString().padLeft(2, '0'));
    buffer.write('T');
    buffer.write(hour.toString().padLeft(2, '0'));
    buffer.write(':');
    buffer.write(minute.toString().padLeft(2, '0'));
    buffer.write(':');
    buffer.write(second.toString().padLeft(2, '0'));
    buffer.write('.');
    buffer.write(millisecond.toString().padLeft(3, '0'));
    if (microsecond > 0) {
      buffer.write(microsecond.toString().padLeft(3, '0'));
    }
    return buffer.toString();
  }

  @override
  String toString() => toIso8601String().replaceFirst('T', ' ');

  @override
  DateTime toLocal() => this;

  /// Converts the [BikramSambat] to corresponding [DateTime].
  ///
  /// Can be used to convert BS to AD.
  DateTime toDateTime() => toUtc().toLocal();

  /// Converts the [BikramSambat] to corresponding [DateTime] in UTC.
  @override
  DateTime toUtc() {
    final resultDate = _referenceDateAD.add(Duration(days: _daysSinceBSEpoch));
    return DateTime.utc(
      resultDate.year,
      resultDate.month,
      resultDate.day,
      hour,
      // Adjust back the Nepal timezone offset
      minute - _nepalTimeZoneOffset.inMinutes,
      second,
      millisecond,
      microsecond,
    );
  }

  @override
  bool operator ==(covariant BikramSambat other) {
    return identical(this, other) || isAtSameMomentAs(other);
  }

  @override
  int get hashCode {
    return Object.hash(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }
}
