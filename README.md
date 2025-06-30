# Bikram Sambat

A dart package that handles working with Bikram Sambat Dates

## Features
Working with dates require a lot of functions that goes missing when working with BS Date. This package aims to provide the features you're familiar with [DateTime] but in [BikramSambat]. The features are well-tested across various test cases.

### `bikram_sambat`
- Current timestamp
- Equality and same moment of dates
- Date addition and subtraction
- Handles rollover of month, day, hour, minute, second, millisecond, microsecond within the supported year bounds (1969 BS to 2200 BS)
- AD to BS conversion and vice-versa
- Parsing BS Date from String
- Formatting BS Dates similar to `intl.DateFormat`

### `bikram_sambat_calendar`
- Bikram Sambat Date Picker
- Bikram Sambat Date Range Picker
