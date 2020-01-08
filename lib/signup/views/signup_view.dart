/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nudemo/signup/presenter/signup_presenter.dart';
import 'package:nudemo/utils/utils.dart';

class SignupPage extends StatelessWidget {
  @required
  final SignupPresenter presenter;
  @required
  final String title;
  final EdgeInsets _paddingIconButton = EdgeInsets.all(16.0);
  final Utils utils = Utils();

  SignupPage({Key key, this.presenter, this.title}) : super(key: key);

  Widget _appBar(BuildContext context) => Container(
        // height: 56.0,
        color: Colors.black12,
        child: Row(
          children: <Widget>[
            IconButton(
              key: Key('go-back-button'),
              icon: Icon(
                Icons.close,
                color: Theme.of(context).textTheme.title.color,
              ),
              tooltip: 'Go back',
              padding: _paddingIconButton,
              onPressed: () =>
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            ),
            Text(
              title.toUpperCase(),
              key: Key('title-text'),
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget _body(BuildContext context) => Center(
        child: Column(
          children: <Widget>[
            _appBar(context),
            Container(
              width: 60,
              margin: EdgeInsets.only(top: 100.0),
              child: Image.asset(
                'assets/images/logo_white.png',
                fit: BoxFit.cover,
                color: Theme.of(context).primaryColorDark,
                key: Key('logo'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'After version 1.0.0, this application needs the 3 microservices to work perfectly: ',
                  style: Theme.of(context).textTheme.body1,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'customer-service',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: ', ',
                    ),
                    TextSpan(
                      text: 'account-service',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                      text: 'purchase-service',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: '.',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Learn more in the ',
                  style: Theme.of(context).textTheme.body1,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'README',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).primaryColor,
                        decorationStyle: TextDecorationStyle.wavy,
                      ),
                    ),
                    TextSpan(
                      text: ' file of this project!',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final Size _screenSize = _mediaQuery.size;
    final double _screenWidth = _screenSize.width;
    final double _screenHeight = _screenSize.height;
    final EdgeInsets _screenNotch = _mediaQuery.padding;
    // 10% of top space (more top notch)
    final double _topSpace = (_screenHeight * 0.10) + _screenNotch.top;
    final double _positionedHeight = _screenHeight - _topSpace;

    return Stack(
      children: <Widget>[
        Positioned(
          top: _topSpace,
          width: _screenWidth,
          height: _positionedHeight,
          key: Key('signup-page'),
          child: Scaffold(
            body: _body(context),
          ),
        ),
      ],
    );
  }
}
