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

/// `Section III` - Bottom menu container
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

  group('[Widget -> Home page] - Section III', () {
    final String _title = Config().userNickname;

    final Finder _sectionIII = find.byKey(Key('section-iii'));
    final Finder _buttonList = find.byKey(Key('button-list'));
    final Finder _transferButton = find.byKey(Key('/transfer/'));
    final Finder _virtualCardButton = find.byKey(Key('/virtual-card/'));
    final Finder _payButton = find.byKey(Key('/pay/'));
    final Finder _blockingCardButton = find.byKey(Key('/blocking-card/'));
    final Finder _depositButton = find.byKey(Key('/deposit/'));
    final Finder _chargeButton = find.byKey(Key('/charge/'));
    final Finder _mobileRechargeButton = find.byKey(Key('/mobile-recharge/'));
    final Finder _referFriendsButton = find.byKey(Key('/refer-friends/'));
    final Finder _adjustLimitButton = find.byKey(Key('/adjust-limit/'));
    final Finder _organizeShortcutsButton =
        find.byKey(Key('/organize-shortcuts/'));

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

      /// verify if have a `Align` widget with `section-iii` key.
      expect(_sectionIII, findsOneWidget);
    });

    testWidgets('`Transferir` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// verify if have a `Icon` widget with `attach_money` icon.
      expect(find.byIcon(Icons.attach_money), findsOneWidget);

      /// verify if have text `Transferir`.
      expect(find.text('Transferir'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/transfer/` key/route (ListView Widget).
      expect(_transferButton, findsOneWidget);

      /// tap the `/transfer/` item menu and trigger a frame.
      await tester.tap(_transferButton);
    });

    testWidgets('`Cartão virtual` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// verify if have a `Icon` widget with `credit_card` icon.
      expect(
        find.descendant(
            of: _buttonList, matching: find.byIcon(Icons.credit_card)),
        findsOneWidget,
      );

      /// verify if have text `Cartão virtual`.
      expect(find.text('Cartão virtual'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/virtual-card/` key/route (ListView Widget).
      expect(_virtualCardButton, findsOneWidget);

      /// tap the `/virtual-card/` item menu and trigger a frame.
      await tester.tap(_virtualCardButton);
    });

    testWidgets('`Pagar` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// verify if have a `Icon` widget with `flip` icon.
      expect(find.byIcon(Icons.flip), findsOneWidget);

      /// verify if have text `Pagar`.
      expect(find.text('Pagar'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/pay/` key/route (ListView Widget).
      expect(_payButton, findsOneWidget);

      /// tap the `/pay/` item menu and trigger a frame.
      await tester.tap(_payButton);
    });

    testWidgets('`Bloquear cartão` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_blockingCardButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// verify if have a `Icon` widget with `lock_open` icon.
      expect(find.byIcon(Icons.lock_open), findsOneWidget);

      /// verify if have text `Bloquear cartão`.
      expect(find.text('Bloquear cartão'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/blocking-card/` key/route (ListView Widget).
      expect(_blockingCardButton, findsOneWidget);

      /// tap the `/blocking-card/` item menu and trigger a frame.
      await tester.tap(_blockingCardButton);
    }, timeout: Timeout.factor(2));

    testWidgets('`Depositar` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_blockingCardButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// verify if have a `Icon` widget with `local_atm` icon.
      expect(
        find.descendant(
            of: _buttonList, matching: find.byIcon(Icons.local_atm)),
        findsOneWidget,
      );

      /// verify if have text `Depositar`.
      expect(find.text('Depositar'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/deposit/` key/route (ListView Widget).
      expect(_depositButton, findsOneWidget);

      /// tap the `/deposit/` item menu and trigger a frame.
      await tester.tap(_depositButton);
    }, timeout: Timeout.factor(2));

    testWidgets('`Cobrar` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_blockingCardButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_depositButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// verify if have a `Icon` widget with `account_balance_wallet` icon.
      expect(find.byIcon(Icons.account_balance_wallet), findsOneWidget);

      /// verify if have text `Cobrar`.
      expect(find.text('Cobrar'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/charge/` key/route (ListView Widget).
      expect(_chargeButton, findsOneWidget);

      /// tap the `/charge/` item menu and trigger a frame.
      await tester.tap(_chargeButton);
    }, timeout: Timeout.factor(2));

    testWidgets('`Recarga de celular` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_blockingCardButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_depositButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// verify if have a `Icon` widget with `phone_iphone` icon.
      expect(find.byIcon(Icons.phone_iphone), findsOneWidget);

      /// verify if have text `Recarga de celular`.
      expect(find.text('Recarga de celular'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/mobile-recharge/` key/route (ListView Widget).
      expect(_mobileRechargeButton, findsOneWidget);

      /// tap the `/mobile-recharge/` item menu and trigger a frame.
      await tester.tap(_mobileRechargeButton);
    }, timeout: Timeout.factor(2));

    testWidgets('`Indicar amigos` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_blockingCardButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_depositButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// verify if have a `Icon` widget with `person_add` icon.
      expect(find.byIcon(Icons.person_add), findsOneWidget);

      /// verify if have text `Indicar amigos`.
      expect(find.text('Indicar amigos'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/refer-friends/` key/route (ListView Widget).
      expect(_referFriendsButton, findsOneWidget);

      /// tap the `/refer-friends/` item menu and trigger a frame.
      await tester.tap(_referFriendsButton);
    }, timeout: Timeout.factor(2));

    testWidgets('`Ajustar limite` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_blockingCardButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_depositButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// verify if have a `Icon` widget with `settings_input_component` icon.
      expect(find.byIcon(Icons.settings_input_component), findsOneWidget);

      /// verify if have text `Ajustar limite`.
      expect(find.text('Ajustar limite'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/adjust-limit/` key/route (ListView Widget).
      expect(_adjustLimitButton, findsOneWidget);

      /// tap the `/adjust-limit/` item menu and trigger a frame.
      await tester.tap(_adjustLimitButton);
    }, timeout: Timeout.factor(2));

    testWidgets('`Organizar atalhos` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpApp(homeViewModelMock));

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_blockingCardButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_depositButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// [Gesture 👉↔️👉] Drag `LEFT` the `Container` Widget
      await tester.drag(_referFriendsButton, Offset(-240.0, 0.0));
      await tester.pumpAndSettle();

      /// verify if have a `Icon` widget with `format_list_numbered` icon.
      expect(find.byIcon(Icons.format_list_numbered), findsOneWidget);

      /// verify if have text `Organizar atalhos`.
      expect(find.text('Organizar atalhos'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/organize-shortcuts/` key/route (ListView Widget).
      expect(_organizeShortcutsButton, findsOneWidget);

      /// tap the `/organize-shortcuts/` item menu and trigger a frame.
      await tester.tap(_organizeShortcutsButton);
    }, timeout: Timeout.factor(2));
  });
}
