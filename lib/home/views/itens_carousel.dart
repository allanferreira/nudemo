import 'package:flutter/material.dart';

import 'package:nudemo/utils/routes.dart';

/// The widgets to be shown in the carousel boxes.
class ItensCarousel {
  static List<Widget> itensList(BuildContext context) => [
        GestureDetector(
          child: Container(
            key: Key('/card/'),
            color: Colors.black45, // debug UI 🙃
            child: Column(
              children: <Widget>[
                /// Necessary for automated widget test, because the drag point
                /// target the center of widget, therefore, when the box is
                /// lowered the center of animated box widget is lost.
                /// This `drag point` is always displayed. 😉
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    key: Key('point-drag'),
                    padding: EdgeInsets.all(1),
                    // color: Colors.black, // debug UI 🙃
                  ),
                ),
                Center(
                  child: Text(
                    'Cartão de crédito',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Routes(context).navigatorPush(context, '/card/'),
          onDoubleTap: () => Routes(context).navigatorPush(context, '/card/'),
          onLongPress: () => Routes(context).navigatorPush(context, '/card/'),
        ),
        GestureDetector(
          child: Container(
            key: Key('/nuconta/'),
            color: Colors.black45, // debug UI 🙃
            child: Column(
              children: <Widget>[
                /// Necessary for automated widget test, because the drag point
                /// target the center of widget, therefore, when the box is
                /// lowered the center of animated box widget is lost.
                /// This `drag point` is always displayed. 😉
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    key: Key('point-drag'),
                    padding: EdgeInsets.all(1),
                    // color: Colors.black, // debug UI 🙃
                  ),
                ),
                Center(
                  child: Text(
                    'NuConta',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Routes(context).navigatorPush(context, '/nuconta/'),
          onDoubleTap: () =>
              Routes(context).navigatorPush(context, '/nuconta/'),
          onLongPress: () =>
              Routes(context).navigatorPush(context, '/nuconta/'),
        ),
        GestureDetector(
          child: Container(
            key: Key('/rewards/'),
            color: Colors.black45, // debug UI 🙃
            child: Column(
              children: <Widget>[
                /// Necessary for automated widget test, because the drag point
                /// target the center of widget, therefore, when the box is
                /// lowered the center of animated box widget is lost.
                /// This `drag point` is always displayed. 😉
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    key: Key('point-drag'),
                    padding: EdgeInsets.all(1),
                    // color: Colors.black, // debug UI 🙃
                  ),
                ),
                Center(
                  child: Text(
                    'Nubank rewards',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Routes(context).navigatorPush(context, '/rewards/'),
          onDoubleTap: () =>
              Routes(context).navigatorPush(context, '/rewards/'),
          onLongPress: () =>
              Routes(context).navigatorPush(context, '/rewards/'),
        ),
      ];
}
