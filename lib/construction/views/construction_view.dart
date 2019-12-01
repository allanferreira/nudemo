/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/construction/presenter/construction_presenter.dart';

class ConstructionPage extends StatelessWidget {
  final ConstructionPresenter presenter;
  final String title;

  ConstructionPage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check system color and setup the theme
    // var brightness = MediaQuery.of(context).platformBrightness;
    // print('Platform Brightness: $brightness');

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
                fit: BoxFit.cover,
                // color: Colors.white,
                color: Theme.of(context).accentColor,
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'NOT',
                    style: TextStyle(
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
            Consumer<BasicConstructionPresenter>(
              builder: (context, counter, child) => Text(
                '${counter.getValue()}',
                key: Key('counter'),
                style: TextStyle(
                  fontFamily: 'Fredericka The Great',
                  fontSize: 100,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provider.of is another way to access the model object held
        // by an ancestor Provider.
        //
        // By using `listen: false` below, we are disabling that
        // behavior. We are only calling a function here, and so we don't care
        // about the current value. Without `listen: false`, we'd be rebuilding
        // the whole ConstructionPage whenever Counter notifies listeners.
        onPressed: () =>
            Provider.of<BasicConstructionPresenter>(context, listen: false)
                .onfloatingButtonClicked(),
        tooltip: 'Incrementar',
        key: Key('increment'),
        child: Icon(Icons.add),
      ),
    );
  }
}
