import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nudemo/main.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/utils/config.dart';

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

  group('[Widget -> Home page] - All Sections', () {
    final String _title = 'Home';

    final Finder _homePage = find.byKey(Key('home-page'));
    final Finder _signupPage = find.byKey(Key('signup-page'));

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

    testWidgets('Root smoke test - With user logged in - ${_title} [MyApp]',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      /// verify if have a `Scaffold` widget with `home-page` key.
      expect(_homePage, findsOneWidget);
    });

    testWidgets('Root smoke test - No logged in user - ${_title} [MyApp]',
        (WidgetTester tester) async {
      // Mock Global Variables
      config.globalVariablesMock(isLoggedIn: false, config: config);

      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      /// verify if have a `Stack` widget with `signup-page` key.
      expect(_signupPage, findsOneWidget);

      /// verify if have text `SIGN UP`.
      expect(find.text('Sign Up'.toUpperCase()), findsOneWidget);
    });

    testWidgets('General smoke test - Without mock - ${_title}',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpApp(HomeViewModel()));

      /// verify if have a `Scaffold` widget with `home-page` key.
      expect(_homePage, findsOneWidget);
    });

    testWidgets('General smoke test - ${_title}', (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// `All Sections`

      /// verify if have a `Scaffold` widget.
      expect(find.byType(Scaffold), findsOneWidget);

      /// verify if have any `Stack` widget.
      expect(find.byType(Stack), findsWidgets);

      /// verify if have any `SafeArea` widget.
      expect(find.byType(SafeArea), findsWidgets);

      /// verify if have any `Container` widget.
      expect(find.byType(Container), findsWidgets);

      /// verify if have any `Align` widget.
      expect(find.byType(Align), findsWidgets);

      /// verify if have any `Padding` widget.
      expect(find.byType(Padding), findsWidgets);

      /// verify if have any `ListView` widget.
      expect(find.byType(ListView), findsWidgets);

      /// verify if have any `Divider` widget.
      expect(find.byType(Divider), findsWidgets);

      /// verify if have any `RaisedButton` widget.
      expect(find.byType(RaisedButton), findsWidgets);

      /// verify if have any `RichText` widget.
      expect(find.byType(RichText), findsWidgets);
    });
  });
}
