import 'package:test/test.dart';
import 'package:bikram_sambat/bikram_sambat.dart';

void main() {
  group('BikramSambat comparison tests', () {
    test('difference between two dates', () {
      final date1 = BikramSambat(2080, 1, 1);
      final date2 = BikramSambat(2080, 1, 2);
      final date3 = BikramSambat(2080, 2, 1);
      final date4 = BikramSambat(2081, 1, 1);
      expect(date2.difference(date1).inDays, 1);
      expect(date3.difference(date1).inDays, 31);
      expect(date4.difference(date1).inDays, 365);

      // Test with time components
      final time1 = BikramSambat(2080, 1, 1, 12, 0); // 12:00
      final time2 = BikramSambat(2080, 1, 1, 14, 0); // 14:00
      expect(time2.difference(time1).inHours, 2);
    });

    test('isBefore comparisons', () {
      final earlier = BikramSambat(2080, 1, 1);
      final later = BikramSambat(2080, 1, 2);

      expect(earlier.isBefore(later), true);
      expect(later.isBefore(earlier), false);

      // Same date, different times
      final morning = BikramSambat(2080, 1, 1, 9, 0);
      final evening = BikramSambat(2080, 1, 1, 17, 0);
      expect(morning.isBefore(evening), true);
    });

    test('isAfter comparisons', () {
      final earlier = BikramSambat(2080, 1, 1);
      final later = BikramSambat(2080, 1, 2);

      expect(later.isAfter(earlier), true);
      expect(earlier.isAfter(later), false);

      // Different years
      final previousYear = BikramSambat(2079, 12, 30);
      final nextYear = BikramSambat(2080, 1, 1);
      expect(nextYear.isAfter(previousYear), true);
    });

    test('isAtSameMomentAs comparisons', () {
      final moment1 = BikramSambat(2080, 1, 1, 12, 30);
      final moment2 = BikramSambat(2080, 1, 1, 12, 30);
      final differentMoment = BikramSambat(2080, 1, 1, 12, 31);

      expect(moment1.isAtSameMomentAs(moment2), true);
      expect(moment1.isAtSameMomentAs(differentMoment), false);

      // Test with milliseconds and microseconds
      final precise1 = BikramSambat(2080, 1, 1, 12, 30, 0, 100, 200);
      final precise2 = BikramSambat(2080, 1, 1, 12, 30, 0, 100, 200);
      final precise3 = BikramSambat(2080, 1, 1, 12, 30, 0, 100, 201);

      expect(precise1.isAtSameMomentAs(precise2), true);
      expect(precise1.isAtSameMomentAs(precise3), false);
    });

    test('compareTo method', () {
      final date1 = BikramSambat(2080, 1, 1);
      final date2 = BikramSambat(2080, 1, 2);
      final date3 = BikramSambat(2080, 1, 1);

      expect(date1.compareTo(date2), -1); // date1 < date2
      expect(date2.compareTo(date1), 1); // date2 > date1
      expect(date1.compareTo(date3), 0); // date1 = date3
    });
  });
}
