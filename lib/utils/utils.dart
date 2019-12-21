import 'package:flutter/material.dart';

class Utils {
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
}
