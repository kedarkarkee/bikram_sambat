import 'package:bikram_sambat/bikram_sambat.dart';

void main() {
  // BikramSambat class implements `dart:core`'s [DateTime] class to represent Nepali BS Dates
  final currentDate = BikramSambat.now();
  print(currentDate); // 2082-01-16 22:26:54.391157

  // Parse Bikram Sambat Dates
  final parsedDate = BikramSambat.parse('2079-10-08T04:22:54.000');
  print(parsedDate); // 2079-10-08 04:22:54.000

  // Arbitrary values
  final date = BikramSambat(2076, 1, 90); // 90th day of 2076 BS
  print(date); // 2076-03-27 00:00:00.000

  // Date Conversion
  // Converts dates from AD to BS and vice versa.

  final bsDate = DateTime(2001, 12, 13, 14, 15, 16).toBikramSambat();
  print('BS Date = $bsDate'); // 2058-08-28 14:15:16.000
  final adDate = bsDate.toDateTime();
  print('AD Date = $adDate'); // 2001-12-13 14:15:16.000

  // Date Format
  // Format BikramSambat date into human readable form
  final formattedDate = BikramSambat.now().format(BSDateFormat.yMd());
  print(formattedDate); // 2082/01/19

  // More formats are available with [BSDateFormat] constructors

  final toFormat = BikramSambat(2082, 1, 19, 21, 21, 23);
  print(BSDateFormat.yMMMEd().format(toFormat)); // Fri, Bai 19, 2082

  print(BSDateFormat.yMMMEd(BSLanguage.nepali)
      .format(toFormat)); // शुक्र, बै १९, २०८२

  print(BSDateFormat.yMMMMd()
      .add_jms()
      .format(toFormat)); // Baishakh 19, 2082 9:21:23 PM

  print(BSDateFormat.yMMMMd(BSLanguage.nepali)
      .add_jms()
      .format(toFormat)); // बैशाख १९, २०८२ बेलुकी ९:२१:२३

  /// You can also provide default format language as
  ///
  /// ``` dart
  /// BSDateFormat.defaultLanguage = BSLanguage.nepali;
  /// ```
  ///
  BSDateFormat.defaultLanguage = BSLanguage.nepali;

  print(BSDateFormat.MMMMd().format(toFormat)); // बैशाख १९
}
