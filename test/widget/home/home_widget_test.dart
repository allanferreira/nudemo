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
import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/globals.dart' as globals;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Config config = Config();

  setUp(() {
    /// Mock Config class
    config.userUuid = "a1b2c3";
    config.accountUuid = "a1b2c3d4e5";

    /// Mock SharedPreferences
    SharedPreferences.setMockInitialValues({
      "userUuid": config.userUuid,
      "userName": config.userName,
      "userNickname": config.userNickname,
      "userEmail": config.userEmail,
      "userPhone": config.userPhone,
      "accountUuid": config.accountUuid,
      "bankBranch": config.bankBranch,
      "bankAccount": config.bankAccount,
      "accountLimit": config.accountLimit,
      "balancesOpenValue": HomeViewModel.balancesOpenValue,
      "balancesOpenPercent": HomeViewModel.balancesOpenPercent,
      "balancesOpenFlex": HomeViewModel.balancesOpenFlex,
      "balancesAvailableValue": HomeViewModel.balancesAvailableValue,
      "balancesAvailablePercent": HomeViewModel.balancesAvailablePercent,
      "balancesAvailableFlex": HomeViewModel.balancesAvailableFlex,
    });

    /// Mock Global Variables
    globals.isLoggedIn = true;
    globals.userUuid = config.userUuid;
    globals.userName = config.userName;
    globals.userNickname = config.userNickname;
    globals.userEmail = config.userEmail;
    globals.userPhone = config.userPhone;
    globals.accountUuid = config.accountUuid;
    globals.bankBranch = config.bankBranch;
    globals.bankAccount = config.bankAccount;
    globals.accountLimit = config.accountLimit;
    globals.balancesOpenValue = HomeViewModel.balancesOpenValue;
    globals.balancesOpenPercent = HomeViewModel.balancesOpenPercent;
    globals.balancesOpenFlex = HomeViewModel.balancesOpenFlex;
    globals.balancesAvailableValue = HomeViewModel.balancesAvailableValue;
    globals.balancesAvailablePercent = HomeViewModel.balancesAvailablePercent;
    globals.balancesAvailableFlex = HomeViewModel.balancesAvailableFlex;
  });

  group('[Widget -> Home page] - All Sections', () {
    final String _title = 'Home';

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
      await tester.pumpWidget(MyApp());

      /// verify if have text `Chinnon` (route `/`).
      expect(find.text(Config().userNickname), findsOneWidget);
    });

    testWidgets('Smoke test - ${_title} [MyApp]', (WidgetTester tester) async {
      // Mock Global Variables
      globals.isLoggedIn = false;

      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      /// verify if have text `SIGN UP` (route `/`).
      expect(find.text('Sign Up'.toUpperCase()), findsOneWidget);
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
