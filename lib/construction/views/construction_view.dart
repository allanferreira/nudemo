/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/utils/utils.dart';

class ConstructionPage extends StatelessWidget {
  @required
  final ConstructionPresenter presenter;
  @required
  final String title;
  final EdgeInsets _paddingIconButton = EdgeInsets.all(16.0);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Utils utils = Utils();

  ConstructionPage({Key key, this.presenter, this.title}) : super(key: key);

  Widget _appBar(BuildContext context) => Container(
        // height: 56.0,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              key: Key('go-back-button'),
              icon: Icon(
                Icons.close,
                color: Theme.of(context).textTheme.title.color,
              ),
              tooltip: 'Go back',
              padding: _paddingIconButton,
              onPressed: () => Navigator.pop(context),
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
              onPressed: () => utils.showSnackBar(
                scaffoldKey: _scaffoldKey,
                context: context,
                text: 'Filtering not supported yet!',
              ),
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
            Divider(
              height: 20,
            ),
            RichText(
              key: Key('attencion'),
              text: TextSpan(
                text: 'This page has ',
                style: Theme.of(context).textTheme.body1,
                // style: TextStyle(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 20,
                // ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'NOT',
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  TextSpan(
                    text: ' been implemented ',
                  ),
                  TextSpan(
                    text: 'yet',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.wavy,
                    ),
                  ),
                  TextSpan(
                    text: '!!!',
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Divider(
              height: 20,
            ),
            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            Consumer<ConstructionPresenter>(
              builder: (context, counter, child) => Text(
                '${counter.getValue()}',
                key: Key('counter-text'),
                style: TextStyle(
                  fontFamily: 'Fredericka The Great',
                  fontSize: 100,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _floatingActionButton(BuildContext context) => FloatingActionButton(
        // Provider.of is another way to access the model object held
        // by an ancestor Provider.
        //
        // By using `listen: false` below, we are disabling that
        // behavior. We are only calling a function here, and so we don't care
        // about the current value. Without `listen: false`, we'd be rebuilding
        // the whole ConstructionPage whenever Counter notifies listeners.
        onPressed: () =>
            Provider.of<ConstructionPresenter>(context, listen: false)
                .onfloatingButtonClicked(),
        tooltip: 'Increment',
        backgroundColor: Theme.of(context).primaryColorDark,
        key: Key('increment-button'),
        child: Icon(
          Icons.add,
          color: Theme.of(context).textTheme.body2.color,
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
          key: Key('construction-page'),
          child: Scaffold(
            key: _scaffoldKey,
            body: _body(context),
            floatingActionButton: _floatingActionButton(context),
          ),
        ),
      ],
    );
  }
}
