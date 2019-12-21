/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';

import 'package:nudemo/nuconta/presenter/nuconta_presenter.dart';

class NucontaPage extends StatelessWidget {
  @required
  final NucontaPresenter presenter;
  @required
  final String title;
  final EdgeInsets _paddingIconButton = EdgeInsets.all(16.0);

  NucontaPage({Key key, this.presenter, this.title}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      key: Key('snackBar'),
      content: Text(
        'Filtering not supported yet!',
        style: Theme.of(context).textTheme.body2,
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget _appBar(BuildContext context) => Container(
        // height: 56.0,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.only(left: 6.0),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              child: Row(
                key: Key('go-back-button'),
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_left,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                  Icon(
                    Icons.local_atm,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                ],
              ),
            ),
            Text(
              title.toUpperCase(),
              key: Key('title-text'),
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
            IconButton(
              key: Key('filter-button'),
              icon: Icon(
                Icons.search,
                color: Theme.of(context).textTheme.title.color,
              ),
              tooltip: 'Filter',
              padding: _paddingIconButton,
              onPressed: () {
                _showSnackBar(context);
              },
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
                color: Theme.of(context).primaryColor,
                key: Key('logo'),
              ),
            ),
            Divider(
              height: 30,
            ),
            Text('This page has NOT been implemented yet!!!'),
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
    final double _topSpace = _screenNotch.top;
    final double _positionedHeight = _screenHeight - _topSpace;

    return Stack(
      children: <Widget>[
        Positioned(
          top: _topSpace,
          width: _screenWidth,
          height: _positionedHeight,
          key: Key('nuconta-page'),
          child: Scaffold(
            key: _scaffoldKey,
            body: _body(context),
          ),
        ),
      ],
    );
  }
}
