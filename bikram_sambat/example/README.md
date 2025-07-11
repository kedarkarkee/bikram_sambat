# Bikram Sambat DateTime

### Bikram Sambat
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

### Date Conversion
Converts dates from AD to BS and vice versa.

```dart
final bsDate = DateTime(2001,12,13,14,15,16).toBikramSambat();
print('BS Date = $bsDate'); // 2058-08-28 14:15:16.000
final adDate = bsDate.toDateTime();
print('AD Date = $adDate'); // 2001-12-13 14:15:16.000
```
