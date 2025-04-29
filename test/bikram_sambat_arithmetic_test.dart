import 'package:bikram_sambat/bikram_sambat.dart';
import 'package:test/test.dart';

void main() {
  group('supports days arithmetic', () {
    test('forward same year', () {
      expect(
        BikramSambat(2081, 5, 37),
        BikramSambat(2081, 5).add(const Duration(days: 36)),
      );
      expect(
        BikramSambat(2070, 12, 365),
        BikramSambat(2070, 12).add(const Duration(days: 364)),
      );
    });
    test('forward next year', () {
      expect(
        BikramSambat(2081, 5, 1000),
        BikramSambat(2081, 5).add(const Duration(days: 999)),
      );
      expect(
        BikramSambat(2065, 12, 36),
        BikramSambat(2065, 12).add(const Duration(days: 35)),
      );
    });
    test('backward same year', () {
      expect(
        BikramSambat(2081, 5, -37),
        BikramSambat(2081, 5).subtract(const Duration(days: 38)),
      );
      expect(
        BikramSambat(2081, 5, -37).toString(),
        BikramSambat(2081, 5).subtract(const Duration(days: 38)).toString(),
      );
      expect(
        BikramSambat(2070, 12, -330),
        BikramSambat(2070, 12).subtract(const Duration(days: 331)),
      );
    });
    test('backward previous year', () {
      expect(
        BikramSambat(2023, 1, 0),
        BikramSambat(2023).subtract(const Duration(days: 1)),
      );
      expect(
        BikramSambat(2081, 1, -37),
        BikramSambat(2081).subtract(const Duration(days: 38)),
      );
      expect(
        BikramSambat(2070, 12, -568),
        BikramSambat(2070, 12).subtract(const Duration(days: 569)),
      );
    });
    test('throws range error', () {
      expect(
        () => BikramSambat(2248, 12, 876),
        throwsRangeError,
      );
      expect(
        () => BikramSambat(1970, 3, -1234),
        throwsRangeError,
      );
    });
  });

  group('supports month arithmetic', () {
    test('forward next years', () {
      expect(
        BikramSambat(2081, 16, 5),
        BikramSambat(2082, 4, 5),
      );
      expect(
        BikramSambat(1998, 123, 25),
        BikramSambat(2008, 3, 25),
      );
    });
    test('backward previous years', () {
      expect(
        BikramSambat(2081, 0, 5),
        BikramSambat(2080, 12, 5),
      );
      expect(
        BikramSambat(2056, -107, 5),
        BikramSambat(2047, 1, 5),
      );
      expect(
        BikramSambat(2008, -123, 25),
        BikramSambat(1997, 9, 25),
      );
    });
    test('throws range error', () {
      expect(
        () => BikramSambat(2248, 65, 4),
        throwsRangeError,
      );
      expect(
        () => BikramSambat(1973, -243, 23),
        throwsRangeError,
      );
    });
  });
  group('supports combined month and day arithmetic', () {
    test('both positive', () {
      expect(
        BikramSambat(2081, 16, 45),
        BikramSambat(2082, 5, 14),
      );
    });
    test('both negative', () {
      expect(
        BikramSambat(2056, -107, -1),
        BikramSambat(2046, 12, 30),
      );
    });
    test('mixed positive and negative', () {
      expect(
        BikramSambat(2065, 13, -30),
        BikramSambat(2065, 12),
      );
      expect(
        BikramSambat(2065, -11, 1825),
        BikramSambat(2068, 12, 29),
      );
    });
  });
}
