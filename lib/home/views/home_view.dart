/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:nudemo/utils/routes.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  final String title;

  HomePage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          key: Key('title-text'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 60,
              child: Image.asset(
                'assets/images/logo_white.png',
                key: Key('logo'),
                fit: BoxFit.cover,
                // color: Colors.white,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              'Backbone',
              key: Key('home-text'),
            ),
            Divider(
              height: 10,
            ),
            RaisedButton(
              key: Key('credit-card-button'),
              onPressed: () {
                Routes(context).navigatorPush(context, '/credit-card');
              },
              child: Text('Cartão de crédito'),
            ),
            Divider(
              height: 10,
            ),
            RaisedButton(
              key: Key('nuconta-button'),
              onPressed: () {
                Routes(context).navigatorPush(context, '/nuconta');
              },
              child: Text('NuConta'),
            ),
            Divider(
              height: 10,
            ),
            RaisedButton(
              key: Key('rewards-button'),
              onPressed: () {
                Routes(context).navigatorPush(context, '/rewards');
              },
              child: Text('Nubank rewards'),
            ),
            Divider(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
