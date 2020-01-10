import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/utils/config.dart';

/// `Section I` - Logo container
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Config config = Config();
  HomeViewModel homeViewModelMock = HomeViewModel();

  setUp(() {
    /// Mock Config class
    config.userUuid = "a1b2c3";
    config.accountUuid = "a1b2c3d4e5";

    /// Mock SharedPreferences
    SharedPreferences.setMockInitialValues(config.fullDataMock(config));

    /// Mock Global Variables
    config.globalVariablesMock(isLoggedIn: true, config: config);

    // Mocking ViewModel
    homeViewModelMock = config.homeViewModelMock(homeViewModelMock);
  });

  group('[Widget -> Home page] - Section I', () {
    final String _title = Config().userNickname;

    final Finder _sectionI = find.byKey(Key('section-i'));

    Widget _pumpApp(HomeViewModel homeViewModelMock) => MultiProvider(
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
              presenter: HomePresenter(homeViewModelMock),
              title: _title,
            ),
          ),
        );

    testWidgets('General smoke test - ${_title}', (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// verify if have a `Align` widget with `section-i` key.
      expect(_sectionI, findsOneWidget);

      /// verify if have a `Image` widget with `logo` key.
      expect(find.byKey(Key('logo-main')), findsOneWidget);

      /// verify if have a `Icon` widget with `icon-drag` key.
      expect(find.byKey(Key('icon-drag')), findsOneWidget);

      /// verify if have a `Icon` widget with `keyboard_arrow_down` icon.
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });
  });
}
