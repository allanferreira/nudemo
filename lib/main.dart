import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/themes/theme.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/basic_animated_box_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final NuThemes nuThemes = NuThemes();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BasicConstructionPresenter>(
          create: (context) => BasicConstructionPresenter(),
        ),
        ListenableProvider<BasicAnimatedBoxPresenter>(
          create: (context) => BasicAnimatedBoxPresenter(),
        ),
      ],
      child: MaterialApp(
        key: Key('app-root'),
        title: 'NuDemo',
        theme: nuThemes.getThemeFromKey(NuThemeKeys.DEFAULT),
        home: HomePage(
          presenter: HomePresenter(),
          title: 'Chinnon',
        ),
      ),
    );
  }
}
