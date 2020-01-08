import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

/// `Section V` - Slide box container widget test
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
      "limitPercent": HomeViewModel.limitPercent,
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
    globals.limitPercent = HomeViewModel.limitPercent;
    globals.balancesOpenValue = HomeViewModel.balancesOpenValue;
    globals.balancesOpenPercent = HomeViewModel.balancesOpenPercent;
    globals.balancesOpenFlex = HomeViewModel.balancesOpenFlex;
    globals.balancesAvailableValue = HomeViewModel.balancesAvailableValue;
    globals.balancesAvailablePercent = HomeViewModel.balancesAvailablePercent;
    globals.balancesAvailableFlex = HomeViewModel.balancesAvailableFlex;
  });

  group('[Widget -> Home page] - Section V', () {
    final String _title = 'Dotted carousel indicator';

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
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpWidget);

      /// Verify that there is a `Positioned` Widget with key `section-v`.
      expect(find.byKey(Key('section-v')), findsOneWidget);

      /// verify if have a SliderBox dotted indicator.
      expect(find.byKey(Key('slider-dotted')), findsOneWidget);

      /// verify if have any dotted item.
      [1, 2, 3].map((index) {
        expect(find.byKey(Key('dotted-$index')), findsOneWidget);
      });
    });
  });
}
