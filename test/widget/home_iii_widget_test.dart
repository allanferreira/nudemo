import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Widget -> Home page]', () {
    String _title = 'Chinnon';

    Finder _transferButton = find.byKey(Key('/transfer/'));
    Finder _virtualCardButton = find.byKey(Key('/virtual-card/'));
    Finder _payButton = find.byKey(Key('/pay/'));
    Finder _blockingCardButton = find.byKey(Key('/blocking-card/'));
    Finder _depositButton = find.byKey(Key('/deposit/'));
    Finder _chargeButton = find.byKey(Key('/charge/'));
    Finder _mobileRechargeButton = find.byKey(Key('/mobile-recharge/'));
    Finder _referFriendsButton = find.byKey(Key('/refer-friends/'));
    // Finder _adjustLimitButton = find.byKey(Key('/adjust-limit/'));
    // Finder _organizeShortcutsButton = find.byKey(Key('/organize-shortcuts/'));

    testWidgets('Smoke test - ${_title} [HomePage] - Section III',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<BasicConstructionPresenter>.value(
              value: BasicConstructionPresenter(),
            ),
          ],
          child: MaterialApp(
            home: HomePage(
              HomePresenter(),
              title: _title,
            ),
          ),
        ),
      );

      /// `Section III` - Bottom menu container

      /// verify if have a `Icon` widget with `attach_money` icon.
      expect(find.byIcon(Icons.attach_money), findsOneWidget);

      /// verify if have text `Transferir`.
      expect(find.text('Transferir'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/transfer/` key/route (ListView Widget).
      expect(_transferButton, findsOneWidget);

      /// tap the `/transfer/` item menu and trigger a frame.
      await tester.tap(_transferButton);

      /// verify if have a `Icon` widget with `credit_card` icon.
      expect(find.byIcon(Icons.credit_card), findsOneWidget);

      /// verify if have text `Cartão virtual`.
      expect(find.text('Cartão virtual'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/virtual-card/` key/route (ListView Widget).
      expect(_virtualCardButton, findsOneWidget);

      /// tap the `/virtual-card/` item menu and trigger a frame.
      await tester.tap(_virtualCardButton);

      /// verify if have a `Icon` widget with `flip` icon.
      expect(find.byIcon(Icons.flip), findsOneWidget);

      /// verify if have text `Pagar`.
      expect(find.text('Pagar'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/pay/` key/route (ListView Widget).
      expect(_payButton, findsOneWidget);

      /// tap the `/pay/` item menu and trigger a frame.
      await tester.tap(_payButton);

      /// verify if have a `Icon` widget with `lock_open` icon.
      expect(find.byIcon(Icons.lock_open), findsOneWidget);

      /// verify if have text `Bloquear cartão`.
      expect(find.text('Bloquear cartão'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/blocking-card/` key/route (ListView Widget).
      expect(_blockingCardButton, findsOneWidget);

      /// tap the `/blocking-card/` item menu and trigger a frame.
      await tester.tap(_blockingCardButton);

      /// verify if have a `Icon` widget with `account_balance` icon.
      expect(find.byIcon(Icons.account_balance), findsOneWidget);

      /// verify if have text `Depositar`.
      expect(find.text('Depositar'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/deposit/` key/route (ListView Widget).
      expect(_depositButton, findsOneWidget);

      /// tap the `/deposit/` item menu and trigger a frame.
      await tester.tap(_depositButton);

      /// verify if have a `Icon` widget with `account_balance_wallet` icon.
      expect(find.byIcon(Icons.account_balance_wallet), findsOneWidget);

      /// verify if have text `Cobrar`.
      expect(find.text('Cobrar'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/charge/` key/route (ListView Widget).
      expect(_chargeButton, findsOneWidget);

      /// tap the `/charge/` item menu and trigger a frame.
      await tester.tap(_chargeButton);

      /// verify if have a `Icon` widget with `phone_iphone` icon.
      expect(find.byIcon(Icons.phone_iphone), findsOneWidget);

      /// verify if have text `Recarga de celular`.
      expect(find.text('Recarga de celular'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/mobile-recharge/` key/route (ListView Widget).
      expect(_mobileRechargeButton, findsOneWidget);

      /// tap the `/mobile-recharge/` item menu and trigger a frame.
      await tester.tap(_mobileRechargeButton);

      /// verify if have a `Icon` widget with `person_add` icon.
      expect(find.byIcon(Icons.person_add), findsOneWidget);

      /// verify if have text `Indicar amigos`.
      expect(find.text('Indicar amigos'), findsOneWidget);

      /// verify if have an item in the bottom menu list with
      /// `/refer-friends/` key/route (ListView Widget).
      expect(_referFriendsButton, findsOneWidget);

      /// tap the `/refer-friends/` item menu and trigger a frame.
      await tester.tap(_referFriendsButton);

      // /// verify if have a `Icon` widget with `settings_input_component` icon.
      // expect(find.byIcon(Icons.settings_input_component), findsOneWidget);

      // /// verify if have text `Ajustar limite`.
      // expect(find.text('Ajustar limite'), findsOneWidget);

      // /// verify if have an item in the bottom menu list with
      // /// `/adjust-limit/` key/route (ListView Widget).
      // expect(_adjustLimitButton, findsOneWidget);

      // /// tap the `/adjust-limit/` item menu and trigger a frame.
      // await tester.tap(_adjustLimitButton);

      // /// verify if have a `Icon` widget with `format_list_numbered` icon.
      // expect(find.byIcon(Icons.format_list_numbered), findsOneWidget);

      // /// verify if have text `Organizar atalhos`.
      // expect(find.text('Organizar atalhos'), findsOneWidget);

      // /// verify if have an item in the bottom menu list with
      // /// `/organize-shortcuts/` key/route (ListView Widget).
      // expect(_organizeShortcutsButton, findsOneWidget);

      // /// tap the `/organize-shortcuts/` item menu and trigger a frame.
      // await tester.tap(_organizeShortcutsButton);
    });
  });
}
