import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/main.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Widget -> Home page]', () {
    String _title = 'Chinnon';

    Finder _cardButton = find.byKey(Key('/card/'));
    Finder _nuContaButton = find.byKey(Key('/nuconta/'));
    Finder _rewardsButton = find.byKey(Key('/rewards/'));

    Finder _helpMeButton = find.byKey(Key('/helpme/'));
    Finder _profileButton = find.byKey(Key('/profile/'));
    Finder _nuContaConfigsButton = find.byKey(Key('/nuconta-configs/'));
    Finder _cardConfigsButton = find.byKey(Key('/card-configs/'));
    Finder _appConfigsButton = find.byKey(Key('/app-configs/'));
    Finder _exitButton = find.byKey(Key('/exit/'));

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

    testWidgets('Smoke test - ${_title} [MyApp]', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      /// verify if have text `Chinnon` (route `/`).
      expect(find.text(_title), findsOneWidget);
    });

    testWidgets('Smoke test - ${_title} [HomePage] - All Sections',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(HomePresenter(), title: _title),
        ),
      );

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

      /// verify if have any `FlutterLogo` widget.
      expect(find.byType(FlutterLogo), findsWidgets);

      /// verify if have any `RaisedButton` widget.
      expect(find.byType(RaisedButton), findsWidgets);

      /// verify if have any `RichText` widget.
      expect(find.byType(RichText), findsWidgets);
    });

    testWidgets('Smoke test - ${_title} [HomePage] - Section I',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(HomePresenter(), title: _title),
        ),
      );

      /// `Section I` - Logo container

      /// verify if have a `Image` widget with `logo` key.
      expect(find.byKey(Key('logo')), findsOneWidget);

      /// verify if have a `Icon` widget with `keyboard_arrow_down` icon.
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('Smoke test - ${_title} [HomePage] - Section II',
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

      /// `Section II` - Main menu container

      /// verify if have 5 `ListTile` widget.
      expect(find.byType(ListTile), findsNWidgets(5));

      /// verify if have text `Me ajuda`.
      expect(find.text('Me ajuda'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/helpme/` key/route (ListTile Widget).
      expect(_helpMeButton, findsOneWidget);

      /// tap the `/helpme/` item menu and trigger a frame.
      await tester.tap(_helpMeButton);

      /// verify if have text `Perfil`.
      expect(find.text('Perfil'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/profile/` key/route (ListTile Widget).
      expect(_profileButton, findsOneWidget);

      /// tap the `/profile/` item menu and trigger a frame.
      await tester.tap(_profileButton);

      /// verify if have text `Configurar NuConta`.
      expect(find.text('Configurar NuConta'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/nuconta-configs/` key/route (ListTile Widget).
      expect(_nuContaConfigsButton, findsOneWidget);

      /// tap the `/nuconta-configs/` item menu and trigger a frame.
      await tester.tap(_nuContaConfigsButton);

      /// verify if have text `Configurar cartão`.
      expect(find.text('Configurar cartão'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/card-configs/` key/route (ListTile Widget).
      expect(_cardConfigsButton, findsOneWidget);

      /// tap the `/card-configs/` item menu and trigger a frame.
      await tester.tap(_cardConfigsButton);

      /// verify if have text `Configurações do app`.
      expect(find.text('Configurações do app'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/app-configs/` key/route (ListTile Widget).
      expect(_appConfigsButton, findsOneWidget);

      /// tap the `/app-configs/` item menu and trigger a frame.
      await tester.tap(_appConfigsButton);

      /// verify if have text `SAIR DA CONTA`.
      expect(find.text('SAIR DA CONTA'), findsOneWidget);

      /// verify if have a button with `/exit/` key/route.
      expect(_exitButton, findsOneWidget);

      /// tap the `/exit/` item menu and trigger a frame.
      await tester.tap(_exitButton);
    });

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

    testWidgets('Smoke test - ${_title} [HomePage] - Section IV',
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

      /// `Section IV` - Slide box container

      /// verify if have a Button widget with `/card/` key.
      expect(_cardButton, findsOneWidget);

      /// tap the `/card/` button and trigger a frame.
      await tester.tap(_cardButton);

      /// rebuild the widget with the new value.
      await tester.pump();

      /// verify if have a Button widget with `/nuconta/` key.
      expect(_nuContaButton, findsOneWidget);

      /// tap the `/nuconta/` button and trigger a frame.
      await tester.tap(_nuContaButton);

      /// rebuild the widget with the new value.
      await tester.pump();

      /// verify if have a Button widget with `/rewards/` key.
      expect(_rewardsButton, findsOneWidget);

      /// tap the `/rewards/` button and trigger a frame.
      await tester.tap(_rewardsButton);

      /// rebuild the widget with the new value.
      await tester.pump();
    });
  });
}
