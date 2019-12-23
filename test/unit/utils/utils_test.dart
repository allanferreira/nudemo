import 'package:test/test.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:nudemo/utils/utils.dart';

void main() {
  group('[Unit -> Utils]', () {
    Utils utils;
    DateTime now;

    initializeDateFormatting('pt_BR', null);

    setUp(() {
      utils = Utils();
      now = DateTime.now();
    });

    test('`mapCustom()` with argument [] should be []', () {
      expect(Utils.mapCustom([], () {}), []);
    });

    test(
        '`mapCustom()` with argument [1, 2, 3] and `(i, _) => (i * 2)` should be [2, 4, 6]',
        () {
      expect(
        Utils.mapCustom([1, 2, 3], (key, value) => (value * 2)),
        [2, 4, 6],
      );
    });

    test('`getCurrencyValue()` with argument 2,134.98', () {
      expect(
        utils.getCurrencyValue(2134.98),
        r'R$' + '\u00a0' + '2.134,98',
      );
    });

    test('`getDayOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getDayOfDate(now),
        DateFormat.d().format(now),
      );
    });

    test('`getWeekDayOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getWeekDayOfDate(now),
        DateFormat.E().format(now),
      );
    });

    test('`getFullWeekDayOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getFullWeekDayOfDate(now),
        DateFormat.EEEE().format(now),
      );
    });

    test('`getMonthOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getMonthOfDate(now),
        DateFormat.LLL().format(now),
      );
    });

    test('`getFullMonthOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getFullMonthOfDate(now),
        DateFormat.LLLL().format(now),
      );
    });

    test('`getDayMonthOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getDayMonthOfDate(now),
        DateFormat('dd MMM').format(now),
      );
    });

    test('`getYearOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getYearOfDate(now),
        DateFormat('yy').format(now),
      );
    });

    test('`getFullYearOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getFullYearOfDate(now),
        DateFormat.y().format(now),
      );
    });

    test('`getMonthYearOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getMonthYearOfDate(now),
        DateFormat.yMMM().format(now),
      );
    });

    test('`getDayMonthYearOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getDayMonthYearOfDate(now),
        DateFormat('d MMM yy').format(now),
      );
    });

    test('`getDayMonthYearHourMinOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getDayMonthYearHourMinOfDate(now),
        DateFormat('dd MMM yy, HH:mm').format(now),
      );
    });

    test('`getHourMinOfDate()` with argument `DateTime.now()`', () {
      expect(
        utils.getHourMinOfDate(now),
        DateFormat.Hm().format(now),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Today] date', () {
      DateTime today = now;
      expect(
        utils.getCalculatedFormattedDate(today),
        utils.getHourMinOfDate(today),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Yesterday]', () {
      DateTime yesterday = DateTime(
        now.year,
        now.month,
        now.day - 1,
        now.hour,
        now.minute,
        now.second,
      );
      expect(
        utils.getCalculatedFormattedDate(yesterday),
        'Ontem',
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 2 days]', () {
      DateTime last2days = DateTime(
        now.year,
        now.month,
        now.day - 2,
        now.hour,
        now.minute,
        now.second,
      );
      String dayWeek =
          utils.getFullWeekDayOfDate(last2days).replaceAll('-feira', '');

      expect(
        utils.getCalculatedFormattedDate(last2days),
        utils.capitalize(dayWeek),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 3 days]', () {
      DateTime last3days = DateTime(
        now.year,
        now.month,
        now.day - 3,
        now.hour,
        now.minute,
        now.second,
      );
      String dayWeek =
          utils.getFullWeekDayOfDate(last3days).replaceAll('-feira', '');

      expect(
        utils.getCalculatedFormattedDate(last3days),
        utils.capitalize(dayWeek),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 4 days]', () {
      DateTime last4days = DateTime(
        now.year,
        now.month,
        now.day - 4,
        now.hour,
        now.minute,
        now.second,
      );
      String dayWeek =
          utils.getFullWeekDayOfDate(last4days).replaceAll('-feira', '');

      expect(
        utils.getCalculatedFormattedDate(last4days),
        utils.capitalize(dayWeek),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 5 days]', () {
      DateTime last5days = DateTime(
        now.year,
        now.month,
        now.day - 5,
        now.hour,
        now.minute,
        now.second,
      );
      String dayWeek =
          utils.getFullWeekDayOfDate(last5days).replaceAll('-feira', '');

      expect(
        utils.getCalculatedFormattedDate(last5days),
        utils.capitalize(dayWeek),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 6 days]', () {
      DateTime last6days = DateTime(
        now.year,
        now.month,
        now.day - 6,
        now.hour,
        now.minute,
        now.second,
      );
      String dayWeek =
          utils.getFullWeekDayOfDate(last6days).replaceAll('-feira', '');

      expect(
        utils.getCalculatedFormattedDate(last6days),
        utils.capitalize(dayWeek),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 7 days]', () {
      DateTime last7days = DateTime(
        now.year,
        now.month,
        now.day - 7,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(last7days),
        utils.getDayMonthOfDate(last7days).toUpperCase(),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 15 days]', () {
      DateTime last15days = DateTime(
        now.year,
        now.month,
        now.day - 15,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(last15days),
        utils.getDayMonthOfDate(last15days).toUpperCase(),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last month]', () {
      DateTime lastMonth = DateTime(
        now.year,
        now.month - 1,
        now.day,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(lastMonth),
        utils.getDayMonthOfDate(lastMonth).toUpperCase(),
      );
    });

    test(
        '`getCalculatedFormattedDate()` with argument [Last month, less 1 day]',
        () {
      DateTime lastMonthLastDay = DateTime(
        now.year,
        now.month - 1,
        now.day - 1,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(lastMonthLastDay),
        utils.getDayMonthOfDate(lastMonthLastDay).toUpperCase(),
      );
    });

    test(
        '`getCalculatedFormattedDate()` with argument [Last month, less 2 days]',
        () {
      DateTime lastMonth2Days = DateTime(
        now.year,
        now.month - 1,
        now.day - 2,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(lastMonth2Days),
        utils.getDayMonthOfDate(lastMonth2Days).toUpperCase(),
      );
    });

    test(
        '`getCalculatedFormattedDate()` with argument [Last month, less 7 days]',
        () {
      DateTime lastMonth7Days = DateTime(
        now.year,
        now.month - 1,
        now.day - 7,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(lastMonth7Days),
        utils.getDayMonthOfDate(lastMonth7Days).toUpperCase(),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 3 months]', () {
      DateTime last3months = DateTime(
        now.year,
        now.month - 3,
        now.day,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(last3months),
        utils.getDayMonthOfDate(last3months).toUpperCase(),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last 6 months]', () {
      DateTime last6months = DateTime(
        now.year,
        now.month - 6,
        now.day,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(last6months),
        utils.getDayMonthOfDate(last6months).toUpperCase(),
      );
    });

    test('`getCalculatedFormattedDate()` with argument [Last year]', () {
      DateTime lastYear = DateTime(
        now.year - 1,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(lastYear),
        utils.getDayMonthYearOfDate(lastYear).toUpperCase(),
      );
    });

    test(
        '`getCalculatedFormattedDate()` with argument [Last year, less 1 month]',
        () {
      DateTime lastYearLastMonth = DateTime(
        now.year - 1,
        now.month - 1,
        now.day,
        now.hour,
        now.minute,
        now.second,
      );

      expect(
        utils.getCalculatedFormattedDate(lastYearLastMonth),
        utils.getDayMonthYearOfDate(lastYearLastMonth).toUpperCase(),
      );
    });

    test('`capitalize()` with argument `nudemo`', () {
      expect(utils.capitalize('nudemo'), 'Nudemo');
    });
  });
}
