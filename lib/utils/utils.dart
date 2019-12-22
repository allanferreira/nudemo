import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Utils {
  final formatCurrency = NumberFormat.simpleCurrency();

  Utils() {
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting('pt_BR', null);
  }

  /// Custom map function
  static List<T> mapCustom<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  /// Build the vertical chart bar widget
  Widget verticalChartBar({
    BuildContext context,
    double width = 8.0,
    double borderRadius = 2.5,
    int flexFuture = 0,
    int flexOpen = 0,
    int flexDue = 0,
    int flexAvailable = 0,
  }) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Container(
      key: Key('vertical-chart-bar'),
      width: width,
      // color: Colors.grey, // debug UI 🙃
      child: Column(
        children: <Widget>[
          /// Balances future [orange]
          Expanded(
            key: Key('future-bar'),
            flex: flexFuture,
            child: Container(
              decoration: BoxDecoration(
                color: _textTheme.display4.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
            ),
          ),

          /// Balances open [blue]
          Expanded(
            key: Key('open-bar'),
            flex: flexOpen,
            child: Container(
              color: _textTheme.display3.color,
            ),
          ),

          /// Balances prepaid ❔❔❔ I don't know the color...
          /// Is there❔ Is it green too❔
          /// Balances due [red]
          Expanded(
            key: Key('due-bar'),
            flex: flexDue,
            child: Container(
              color: _textTheme.display2.color,
            ),
          ),

          /// Balances available [green]
          Expanded(
            key: Key('available-bar'),
            flex: flexAvailable,
            child: Container(
              decoration: BoxDecoration(
                color: _textTheme.display1.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build last record display widget
  Widget showLastRegister({
    BuildContext context,
    Map<String, dynamic> lastRegister,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      color: Colors.black.withOpacity(0.05),
      constraints: BoxConstraints(
        minHeight: 90.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 16.0),
            child: Icon(
              IconData(
                lastRegister['icon'],
                fontFamily: 'MaterialIcons',
              ),
              color: textTheme.caption.color,
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                lastRegister['text'],
                style: textTheme.caption,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.keyboard_arrow_right,
              color: textTheme.caption.color,
            ),
          ),
        ],
      ),
    );
  }

  /// Creates a custom [SnackBar].
  void showSnackBar({
    @required GlobalKey<ScaffoldState> scaffoldKey,
    @required BuildContext context,
    String text = '🤔',
  }) {
    final snackBar = SnackBar(
      key: Key('snackBar'),
      backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.85),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
        child: Text(text, style: Theme.of(context).textTheme.body2),
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  /// Get value Currency formatted (R$)
  String getValueCurrency(double value) => formatCurrency.format(value);

  /// Get the Day of Date formatted
  String getDayOfDate(DateTime dateTime) => DateFormat.d().format(dateTime);

  /// Get the Week Day of Date formatted (Abbreviated)
  String getWeekDayOfDate(DateTime dateTime) => DateFormat.E().format(dateTime);

  /// Get the Week Day of Date formatted with full name
  String getFullWeekDayOfDate(DateTime dateTime) =>
      DateFormat.EEEE().format(dateTime);

  /// Get the Month of Date formatted (Abbreviated)
  String getMonthOfDate(DateTime dateTime) => DateFormat.LLL().format(dateTime);

  /// Get the Month of Date formatted with full name
  String getFullMonthOfDate(DateTime dateTime) =>
      DateFormat.LLLL().format(dateTime);

  /// Get the Day and Month of Date formatted
  /// [day] [abbr month]
  String getDayMonthOfDate(DateTime dateTime) =>
      DateFormat('dd MMM').format(dateTime);

  /// Get the Year of Date formatted with 2 digits (Abbreviated)
  String getYearOfDate(DateTime dateTime) => DateFormat('yy').format(dateTime);

  /// Get the Year of Date formatted with 4 digits
  String getFullYearOfDate(DateTime dateTime) =>
      DateFormat.y().format(dateTime);

  /// Get the full Date formatted
  /// [day] [abbr month] [abbr year]
  String getDayMonthYearOfDate(DateTime dateTime) =>
      DateFormat('d MMM yy').format(dateTime);

  /// Get the full Date formatted with hour and minutes
  /// [day] [abbr month] [abbr year], [hour 24]:[min]
  String getDayMonthYearHourMinOfDate(DateTime dateTime) =>
      DateFormat('dd MMM yy, HH:mm').format(dateTime);

  /// Get the Hour and minutes of Date formatted
  /// [hour 24]:[min]
  String getHourMinOfDate(DateTime dateTime) =>
      DateFormat.Hm().format(dateTime);

  /// Calculating and formatting date
  String getCalculatedFormattedDate(dynamic dateTime) {
    DateTime now = DateTime.now();
    if (dateTime.runtimeType != DateTime) {
      dateTime = DateTime.parse(dateTime);
    }

    // Today, show the time
    if (this.getDayOfDate(now) == this.getDayOfDate(dateTime)) {
      return this.getHourMinOfDate(dateTime);
    }

    // Yesterday, show 'Ontem'
    String yesterday = this.getDayOfDate(DateTime(
      now.year,
      now.month,
      now.day - 1,
      now.hour,
      now.minute,
      now.second,
    ));
    if (int.parse(yesterday) == int.parse(this.getDayOfDate(dateTime))) {
      return this.capitalize('ontem');
    }

    // Last 7 days, show the day of week
    String last7days = this.getDayOfDate(DateTime(
      now.year,
      now.month,
      now.day - 7,
      now.hour,
      now.minute,
      now.second,
    ));
    if (int.parse(last7days) < int.parse(this.getDayOfDate(dateTime))) {
      String dayWeek =
          this.getFullWeekDayOfDate(dateTime).replaceAll('-feira', '');
      return this.capitalize(dayWeek);
    }

    // Current year, show the day and month abbreviated
    if (this.getFullYearOfDate(now) == this.getFullYearOfDate(dateTime)) {
      return this.getDayMonthOfDate(dateTime).toUpperCase();
    }

    // Default, show day, month abbreviated and year abbreviated
    return this.getDayMonthYearOfDate(dateTime).toUpperCase();
  }

  /// Capitalize the first letter of a string
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
