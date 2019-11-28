/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/counter_presenter.dart';

class MyHomePage extends StatelessWidget {
  final CounterPresenter presenter;
  final String title;

  MyHomePage(this.presenter, {Key key, this.title}) : super(key: key);

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
            Text(
              'You have pushed the button this many times:',
            ),
            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            Consumer<BasicCounterPresenter>(
              builder: (context, counter, child) => Text(
                '${counter.getValue()}',
                key: Key('counter'),
                style: TextStyle(
                  fontFamily: 'Fredericka The Great',
                  fontSize: 80,
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
        // the whole MyHomePage whenever Counter notifies listeners.
        onPressed: () =>
            Provider.of<BasicCounterPresenter>(context, listen: false)
                .onfloatingButtonClicked(),
        tooltip: 'Increment',
        key: Key('increment'),
        child: Icon(Icons.add),
      ),
    );
  }
}
