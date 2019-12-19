import 'package:flutter/material.dart';

class Utils {
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
      width: width,
      decoration: BoxDecoration(
        // color: Colors.grey, // debug UI 🙃
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        children: <Widget>[
          /// Balances future [orange]
          Expanded(
            flex: flexFuture,
            child: Container(
              color: _textTheme.display4.color,
            ),
          ),

          /// Balances open [blue]
          Expanded(
            flex: flexOpen,
            child: Container(
              color: _textTheme.display3.color,
            ),
          ),

          /// Balances prepaid ❔❔❔ I don't know the color...
          /// Is there❔ Is it green too❔
          /// Balances due [red]
          Expanded(
            flex: flexDue,
            child: Container(
              color: _textTheme.display2.color,
            ),
          ),

          /// Balances available [green]
          Expanded(
            flex: flexAvailable,
            child: Container(
              color: _textTheme.display1.color,
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
