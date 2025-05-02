# Bikram Sambat

A dart package that handles working with Bikram Sambat Dates

## Motivation
Working with dates require a lot of functions that goes missing when working with BS Date. This package aims to provide the features you're familiar with [DateTime] but in [BikramSambat]. The features are well-tested across various test cases.

- Current timestamp
- Equality and same moment of dates
- Date addition and subtraction
- Handles rollover of month, day, hour, minute, second, millisecond, microsecond within the supported year bounds (1969 BS to 2200 BS)
- AD to BS conversion and vice-versa
- Parsing BS Date from String
- Formatting BS Dates similar to `intl.DateFormat`

### Bikram Sambat DateTime
BikramSambat class implements `dart:core`'s [DateTime] class to represent Nepali BS Dates
```dart
final currentDate = BikramSambat.now();
print(currentDate); // 2082-01-16 22:26:54.391157
```

#### Parse Bikram Sambat Dates
```dart
final parsedDate = BikramSambat.parse('2079-10-08T04:22:54.000');
print(parsedDate); // 2079-10-08 04:22:54.000
```

#### Date Rollovers
```dart
final date = BikramSambat(2076,1,90); // 90th day of 2076 BS
print(date); // 2076-03-27 00:00:00.000
```

### Date Conversion
Converts dates from AD to BS and vice versa.

```dart
final bsDate = DateTime(2001,12,13,14,15,16).toBikramSambat();
print('BS Date = $bsDate'); // 2058-08-28 14:15:16.000
final adDate = bsDate.toDateTime();
print('AD Date = $adDate'); // 2001-12-13 14:15:16.000
```

### Date Format
Format BikramSambat date into human readable form

```dart

// Format BikramSambat date into human readable form
final formattedDate = BikramSambat.now().format(BSDateFormat.yMd());
print(formattedDate); // 2082/01/19

// More formats are available with [BSDateFormat] constructors
final bsDate = BikramSambat(2082, 1, 19, 21, 21, 23);
print(BSDateFormat.yMMMEd().format(bsDate)); // Fri, Bai 19, 2082

print(BSDateFormat.yMMMEd(BSLanguage.nepali)
    .format(bsDate)); // शुक्र, बै १९, २०८२

print(BSDateFormat.yMMMMd()
    .add_jms()
    .format(bsDate)); // Baishakh 19, 2082 9:21:23 PM

print(BSDateFormat.yMMMMd(BSLanguage.nepali)
    .add_jms()
    .format(bsDate)); // बैशाख १९, २०८२ बेलुकी ९:२१:२३
```
#### Default Format Language

```dart
// Default date format language can be provided as
void main() {
  BSDateFormat.defaultLanguage = BSLanguage.nepali;

  print(BSDateFormat.MMMMd().format(bsDate)); // बैशाख १९
}
```

#### Nepali Month Names
There are two types of long names and one short name for months.

```dart
// Constructors with three M's like `yMMMd` will format with short Names
//
// English = ['Bai', 'Jes', 'Asar', 'Shr', 'Bha', 'Ash', 'Kar', 'Man', 'Pou', 'Mag', 'Fal', 'Cha']
// Nepali = ['बै', 'जे', 'अ', 'श्रा', 'भा', 'आ', 'का', 'मं', 'पौ', 'मा', 'फा', 'चै']
final date = BikramSambat(2082, 2, 2);
print(BSDateFormat.yMMMd().format(date)); // Jes 2, 2082
print(BSDateFormat.yMMMd(BSLanguage.nepali).format(date)); // जे २, २०८२


// Constructors with four M's like `yMMMMd` will format with type 1 Long Names
//
// English = ['Baishakh', 'Jeth', 'Asar', 'Saun', 'Bhadau', 'Asoj', 'Kartik', 'Mangsir', 'Pus', 'Magh', 'Fagun', 'Chait']
// Nepali = ['बैशाख', 'जेठ', 'असार', 'साउन', 'भदौ', 'असोज', 'कात्तिक', 'मंसिर', 'पुस', 'माघ', 'फागुन', 'चैत']
final date = BikramSambat(2082, 8, 29);
print(BSDateFormat.yMMMMd().format(date)); // Mangsir 29, 2082
print(BSDateFormat.yMMMMd(BSLanguage.nepali).format(date)); // मंसिर २९, २०८२

// Constructors with five M's like `yMMMMMd` will format with type 2 Long Names
//
// English = ['Baishakh', 'Jestha', 'Ashadh', 'Shrawan', 'Bhadra', 'Ashwin', 'Kartik', 'Marga', 'Poush', 'Magh', 'Falgun', 'Chaitra']
// Nepali = ['बैशाख', 'जेष्ठ', 'आषाढ', 'श्रावण', 'भाद्र', 'आश्विन', 'कार्तिक', 'मार्ग', 'पौष', 'माघ', 'फाल्गुण', 'चैत्र']
final date = BikramSambat(2082, 8, 29);
print(BSDateFormat.yMMMMd().format(date)); // Marga 29, 2082
print(BSDateFormat.yMMMMd(BSLanguage.nepali).format(date)); // मार्ग २९, २०८२

// Reference of month names can be found at : https://en.wikipedia.org/wiki/Jestha_(Nepali_calendar)
```
