/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/utils/utils.dart';

class CardPage extends StatelessWidget {
  @required
  final CardPresenter presenter;
  @required
  final String title;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomePresenter homePresenter = HomePresenter();
  final Utils utils = Utils();

  CardPage({Key key, this.presenter, this.title}) : super(key: key);

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

  Widget _appBar(context) => Container(
        // height: 56.0,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Row(
                key: Key('go-back-button'),
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_left,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                  Icon(
                    Icons.credit_card,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                ],
              ),
              onTap: () => Navigator.pop(context),
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
              padding: EdgeInsets.all(16.0),
              onPressed: () {
                _showSnackBar(context);
              },
            ),
          ],
        ),
      );

  Widget _body(context) => Center(
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
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    // final Size _screenSize = _mediaQuery.size;
    // final double _screenWidth = _screenSize.width;
    // final double _screenHeight = _screenSize.height;
    final EdgeInsets _screenNotch = _mediaQuery.padding;
    final double _topSpace = _screenNotch.top;
    final double _widthVerticalChartBar = 12.0;

    /// Calculate percentage balances
    homePresenter.calculatePercentBalances();

    return Stack(
      children: <Widget>[
        // Main list
        Positioned(
          top: _topSpace,
          bottom: 0,
          left: 0,
          right: _widthVerticalChartBar,
          key: Key('card-page'),
          child: Scaffold(
            key: _scaffoldKey,
            body: _body(context),
          ),
        ),
        // Vertical chart bar
        Positioned(
          top: _topSpace,
          width: _widthVerticalChartBar,
          right: 0,
          bottom: 0,
          child: utils.verticalChartBar(
            context: context,
            width: 8.0,
            flexFuture: homePresenter.getFutureFlex(),
            flexOpen: homePresenter.getOpenFlex(),
            flexDue: homePresenter.getDueFlex(),
            flexAvailable: homePresenter.getAvailableFlex(),
          ),
        ),
      ],
    );
  }
}
