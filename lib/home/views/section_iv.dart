import 'package:flutter/material.dart';

import 'package:nudemo/utils/routes.dart';

/// `Section IV` - Slide box container
class SectionIV extends StatelessWidget {
  @required
  final double screenWidth;
  @required
  final double topLogoHeight;
  @required
  final double boxSlideHeight;

  SectionIV({
    this.screenWidth,
    this.topLogoHeight,
    this.boxSlideHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: topLogoHeight,
      width: screenWidth,
      height: boxSlideHeight,
      child: Container(
        padding: EdgeInsets.only(
          left: 20.0,
          top: 60.0,
          right: 20.0,
          bottom: 60.0,
        ),
        color: Colors.blue.withOpacity(0.3),
        child: Container(
          color: Colors.pinkAccent.withOpacity(0.5),
          child: Column(
            children: <Widget>[
              RaisedButton(
                key: Key('/card/'),
                onPressed: () {
                  Routes(context).navigatorPush(context, '/card/');
                },
                child: Text('Cartão de crédito'),
              ),
              Divider(
                height: 10,
              ),
              RaisedButton(
                key: Key('/nuconta/'),
                onPressed: () {
                  Routes(context).navigatorPush(context, '/nuconta/');
                },
                child: Text('NuConta'),
              ),
              Divider(
                height: 10,
              ),
              RaisedButton(
                key: Key('/rewards/'),
                onPressed: () {
                  Routes(context).navigatorPush(context, '/rewards/');
                },
                child: Text('Nubank rewards'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
