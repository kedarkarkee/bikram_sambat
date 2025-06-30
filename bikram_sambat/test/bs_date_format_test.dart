import 'package:bikram_sambat/bikram_sambat.dart';
import 'package:test/test.dart';

void main() {
  // const nepaliDigits = ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९'];

  const testCases = [
    // Format constructor, input date string, expected English output, expected Nepali output
    (BSDateFormat.d, '2076-08-05', '5', '५'),
    (BSDateFormat.E, '2076-10-15', 'Wed', 'बुध'),
    (BSDateFormat.EEEE, '2076-12-30', 'Sunday', 'आइतबार'),
    (BSDateFormat.EEEEE, '2076-06-30', 'T', 'बि'),
    (BSDateFormat.LLL, '2077-01-05', 'Bai', 'बै'),
    (BSDateFormat.LLLL, '2077-08-04', 'Mangsir', 'मंसिर'),
    (BSDateFormat.LLLLL, '2077-08-04', 'Marga', 'मार्ग'),
    (BSDateFormat.M, '2077-03-20', '3', '३'),
    (BSDateFormat.Md, '2077-04-25', '4/25', '४/२५'),
    (BSDateFormat.MEd, '2077-05-12', 'Fri, 5/12', 'शुक्र, ५/१२'),
    (BSDateFormat.MMMd, '2077-06-02', 'Ash 2', 'आ २'),
    (BSDateFormat.MMMEd, '2077-07-10', 'Mon, Kar 10', 'सोम, का १०'),
    (BSDateFormat.MMMMd, '2077-08-18', 'Mangsir 18', 'मंसिर १८'),
    (BSDateFormat.MMMMEEEEd, '2077-09-27', 'Monday, Pus 27', 'सोमबार, पुस २७'),
    (BSDateFormat.MMMMMd, '2077-08-01', 'Marga 1', 'मार्ग १'),
    (
      BSDateFormat.MMMMMEEEEd,
      '2077-08-01',
      'Monday, Marga 1',
      'सोमबार, मार्ग १'
    ),
    (BSDateFormat.QQQ, '2077-11-05', 'Q3', 'Q३'),
    (BSDateFormat.QQQQ, '2078-06-15', '1st quarter', 'पहिलो तिमाही'),
    (BSDateFormat.y, '2078-02-22', '2078', '२०७८'),
    (BSDateFormat.yM, '2078-03-30', '2078/03', '२०७८/०३'),
    (BSDateFormat.yMd, '2078-05-08', '2078/05/08', '२०७८/०५/०८'),
    (BSDateFormat.yMEd, '2078-06-17', 'Sun, 2078/06/17', 'आइत, २०७८/०६/१७'),
    (BSDateFormat.yMMM, '2078-07-24', 'Kar 2078', 'का २०७८'),
    (BSDateFormat.yMMMd, '2078-09-11', 'Pou 11, 2078', 'पौ ११, २०७८'),
    (
      BSDateFormat.yMMMEd,
      '2078-10-19',
      'Wed, Mag 19, 2078',
      'बुध, मा १९, २०७८'
    ),
    (BSDateFormat.yMMMM, '2078-11-27', 'Fagun 2078', 'फागुन २०७८'),
    (BSDateFormat.yMMMMd, '2079-08-05', 'Mangsir 5, 2079', 'मंसिर ५, २०७९'),
    (
      BSDateFormat.yMMMMEEEEd,
      '2079-02-14',
      'Saturday, Jeth 14, 2079',
      'शनिबार, जेठ १४, २०७९'
    ),
    (BSDateFormat.yMMMMM, '2078-11-27', 'Falgun 2078', 'फाल्गुण २०७८'),

    (BSDateFormat.yMMMMMd, '2079-08-05', 'Marga 5, 2079', 'मार्ग ५, २०७९'),
    (
      BSDateFormat.yMMMMMEEEEd,
      '2079-02-14',
      'Saturday, Jestha 14, 2079',
      'शनिबार, जेष्ठ १४, २०७९'
    ),
    (BSDateFormat.yQQQ, '2079-03-22', 'Q4 2079', 'Q४ २०७९'),
    (
      BSDateFormat.yQQQQ,
      '2079-12-30',
      '3rd quarter 2079',
      'तेस्रो तिमाही २०७९'
    ),
    (BSDateFormat.H, '2080-01-01T08:30:45', '08', '०८'),
    (BSDateFormat.Hm, '2080-02-02T14:25:30', '14:25', '१४:२५'),
    (BSDateFormat.Hms, '2080-03-03T23:59:59', '23:59:59', '२३:५९:५९'),
    (BSDateFormat.j, '2080-04-04T11:11:11', '11 AM', 'बिहान ११'),
    (BSDateFormat.jm, '2080-05-05T17:45:00', '5:45 PM', 'साँझ ५:४५'),
    (BSDateFormat.jms, '2080-06-06T07:30:00', '7:30:00 AM', 'बिहान ७:३०:००'),
    (BSDateFormat.m, '2080-07-07T13:15:30', '15', '१५'),
    (BSDateFormat.ms, '2080-08-08T19:05:40', '05:40', '०५:४०'),
    (BSDateFormat.s, '2080-09-09T22:30:15', '15', '१५'),
  ];

  const englishWeeks = [
    ('Sunday', 'Sun', 'S'),
    ('Monday', 'Mon', 'M'),
    ('Tuesday', 'Tue', 'T'),
    ('Wednesday', 'Wed', 'W'),
    ('Thursday', 'Thu', 'T'),
    ('Friday', 'Fri', 'F'),
    ('Saturday', 'Sat', 'S'),
  ];

  const nepaliWeeks = [
    ('आइतबार', 'आइत', 'आ'),
    ('सोमबार', 'सोम', 'सो'),
    ('मङ्गलबार', 'मङ्गल', 'मं'),
    ('बुधबार', 'बुध', 'बु'),
    ('बिहिबार', 'बिहि', 'बि'),
    ('शुक्रबार', 'शुक्र', 'शु'),
    ('शनिबार', 'शनि', 'श'),
  ];

  const englishMonths = [
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
  const nepaliMonths = [
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
  group('Overall Date Format', () {
    test('Formats english and nepali language correctly', () {
      for (final testCase in testCases) {
        final (formatter, dateString, engOutput, npOutput) = testCase;
        final date = BikramSambat.parse(dateString);
        expect(
          formatter(BSLanguage.english).format(date),
          engOutput,
          reason: 'Input date is $date',
        );
        expect(
          formatter(BSLanguage.nepali).format(date),
          npOutput,
          reason: 'Input date is $date',
        );
      }
    });
  });
  group('Individual Date Format', () {
    test('d', () {
      final date = BikramSambat(2082, 01, 16);
      expect(BSDateFormat.d().format(date), '16');
      expect(BSDateFormat.d(BSLanguage.nepali).format(date), '१६');
      final date2 = BikramSambat(2082, 11, 2);
      expect(BSDateFormat.d().format(date2), '2');
      expect(BSDateFormat.d(BSLanguage.nepali).format(date2), '२');
    });
    test('E', () {
      for (int i = 0; i < englishWeeks.length; i++) {
        final engWeek = englishWeeks[i];
        final nepWeek = nepaliWeeks[i];
        final date = BikramSambat(2082, 01, 14 + i);
        expect(BSDateFormat.E().format(date), engWeek.$2);
        expect(BSDateFormat.E(BSLanguage.nepali).format(date), nepWeek.$2);
        expect(BSDateFormat.EEEE().format(date), engWeek.$1);
        expect(BSDateFormat.EEEE(BSLanguage.nepali).format(date), nepWeek.$1);
        expect(BSDateFormat.EEEEE().format(date), engWeek.$3);
        expect(BSDateFormat.EEEEE(BSLanguage.nepali).format(date), nepWeek.$3);
      }
    });

    test('L and M', () {
      for (int i = 0; i < englishMonths.length; i++) {
        final engMonth = englishMonths[i];
        final nepMonth = nepaliMonths[i];
        final date = BikramSambat(2082, 1 + i, 14);
        expect(BSDateFormat.M().format(date), '${i + 1}');
        expect(BSDateFormat.MMM().format(date), engMonth.$3);
        expect(BSDateFormat.MMM(BSLanguage.nepali).format(date), nepMonth.$3);
        expect(BSDateFormat.MMMM().format(date), engMonth.$2);
        expect(BSDateFormat.MMMM(BSLanguage.nepali).format(date), nepMonth.$2);
        expect(BSDateFormat.MMMMM().format(date), engMonth.$1);
        expect(BSDateFormat.MMMMM(BSLanguage.nepali).format(date), nepMonth.$1);
      }
    });

    test('Md', () {
      final date = BikramSambat(2082, 1, 19);
      expect(BSDateFormat.Md().format(date), '1/19');
      expect(BSDateFormat.Md(BSLanguage.nepali).format(date), '१/१९');
    });

    test('MEd', () {
      final date = BikramSambat(2082, 1, 20);
      expect(BSDateFormat.MEd().format(date), 'Sat, 1/20');
      expect(BSDateFormat.MEd(BSLanguage.nepali).format(date), 'शनि, १/२०');
    });

    test('MMMd', () {
      final date = BikramSambat(2082, 11, 20);
      expect(BSDateFormat.MMMd().format(date), 'Fal 20');
      expect(BSDateFormat.MMMd(BSLanguage.nepali).format(date), 'फा २०');
    });

    test('MMMEd', () {
      final date = BikramSambat(2082, 8, 20);
      expect(BSDateFormat.MMMEd().format(date), 'Sat, Man 20');
      expect(BSDateFormat.MMMEd(BSLanguage.nepali).format(date), 'शनि, मं २०');
    });

    test('MMMMd', () {
      final date = BikramSambat(2082, 8, 1);
      expect(BSDateFormat.MMMMd().format(date), 'Mangsir 1');
      expect(BSDateFormat.MMMMd(BSLanguage.nepali).format(date), 'मंसिर १');
    });

    test('MMMMEEEEd', () {
      final date = BikramSambat(2082, 8, 1);
      expect(BSDateFormat.MMMMEEEEd().format(date), 'Monday, Mangsir 1');
      expect(BSDateFormat.MMMMEEEEd(BSLanguage.nepali).format(date),
          'सोमबार, मंसिर १');
    });

    test('MMMMMd', () {
      final date = BikramSambat(2082, 8, 1);
      expect(BSDateFormat.MMMMMd().format(date), 'Marga 1');
      expect(BSDateFormat.MMMMMd(BSLanguage.nepali).format(date), 'मार्ग १');
    });

    test('MMMMMEEEEd', () {
      final date = BikramSambat(2082, 8, 1);
      expect(BSDateFormat.MMMMMEEEEd().format(date), 'Monday, Marga 1');
      expect(BSDateFormat.MMMMMEEEEd(BSLanguage.nepali).format(date),
          'सोमबार, मार्ग १');
    });

    test('Q', () {
      final date1 = BikramSambat(2082, 4, 1);
      final date2 = BikramSambat(2082, 9, 15);
      final date3 = BikramSambat(2082, 10, 25);
      final date4 = BikramSambat(2082, 2, 12);

      expect(BSDateFormat.QQQ().format(date1), 'Q1');
      expect(BSDateFormat.QQQ().format(date2), 'Q2');
      expect(BSDateFormat.QQQ().format(date3), 'Q3');
      expect(BSDateFormat.QQQ().format(date4), 'Q4');
      expect(BSDateFormat.QQQ(BSLanguage.nepali).format(date1), 'Q१');
      expect(BSDateFormat.QQQ(BSLanguage.nepali).format(date2), 'Q२');
      expect(BSDateFormat.QQQ(BSLanguage.nepali).format(date3), 'Q३');
      expect(BSDateFormat.QQQ(BSLanguage.nepali).format(date4), 'Q४');

      expect(BSDateFormat.QQQQ().format(date2), '2nd quarter');
      expect(
          BSDateFormat.QQQQ(BSLanguage.nepali).format(date2), 'दोश्रो तिमाही');
      expect(BSDateFormat.QQQQ().format(date4), '4th quarter');
      expect(BSDateFormat.QQQQ(BSLanguage.nepali).format(date4), 'चौथो तिमाही');
    });

    test('y', () {
      final date = BikramSambat(2082, 1, 19);
      expect(BSDateFormat.y().format(date), '2082');
      expect(BSDateFormat.y(BSLanguage.nepali).format(date), '२०८२');
    });

    test('yM', () {
      final date = BikramSambat(2082, 1, 19);
      expect(BSDateFormat.yM().format(date), '2082/01');
      expect(BSDateFormat.yM(BSLanguage.nepali).format(date), '२०८२/०१');
    });

    test('yMd', () {
      final date = BikramSambat(2082, 1, 19);
      expect(BSDateFormat.yMd().format(date), '2082/01/19');
      expect(BSDateFormat.yMd(BSLanguage.nepali).format(date), '२०८२/०१/१९');
    });

    test('yMEd', () {
      final date = BikramSambat(2082, 1, 19);
      expect(BSDateFormat.yMEd().format(date), 'Fri, 2082/01/19');
      expect(BSDateFormat.yMEd(BSLanguage.nepali).format(date),
          'शुक्र, २०८२/०१/१९');
    });

    test('yMMM', () {
      final date = BikramSambat(2082, 2, 25);
      expect(BSDateFormat.yMMM().format(date), 'Jes 2082');
      expect(BSDateFormat.yMMM(BSLanguage.nepali).format(date), 'जे २०८२');
    });

    test('yMMMd', () {
      final date = BikramSambat(2082, 2, 2);
      expect(BSDateFormat.yMMMd().format(date), 'Jes 2, 2082');
      expect(BSDateFormat.yMMMd(BSLanguage.nepali).format(date), 'जे २, २०८२');
    });

    test('yMMMEd', () {
      final date = BikramSambat(2082, 1, 30);
      expect(BSDateFormat.yMMMEd().format(date), 'Tue, Bai 30, 2082');
      expect(BSDateFormat.yMMMEd(BSLanguage.nepali).format(date),
          'मङ्गल, बै ३०, २०८२');
    });

    test('yMMMM', () {
      final date = BikramSambat(2082, 8, 29);
      expect(BSDateFormat.yMMMM().format(date), 'Mangsir 2082');
      expect(BSDateFormat.yMMMM(BSLanguage.nepali).format(date), 'मंसिर २०८२');
    });

    test('yMMMMd', () {
      final date = BikramSambat(2082, 8, 29);
      expect(BSDateFormat.yMMMMd().format(date), 'Mangsir 29, 2082');
      expect(BSDateFormat.yMMMMd(BSLanguage.nepali).format(date),
          'मंसिर २९, २०८२');
    });

    test('yMMMMEEEEd', () {
      final date = BikramSambat(2082, 8, 29);
      expect(
          BSDateFormat.yMMMMEEEEd().format(date), 'Monday, Mangsir 29, 2082');
      expect(BSDateFormat.yMMMMEEEEd(BSLanguage.nepali).format(date),
          'सोमबार, मंसिर २९, २०८२');
    });

    test('yMMMMM', () {
      final date = BikramSambat(2082, 8, 29);
      expect(BSDateFormat.yMMMMM().format(date), 'Marga 2082');
      expect(BSDateFormat.yMMMMM(BSLanguage.nepali).format(date), 'मार्ग २०८२');
    });

    test('yMMMMMd', () {
      final date = BikramSambat(2082, 8, 29);
      expect(BSDateFormat.yMMMMMd().format(date), 'Marga 29, 2082');
      expect(BSDateFormat.yMMMMMd(BSLanguage.nepali).format(date),
          'मार्ग २९, २०८२');
    });

    test('yMMMMMEEEEd', () {
      final date = BikramSambat(2082, 8, 29);
      expect(BSDateFormat.yMMMMMEEEEd().format(date), 'Monday, Marga 29, 2082');
      expect(BSDateFormat.yMMMMMEEEEd(BSLanguage.nepali).format(date),
          'सोमबार, मार्ग २९, २०८२');
    });
    test('yQQQ', () {
      final date = BikramSambat(2082, 5, 29);
      expect(BSDateFormat.yQQQ().format(date), 'Q1 2082');
      expect(BSDateFormat.yQQQ(BSLanguage.nepali).format(date), 'Q१ २०८२');
    });

    test('yQQQQ', () {
      final date = BikramSambat(2082, 8, 29);
      expect(BSDateFormat.yQQQQ().format(date), '2nd quarter 2082');
      expect(BSDateFormat.yQQQQ(BSLanguage.nepali).format(date),
          'दोश्रो तिमाही २०८२');
    });

    test('H', () {
      final date = BikramSambat(2082, 8, 29, 4, 21, 23);
      expect(BSDateFormat.H().format(date), '04');
      expect(BSDateFormat.H(BSLanguage.nepali).format(date), '०४');

      final date2 = BikramSambat(2082, 8, 29, 14, 21, 23);
      expect(BSDateFormat.H().format(date2), '14');
      expect(BSDateFormat.H(BSLanguage.nepali).format(date2), '१४');
    });

    test('Hm', () {
      final date = BikramSambat(2082, 8, 29, 4, 1, 23);
      expect(BSDateFormat.Hm().format(date), '04:01');
      expect(BSDateFormat.Hm(BSLanguage.nepali).format(date), '०४:०१');

      final date2 = BikramSambat(2082, 8, 29, 14, 21, 23);
      expect(BSDateFormat.Hm().format(date2), '14:21');
      expect(BSDateFormat.Hm(BSLanguage.nepali).format(date2), '१४:२१');
    });

    test('Hms', () {
      final date = BikramSambat(2082, 8, 29, 4, 1, 2);
      expect(BSDateFormat.Hms().format(date), '04:01:02');
      expect(BSDateFormat.Hms(BSLanguage.nepali).format(date), '०४:०१:०२');

      final date2 = BikramSambat(2082, 8, 29, 14, 21, 23);
      expect(BSDateFormat.Hms().format(date2), '14:21:23');
      expect(BSDateFormat.Hms(BSLanguage.nepali).format(date2), '१४:२१:२३');
    });

    test('j', () {
      final date = BikramSambat(2082, 8, 29, 4, 1, 2);
      expect(BSDateFormat.j().format(date), '4 AM');
      expect(BSDateFormat.j(BSLanguage.nepali).format(date), 'बिहान ४');

      final date2 = BikramSambat(2082, 8, 29, 14, 21, 23);
      expect(BSDateFormat.j().format(date2), '2 PM');
      expect(BSDateFormat.j(BSLanguage.nepali).format(date2), 'दिउसो २');
    });

    test('jm', () {
      final date = BikramSambat(2082, 8, 29, 4, 1, 2);
      expect(BSDateFormat.jm().format(date), '4:01 AM');
      expect(BSDateFormat.jm(BSLanguage.nepali).format(date), 'बिहान ४:०१');

      final date2 = BikramSambat(2082, 8, 29, 21, 21, 23);
      expect(BSDateFormat.jm().format(date2), '9:21 PM');
      expect(BSDateFormat.jm(BSLanguage.nepali).format(date2), 'बेलुकी ९:२१');
    });

    test('jms', () {
      final date = BikramSambat(2082, 8, 29, 4, 1, 2);
      expect(BSDateFormat.jms().format(date), '4:01:02 AM');
      expect(BSDateFormat.jms(BSLanguage.nepali).format(date), 'बिहान ४:०१:०२');

      final date2 = BikramSambat(2082, 8, 29, 21, 21, 23);
      expect(BSDateFormat.jms().format(date2), '9:21:23 PM');
      expect(
          BSDateFormat.jms(BSLanguage.nepali).format(date2), 'बेलुकी ९:२१:२३');
    });

    test('m', () {
      final date = BikramSambat(2082, 8, 29, 4, 1, 2);
      expect(BSDateFormat.m().format(date), '1');
      expect(BSDateFormat.m(BSLanguage.nepali).format(date), '१');

      final date2 = BikramSambat(2082, 8, 29, 21, 21, 23);
      expect(BSDateFormat.m().format(date2), '21');
      expect(BSDateFormat.m(BSLanguage.nepali).format(date2), '२१');
    });

    test('ms', () {
      final date = BikramSambat(2082, 8, 29, 4, 1, 2);
      expect(BSDateFormat.ms().format(date), '01:02');
      expect(BSDateFormat.ms(BSLanguage.nepali).format(date), '०१:०२');

      final date2 = BikramSambat(2082, 8, 29, 21, 21, 23);
      expect(BSDateFormat.ms().format(date2), '21:23');
      expect(BSDateFormat.ms(BSLanguage.nepali).format(date2), '२१:२३');
    });

    test('s', () {
      final date = BikramSambat(2082, 8, 29, 4, 1, 2);
      expect(BSDateFormat.s().format(date), '2');
      expect(BSDateFormat.s(BSLanguage.nepali).format(date), '२');

      final date2 = BikramSambat(2082, 8, 29, 21, 21, 23);
      expect(BSDateFormat.s().format(date2), '23');
      expect(BSDateFormat.s(BSLanguage.nepali).format(date2), '२३');
    });
  });

  group('Compound Date Format', () {
    test('add_H', () {
      final date = BikramSambat(2082, 1, 19, 4, 21, 23);
      expect(BSDateFormat.yMd().add_H().format(date), '2082/01/19 04');
      expect(BSDateFormat.yMd(BSLanguage.nepali).add_H().format(date),
          '२०८२/०१/१९ ०४');
    });

    test('add_Hm', () {
      final date = BikramSambat(2082, 1, 19, 4, 1, 23);
      expect(BSDateFormat.yMd().add_Hm().format(date), '2082/01/19 04:01');
      expect(BSDateFormat.yMd(BSLanguage.nepali).add_Hm().format(date),
          '२०८२/०१/१९ ०४:०१');
    });

    test('add_Hms', () {
      final date = BikramSambat(2082, 1, 19, 4, 1, 2);
      expect(BSDateFormat.yMd().add_Hms().format(date), '2082/01/19 04:01:02');
      expect(BSDateFormat.yMd(BSLanguage.nepali).add_Hms().format(date),
          '२०८२/०१/१९ ०४:०१:०२');
    });

    test('add_j', () {
      final date = BikramSambat(2082, 1, 19, 4, 1, 2);
      expect(BSDateFormat.yMd().add_j().format(date), '2082/01/19 4 AM');
      expect(BSDateFormat.yMd(BSLanguage.nepali).add_j().format(date),
          '२०८२/०१/१९ बिहान ४');
    });

    test('add_jm', () {
      final date = BikramSambat(2082, 1, 19, 21, 21, 23);
      expect(BSDateFormat.yMd().add_jm().format(date), '2082/01/19 9:21 PM');
      expect(BSDateFormat.yMd(BSLanguage.nepali).add_jm().format(date),
          '२०८२/०१/१९ बेलुकी ९:२१');
    });

    test('add_jms', () {
      final date = BikramSambat(2082, 1, 19, 21, 21, 23);
      expect(
          BSDateFormat.yMd().add_jms().format(date), '2082/01/19 9:21:23 PM');
      expect(BSDateFormat.yMd(BSLanguage.nepali).add_jms().format(date),
          '२०८२/०१/१९ बेलुकी ९:२१:२३');
    });
  });
}
