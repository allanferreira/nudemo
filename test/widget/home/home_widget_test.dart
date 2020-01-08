import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nudemo/main.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/utils/config.dart';

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
  });

  group('[Widget -> Home page] - All Sections', () {
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

    testWidgets('Smoke test - ${_title} [MyApp]', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp(loggedInUser: true));

      /// verify if have text `Chinnon` (route `/`).
      // expect(find.text(_title), findsOneWidget);
      expect(find.text('{userNickname}'), findsOneWidget);
    });

    testWidgets('Smoke test - ${_title}', (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

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
