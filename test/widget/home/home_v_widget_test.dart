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

/// `Section V` - Slide box container widget test
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

  group('[Widget -> Home page] - Section V', () {
    final String _title = 'Dotted carousel indicator';

    final Finder _sectionV = find.byKey(Key('section-v'));

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
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// Verify that there is a `Positioned` Widget with key `section-v`.
      expect(_sectionV, findsOneWidget);

      /// verify if have a SliderBox dotted indicator.
      expect(find.byKey(Key('slider-dotted')), findsOneWidget);

      /// verify if have any dotted item.
      [1, 2, 3].map((index) {
        expect(find.byKey(Key('dotted-$index')), findsOneWidget);
      });
    });
  });
}
