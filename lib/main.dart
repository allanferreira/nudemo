import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/themes/theme.dart';
import 'package:nudemo/utils/routes.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BasicConstructionPresenter(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  final NuThemes nuThemes = NuThemes();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: nuThemes.getThemeFromKey(NuThemeKeys.DEFAULT),
      // MaterialApp contains our top-level Navigator
      initialRoute: '/',
      routes: routes,
    );
  }
}
