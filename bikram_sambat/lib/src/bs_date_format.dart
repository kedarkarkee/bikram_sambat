// ignore_for_file: non_constant_identifier_names

import 'package:bikram_sambat/bikram_sambat.dart';

enum BSLanguage {
  english,
  nepali;

  bool get isEnglish => this == english;
}

class BSDateFormat {
  /// Creates a new BSDateFormat with the specified pattern and language
  BSDateFormat(
    String pattern, [
    BSLanguage? language,
  ]) : _language = language ?? defaultLanguage {
    _pattern = pattern;
  }

  static BSLanguage defaultLanguage = BSLanguage.english;

  /// `2076-08-05` -> Eng: `5`  Nep: `५`
  BSDateFormat.d([BSLanguage? language]) : this('d', language);

  /// `2076-10-15` -> Eng: `Wed`  Nep: `बुध`
  BSDateFormat.E([BSLanguage? language]) : this('E', language);

  /// `2076-12-30` -> Eng: `Sunday`  Nep: `आइतबार`
  BSDateFormat.EEEE([BSLanguage? language]) : this('EEEE', language);

  /// `2076-06-30` -> Eng: `T`  Nep: `बि`
  BSDateFormat.EEEEE([BSLanguage? language]) : this('EEEEE', language);

  /// `2077-01-05` -> Eng: `Bai`  Nep: `बै`
  BSDateFormat.LLL([BSLanguage? language]) : this('MMM', language);

  /// `2077-08-04` -> Eng: `Mangsir`  Nep: `मंसिर`
  BSDateFormat.LLLL([BSLanguage? language]) : this('MMMM', language);

  /// `2077-08-04` -> Eng: `Marga`  Nep: `मार्ग`
  BSDateFormat.LLLLL([BSLanguage? language]) : this('MMMMM', language);

  /// `2077-03-20` -> Eng: `3`  Nep: `३`
  BSDateFormat.M([BSLanguage? language]) : this('M', language);

  /// `2077-04-25` -> Eng: `4/25`  Nep: `४/२५`
  BSDateFormat.Md([BSLanguage? language]) : this('M/d', language);

  /// `2077-05-12` -> Eng: `Fri, 5/12`  Nep: `शुक्र, ५/१२`
  BSDateFormat.MEd([BSLanguage? language]) : this('EE, M/d', language);

  /// `2077-01-05` -> Eng: `Bai`  Nep: `बै`
  BSDateFormat.MMM([BSLanguage? language]) : this('MMM', language);

  /// `2077-06-02` -> Eng: `Ash 2`  Nep: `आ २`
  BSDateFormat.MMMd([BSLanguage? language]) : this('MMM d', language);

  /// `2077-07-10` -> Eng: `Mon, Kar 10`  Nep: `सोम, का १०`
  BSDateFormat.MMMEd([BSLanguage? language]) : this('EE, MMM d', language);

  /// `2077-08-04` -> Eng: `Mangsir`  Nep: `मंसिर`
  BSDateFormat.MMMM([BSLanguage? language]) : this('MMMM', language);

  /// `2077-08-18` -> Eng: `Mangsir 18`  Nep: `मंसिर १८`
  BSDateFormat.MMMMd([BSLanguage? language]) : this('MMMM d', language);

  /// `2077-09-27` -> Eng: `Monday, Pus 27`  Nep: `सोमबार, पुस २७`
  BSDateFormat.MMMMEEEEd([BSLanguage? language])
      : this('EEE, MMMM d', language);

  /// `2077-08-04` -> Eng: `Marga`  Nep: `मार्ग`
  BSDateFormat.MMMMM([BSLanguage? language]) : this('MMMMM', language);

  /// `2077-08-01` -> Eng: `Marga 1`  Nep: `मार्ग १`
  BSDateFormat.MMMMMd([BSLanguage? language]) : this('MMMMM d', language);

  /// `2077-08-01` -> Eng: `Monday, Marga 1`  Nep: `सोमबार, मार्ग १`
  BSDateFormat.MMMMMEEEEd([BSLanguage? language])
      : this('EEE, MMMMM d', language);

  /// `2077-11-05` -> Eng: `Q3`  Nep: `Q३`
  BSDateFormat.QQQ([BSLanguage? language]) : this('QQQ', language);

  /// `2078-06-15` -> Eng: `1st quarter`  Nep: `पहिलो तिमाही`
  BSDateFormat.QQQQ([BSLanguage? language]) : this('QQQQ', language);

  /// `2078-02-22` -> Eng: `2078`  Nep: `२०७८`
  BSDateFormat.y([BSLanguage? language]) : this('y', language);

  /// `2078-03-30` -> Eng: `2078/03`  Nep: `२०७८/०३`
  BSDateFormat.yM([BSLanguage? language]) : this('y/MM', language);

  /// `2078-05-08` -> Eng: `2078/05/08`  Nep: `२०७८/०५/०८`
  BSDateFormat.yMd([BSLanguage? language]) : this('y/MM/dd', language);

  /// `2078-06-17` -> Eng: `Sun, 2078/06/17`  Nep: `आइत, २०७८/०६/१७`
  BSDateFormat.yMEd([BSLanguage? language]) : this('EE, y/MM/dd', language);

  /// `2078-07-24` -> Eng: `Kar 2078`  Nep: `का २०७८`
  BSDateFormat.yMMM([BSLanguage? language]) : this('MMM y', language);

  /// `2078-09-11` -> Eng: `Pou 11, 2078`  Nep: `पौ ११, २०७८`
  BSDateFormat.yMMMd([BSLanguage? language]) : this('MMM d, y', language);

  /// `2078-10-19` -> Eng: `Wed, Mag 19, 2078`  Nep: `बुध, मा १९, २०७८`
  BSDateFormat.yMMMEd([BSLanguage? language]) : this('EE, MMM d, y', language);

  /// `2078-11-27` -> Eng: `Fagun 2078`  Nep: `फागुन २०७८`
  BSDateFormat.yMMMM([BSLanguage? language]) : this('MMMM y', language);

  /// `2079-08-05` -> Eng: `Mangsir 5, 2079`  Nep: `मंसिर ५, २०७९`
  BSDateFormat.yMMMMd([BSLanguage? language]) : this('MMMM d, y', language);

  /// `2079-02-14` -> Eng: `Saturday, Jeth 14, 2079`  Nep: `शनिबार, जेठ १४, २०७९`
  BSDateFormat.yMMMMEEEEd([BSLanguage? language])
      : this('EEE, MMMM d, y', language);

  /// `2078-11-27` -> `Falgun 2078`  Nep: `फाल्गुण २०७८`
  BSDateFormat.yMMMMM([BSLanguage? language]) : this('MMMMM y', language);

  /// `2079-08-05` -> Eng: `Marga 5, 2079`  Nep: `मार्ग ५, २०७९`
  BSDateFormat.yMMMMMd([BSLanguage? language]) : this('MMMMM d, y', language);

  /// `2079-02-14` -> Eng: `Saturday, Jestha 14, 2079`  Nep: `शनिबार, जेष्ठ १४, २०७९`
  BSDateFormat.yMMMMMEEEEd([BSLanguage? language])
      : this('EEE, MMMMM d, y', language);

  /// `2079-03-22` -> Eng: `Q4 2079`  Nep: `Q४ २०७९`
  BSDateFormat.yQQQ([BSLanguage? language]) : this('QQQ y', language);

  /// `2079-12-30` -> Eng: `3rd quarter 2079`  Nep: `तेस्रो तिमाही २०७९`
  BSDateFormat.yQQQQ([BSLanguage? language]) : this('QQQQ y', language);

  /// `2076-08-05T14:04:25` -> Eng: `14`  Nep: `१४`
  BSDateFormat.H([BSLanguage? language]) : this('HH', language);

  /// `2080-02-02T14:25:30` -> Eng: `14:25`  Nep: `१४:२५`
  BSDateFormat.Hm([BSLanguage? language]) : this('HH:mm', language);

  /// `2080-03-03T23:59:59` -> Eng: `23:59:59`  Nep: `२३:५९:५९`
  BSDateFormat.Hms([BSLanguage? language]) : this('HH:mm:ss', language);

  /// `2080-04-04T11:11:11` -> Eng: `11 AM`  Nep: `बिहान ११`
  BSDateFormat.j([BSLanguage? language])
      : this(
          language == BSLanguage.nepali ? 'aa h' : 'h aa',
          language,
        );

  /// `2080-05-05T17:45:00` -> Eng: `5:45 PM`  Nep: `साँझ ५:४५`
  BSDateFormat.jm([BSLanguage? language])
      : this(
          language == BSLanguage.nepali ? 'aa h:mm' : 'h:mm aa',
          language,
        );

  /// `2080-06-06T07:30:00` -> Eng: `7:30:00 AM`  Nep: `बिहान ७:३०:००`
  BSDateFormat.jms([BSLanguage? language])
      : this(
          language == BSLanguage.nepali ? 'aa h:mm:ss' : 'h:mm:ss aa',
          language,
        );

  /// `2080-07-07T13:15:30` -> Eng: `15`  Nep: `१५`
  BSDateFormat.m([BSLanguage? language]) : this('m', language);

  /// `2080-08-08T19:05:40` -> Eng: `05:40`  Nep: `०५:४०`
  BSDateFormat.ms([BSLanguage? language]) : this('mm:ss', language);

  /// `2080-09-09T22:30:15` -> Eng: `15`  Nep: `१५`
  BSDateFormat.s([BSLanguage? language]) : this('s', language);

  final BSLanguage _language;
  late final String _pattern;

  BSDateFormat add_H() => addPattern('HH');
  BSDateFormat add_Hm() => addPattern('HH:mm');
  BSDateFormat add_Hms() => addPattern('HH:mm:ss');
  BSDateFormat add_j() =>
      addPattern(_language == BSLanguage.nepali ? 'aa h' : 'h aa');
  BSDateFormat add_jm() =>
      addPattern(_language == BSLanguage.nepali ? 'aa h:mm' : 'h:mm aa');
  BSDateFormat add_jms() =>
      addPattern(_language == BSLanguage.nepali ? 'aa h:mm:ss' : 'h:mm:ss aa');

  // Quoted String - anything between single quotes, with escaping
  //   of single quotes by doubling them.
  // e.g. in the pattern "hh 'o''clock'" will match 'o''clock'
  static final _quotedTextRegExp = RegExp("^'(?:[^']|'')*'");

  // Fields - any sequence of 1 or more of the same field characters.
  // e.g. in "hh:mm:ss" will match hh, mm, and ss. But in "hms" would
  // match each letter individually.
  static final _fieldRegExp = RegExp(
      '^(?:G+|y+|M+|k+|S+|E+|a+|h+|K+|H+|c+|L+|Q+|d+|D+|m+|s+|v+|z+|Z+)');

  // Everything else - A sequence that is not quotes or field characters.
  // e.g. in "hh:mm:ss" will match the colons.
  static final _otherRegExp = RegExp("^[^'GyMkSEahKHcLQdDmsvzZ]+");

  /// Format a [BikramSambat] date according to the pattern
  String format(BikramSambat date) {
    final buffer = StringBuffer();
    _processPattern(_pattern, date, buffer);
    return buffer.toString();
  }

  BSDateFormat addPattern(String pattern) {
    return BSDateFormat('$_pattern $pattern', _language);
  }

  void _processPattern(String pattern, BikramSambat date, StringBuffer buffer) {
    var remainingPattern = pattern;

    while (remainingPattern.isNotEmpty) {
      if (remainingPattern.startsWith(_quotedTextRegExp)) {
        final match = _quotedTextRegExp.firstMatch(remainingPattern)!;
        final matchedText = match.group(0)!;
        // Handle quotes - remove the surrounding quotes and unescape internal quotes
        var text = matchedText.substring(1, matchedText.length - 1);
        text = text.replaceAll("''", "'");
        buffer.write(text);
        remainingPattern = remainingPattern.substring(matchedText.length);
      } else if (remainingPattern.startsWith(_fieldRegExp)) {
        final match = _fieldRegExp.firstMatch(remainingPattern)!;
        final matchedText = match.group(0)!;
        _formatField(matchedText, date, buffer);
        remainingPattern = remainingPattern.substring(matchedText.length);
      } else if (remainingPattern.startsWith(_otherRegExp)) {
        final match = _otherRegExp.firstMatch(remainingPattern)!;
        final matchedText = match.group(0)!;
        buffer.write(matchedText);
        remainingPattern = remainingPattern.substring(matchedText.length);
      } else {
        // Should never happen with the regex patterns, but just in case
        buffer.write(remainingPattern[0]);
        remainingPattern = remainingPattern.substring(1);
      }
    }
  }

  void _formatField(String field, BikramSambat date, StringBuffer buffer) {
    final fieldChar = field[0];
    final fieldLength = field.length;

    switch (fieldChar) {
      case 'G':
        buffer.write(_formatEra(fieldLength));
        break;
      case 'y':
        buffer.write(_formatYear(date.year, fieldLength));
        break;
      case 'M':
        buffer.write(_formatMonth(date.month, fieldLength));
        break;
      case 'd':
        buffer.write(_formatDay(date.day, fieldLength));
        break;
      case 'E':
        buffer.write(_formatWeekday(date.weekday, fieldLength));
        break;
      case 'a':
        buffer.write(_formatDayPeriod(date.hour, fieldLength));
        break;
      case 'h':
        buffer.write(_formatHour12(date.hour, fieldLength));
        break;
      case 'H':
        buffer.write(_formatHour24(date.hour, fieldLength));
        break;
      case 'm':
        buffer.write(_formatMinute(date.minute, fieldLength));
        break;
      case 's':
        buffer.write(_formatSecond(date.second, fieldLength));
        break;
      case 'S':
        buffer.write(_formatFractionalSecond(
            date.millisecond, date.microsecond, fieldLength));
        break;
      case 'Q':
        buffer.write(_formatQuarter(date.month, fieldLength));
        break;
      default:
        // For any unhandled patterns, just output the field as-is
        buffer.write(field);
    }
  }

  String _formatEra(int length) {
    if (_language.isEnglish) {
      return length == 1
          ? 'BS'
          : length == 2
              ? 'B.S.'
              : 'Bikram Sambat';
    } else {
      return length == 1
          ? 'बि सं'
          : length == 2
              ? 'बि.सं.'
              : 'बिक्रम संबत';
    }
  }

  String _formatYear(int year, int length) {
    final yearStr = year.toString();
    return _language.isEnglish ? yearStr : _toNepaliDigits(yearStr);
    // if (_language.isEnglish) {
    //   return length <= 2 ? yearStr.substring(yearStr.length - 2) : yearStr;
    // } else {
    //   return _toNepaliDigits(
    //       length <= 2 ? yearStr.substring(yearStr.length - 2) : yearStr);
    // }
  }

  String _formatMonth(int month, int length) {
    if (length < 3 || length > 5) {
      return _padZero(month, length);
    }
    final monthNames = _language.isEnglish
        ? _englishMonths[month - 1]
        : _nepaliMonths[month - 1];
    if (length == 3) {
      return monthNames.$3;
    }
    if (length == 4) {
      return monthNames.$2;
    }
    return monthNames.$1;
  }

  String _formatDay(int day, int length) {
    return length == 1
        ? (_language.isEnglish
            ? day.toString()
            : _toNepaliDigits(day.toString()))
        : _padZero(day);
  }

  String _formatWeekday(int weekday, int length) {
    final weekdays = _language.isEnglish ? _englishWeeks : _nepaliWeeks;
    final (weekdayName, weekdayNameShort, weekdayNameSingle) =
        weekdays[weekday - 1];
    if (length <= 2) {
      return weekdayNameShort;
    } else if (length <= 4) {
      return weekdayName;
    } else {
      return weekdayNameSingle;
    }
  }

  String _formatDayPeriod(int hour, int length) {
    if (_language.isEnglish) {
      return length == 1
          ? (hour >= 12 ? 'pm' : 'am')
          : (hour >= 12 ? 'PM' : 'AM');
    } else {
      if (hour < 12) {
        return 'बिहान';
      } else if (hour == 12) {
        return 'मध्यान्न';
      } else if (hour < 16) {
        return 'दिउसो';
      } else if (hour < 20) {
        return 'साँझ';
      } else {
        return 'बेलुकी';
      }
    }
  }

  String _formatHour12(int hour, int length) {
    final h = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return length == 1
        ? (_language.isEnglish ? h.toString() : _toNepaliDigits(h.toString()))
        : _padZero(h);
  }

  String _formatHour24(int hour, int length) {
    return length == 1
        ? (_language.isEnglish
            ? hour.toString()
            : _toNepaliDigits(hour.toString()))
        : _padZero(hour);
  }

  String _formatMinute(int minute, int length) {
    return length == 1
        ? (_language.isEnglish
            ? minute.toString()
            : _toNepaliDigits(minute.toString()))
        : _padZero(minute);
  }

  String _formatSecond(int second, int length) {
    return length == 1
        ? (_language.isEnglish
            ? second.toString()
            : _toNepaliDigits(second.toString()))
        : _padZero(second);
  }

  String _formatFractionalSecond(int millisecond, int microsecond, int length) {
    final combined =
        '${millisecond.toString().padLeft(3, '0')}${microsecond.toString().padLeft(3, '0')}';
    final digits = combined.substring(0, length.clamp(1, 6));
    return _language.isEnglish ? digits : _toNepaliDigits(digits);
  }

  String _formatQuarter(int month, int length) {
    final quarter = ((((month + 8) / 3).floor() % 4) + 1);
    final quarterStr = _language.isEnglish
        ? quarter.toString()
        : _toNepaliDigits(quarter.toString());
    if (length == 1) {
      return quarterStr;
    } else if (length == 2) {
      return '0$quarterStr';
    } else if (length == 3) {
      return 'Q$quarterStr';
    } else {
      final suffixes = _language.isEnglish
          ? ['st', 'nd', 'rd', 'th']
          : ['पहिलो', 'दोश्रो', 'तेस्रो', 'चौथो'];
      final suffix = quarter <= 3 ? suffixes[quarter - 1] : suffixes[3];
      final quarterPrefix = _language.isEnglish ? '$quarterStr$suffix' : suffix;
      final quarterName = _language.isEnglish ? 'quarter' : 'तिमाही';
      return '$quarterPrefix $quarterName';
    }
  }

  String _padZero(int number, [int length = 2]) {
    final paddedNumber = number.toString().padLeft(length, '0');
    return _language.isEnglish ? paddedNumber : _toNepaliDigits(paddedNumber);
  }

  String _toNepaliDigits(String number) {
    const nepaliDigits = ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९'];
    return number.replaceAllMapped(RegExp(r'\d'), (match) {
      final digit = int.parse(match.group(0)!);
      return nepaliDigits[digit];
    });
  }

  static const _englishWeeks = [
    ('Sunday', 'Sun', 'S'),
    ('Monday', 'Mon', 'M'),
    ('Tuesday', 'Tue', 'T'),
    ('Wednesday', 'Wed', 'W'),
    ('Thursday', 'Thu', 'T'),
    ('Friday', 'Fri', 'F'),
    ('Saturday', 'Sat', 'S'),
  ];

  static const _nepaliWeeks = [
    ('आइतबार', 'आइत', 'आ'),
    ('सोमबार', 'सोम', 'सो'),
    ('मङ्गलबार', 'मङ्गल', 'मं'),
    ('बुधबार', 'बुध', 'बु'),
    ('बिहिबार', 'बिहि', 'बि'),
    ('शुक्रबार', 'शुक्र', 'शु'),
    ('शनिबार', 'शनि', 'श'),
  ];

  static const _englishMonths = [
    ('Baishakh', 'Baishakh', 'Bai'),
    ('Jestha', 'Jeth', 'Jes'),
    ('Ashadh', 'Asar', 'Asar'),
    ('Shrawan', 'Saun', 'Shr'),
    ('Bhadra', 'Bhadau', 'Bha'),
    ('Ashwin', 'Asoj', 'Ash'),
    ('Kartik', 'Kartik', 'Kar'),
    ('Marga', 'Mangsir', 'Man'),
    ('Poush', 'Pus', 'Pou'),
    ('Magh', 'Magh', 'Mag'),
    ('Falgun', 'Fagun', 'Fal'),
    ('Chaitra', 'Chait', 'Cha'),
  ];

  // Ref: https://en.wikipedia.org/wiki/Jestha_(Nepali_calendar)
  static const _nepaliMonths = [
    ('बैशाख', 'बैशाख', 'बै'),
    ('जेष्ठ', 'जेठ', 'जे'),
    ('आषाढ', 'असार', 'अ'),
    ('श्रावण', 'साउन', 'श्रा'),
    ('भाद्र', 'भदौ', 'भा'),
    ('आश्विन', 'असोज', 'आ'),
    ('कार्तिक', 'कात्तिक', 'का'),
    ('मार्ग', 'मंसिर', 'मं'),
    ('पौष', 'पुस', 'पौ'),
    ('माघ', 'माघ', 'मा'),
    ('फाल्गुण', 'फागुन', 'फा'),
    ('चैत्र', 'चैत', 'चै'),
  ];
}
