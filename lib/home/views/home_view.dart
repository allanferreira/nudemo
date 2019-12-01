/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/construction/views/construction_view.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  final String title;

  HomePage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('credit-card-button'),
        tooltip: 'Cartão de crédito',
        child: Icon(Icons.link),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConstructionPage(
              BasicConstructionPresenter(),
              title: 'Cartão de crédito',
            ),
          ),
        ),
        // This format did not pass the tests 🤷‍♂️
        // Navigator.of(context).pushNamed('/credit-card'),
      ),
    );
  }
}
