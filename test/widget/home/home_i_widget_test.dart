import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/globals.dart' as globals;

/// `Section I` - Logo container
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    /// Mock SharedPreferences
    SharedPreferences.setMockInitialValues({
      'userUuid': 'a1b2c3',
      'userName': Config().userName,
      'userNickname': Config().userNickname,
      'userEmail': Config().userEmail,
      'userPhone': Config().userPhone,
      'accountUuid': 'c3b2a1',
      'bankBranch': Config().bankBranch,
      'bankAccount': Config().bankAccount,
      'accountLimit': Config().accountLimit,
    });

    // Mock Global Variables
    globals.userUuid = 'a1b2c3';
    globals.accountUuid = 'c3b2a1';
  });

  group('[Widget -> Home page] - Section I', () {
    final String _title = Config().userNickname;

    final Widget _pumpWidget = MultiProvider(
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
      child: MaterialApp(
        home: HomePage(
          presenter: HomePresenter(),
          title: _title,
        ),
      ),
    );

    testWidgets('Smoke test - ${_title}', (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a `Image` widget with `logo` key.
      expect(find.byKey(Key('logo-main')), findsOneWidget);

      /// verify if have a `Icon` widget with `icon-drag` key.
      expect(find.byKey(Key('icon-drag')), findsOneWidget);

      /// verify if have a `Icon` widget with `keyboard_arrow_down` icon.
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });
  });
}
