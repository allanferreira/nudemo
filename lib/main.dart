import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Get Customer and Account saved or register a new on API.
  final bool loggedInUser = await HomePresenter().initialUserData();
  runApp(MyApp(loggedInUser: loggedInUser));
}

class MyApp extends StatelessWidget {
  final bool loggedInUser;

  MyApp({this.loggedInUser = false});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePresenter>(
          create: (BuildContext context) => HomePresenter(),
        ),
        ChangeNotifierProvider<ConstructionPresenter>(
          create: (BuildContext context) => ConstructionPresenter(),
        ),
        ChangeNotifierProvider<CardPresenter>(
          create: (BuildContext context) => CardPresenter(),
        ),
        ListenableProvider<AnimatedBoxPresenter>(
          create: (BuildContext context) => AnimatedBoxPresenter(),
        ),
        ListenableProvider<FadeBoxPresenter>(
          create: (BuildContext context) => FadeBoxPresenter(),
        ),
        ListenableProvider<FadeButtonsPresenter>(
          create: (BuildContext context) => FadeButtonsPresenter(),
        ),
      ],
      child: Consumer<HomePresenter>(
        builder: (context, homePresenter, child) => MaterialApp(
          key: Key('app-root'),
          title: 'NuDemo',
          theme: homePresenter.getNuTheme(),
          home: homePresenter.firstPage(loggedInUser),
        ),
      ),
    );
  }
}
