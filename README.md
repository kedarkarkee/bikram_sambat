# Bikram Sambat

A dart package that handles working with Bikram Sambat Dates

## Motivation
Working with dates require a lot of functions that goes missing when working with BS Date. This package aims to provide the features you're familiar with [DateTime] but in [BikramSambat]

- Current timestamp
- Equality and same moment of dates
- Date addition and subtraction
- Can work with any values of month, day, hour, minute, second, millisecond, microsecond within the supported year bounds (1969 BS to 2200 BS)
- AB to BS conversion and vice-versa
- Parsing BS Date from String

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

#### Arbitrary values
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
