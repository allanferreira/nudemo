import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  group('[Widget -> Home page] - Section II', () {
    String _title = 'Chinnon';

    final Finder _mainMenu = find.byKey(Key('section-ii'));
    final Finder _qrCode = find.byType(QrImage);
    final Finder _helpMeButton = find.byKey(Key('/helpme/'));
    final Finder _profileButton = find.byKey(Key('/profile/'));
    final Finder _nuContaConfigsButton = find.byKey(Key('/nuconta-configs/'));
    final Finder _cardConfigsButton = find.byKey(Key('/card-configs/'));
    final Finder _appConfigsButton = find.byKey(Key('/app-configs/'));
    final Finder _exitButton = find.byKey(Key('/exit/'));

    final Finder _animatedBox = find.byKey(Key('section-iv'));
    final Finder _buttonUp = find.byIcon(Icons.keyboard_arrow_up);
    final Finder _buttonDown = find.byIcon(Icons.keyboard_arrow_down);

    final Widget _pumpWidget = MultiProvider(
      providers: [
        ChangeNotifierProvider<BasicConstructionPresenter>(
          create: (context) => BasicConstructionPresenter(),
        ),
        ListenableProvider<AnimatedBoxPresenter>(
          create: (context) => AnimatedBoxPresenter(),
        ),
        ListenableProvider<FadeBoxPresenter>(
          create: (context) => FadeBoxPresenter(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(
          presenter: HomePresenter(),
          title: _title,
        ),
      ),
    );

    testWidgets('Checking widget smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// `Section II` - Main menu container

      /// verify if have a `ListView` widget.
      expect(
        find.descendant(of: _mainMenu, matching: find.byType(ListView)),
        findsOneWidget,
      );

      /// verify if have any `RichText` widget.
      expect(
        find.descendant(of: _mainMenu, matching: find.byType(RichText)),
        findsWidgets,
      );

      /// verify if have 5 `ListTile` widget.
      expect(
        find.descendant(of: _mainMenu, matching: find.byType(ListTile)),
        findsNWidgets(5),
      );

      /// verify if have any `Divider` widget.
      expect(
        find.descendant(of: _mainMenu, matching: find.byType(Divider)),
        findsWidgets,
      );
    });

    testWidgets('Drag down animated box smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// Verify that there is a `Align` Widget with key `section-iv`.
      expect(_animatedBox, findsOneWidget);

      /// [Closed State 🔽] Verify that there is a `keyboard_arrow_down`
      /// icon in `IconButton` Widget, and nothing `keyboard_arrow_up`.
      expect(_buttonUp, findsNothing);
      expect(_buttonDown, findsOneWidget);

      /// [Gesture 👆] Tap the `IconButton` Widget to drag `Down 🔽`
      /// and trigger all frames.
      await tester.tap(_buttonDown);
      await tester.pumpAndSettle();
    });

    testWidgets('QrImage smoke test - ${_title}', (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a `QrImage` widget.
      expect(
        find.descendant(of: _mainMenu, matching: _qrCode),
        findsOneWidget,
      );
    });

    testWidgets('`Me ajuda` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a `Icon` widget with `help_outline` icon.
      expect(
        find.descendant(
            of: _mainMenu, matching: find.byIcon(Icons.help_outline)),
        findsOneWidget,
      );

      /// verify if have text `Me ajuda`.
      expect(find.text('Me ajuda'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/helpme/` key/route (ListTile Widget).
      expect(_helpMeButton, findsOneWidget);

      /// tap the `/helpme/` item menu and trigger a frame.
      await tester.tap(_helpMeButton);
      await tester.pumpAndSettle();
    });

    testWidgets('`Perfil` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a `Icon` widget with `account_circle` icon.
      expect(
        find.byIcon(Icons.account_circle),
        findsOneWidget,
      );

      /// verify if have text `Perfil`.
      expect(find.text('Perfil'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/profile/` key/route (ListTile Widget).
      expect(_profileButton, findsOneWidget);

      /// tap the `/profile/` item menu and trigger a frame.
      await tester.tap(_profileButton);
      await tester.pumpAndSettle();
    });

    testWidgets('`Configurar NuConta` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// [Gesture 👉↔️👉] Drag `Up` the `ListView` Widget
      await tester.drag(
        _nuContaConfigsButton,
        Offset(0.0, 100),
      );
      await tester.pumpAndSettle();

      /// verify if have a `Icon` widget with `account_balance` icon.
      expect(
        find.descendant(
            of: _mainMenu, matching: find.byIcon(Icons.account_balance)),
        findsOneWidget,
      );

      /// verify if have text `Configurar NuConta`.
      expect(find.text('Configurar NuConta'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/nuconta-configs/` key/route (ListTile Widget).
      expect(_nuContaConfigsButton, findsOneWidget);

      /// tap the `/nuconta-configs/` item menu and trigger a frame.
      await tester.tap(_nuContaConfigsButton);
      await tester.pumpAndSettle();
    }, timeout: Timeout.factor(2));

    testWidgets('`Configurar cartão` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a `Icon` widget with `credit_card` icon.
      expect(
        find.descendant(
            of: _mainMenu, matching: find.byIcon(Icons.credit_card)),
        findsOneWidget,
      );

      /// verify if have text `Configurar cartão`.
      expect(find.text('Configurar cartão'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/card-configs/` key/route (ListTile Widget).
      expect(_cardConfigsButton, findsOneWidget);

      /// tap the `/card-configs/` item menu and trigger a frame.
      await tester.tap(_cardConfigsButton);
      await tester.pumpAndSettle();
    });

    testWidgets('`Configurações do app` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a `Icon` widget with `fingerprint` icon.
      expect(
        find.descendant(
            of: _mainMenu, matching: find.byIcon(Icons.fingerprint)),
        findsOneWidget,
      );

      /// verify if have text `Configurações do app`.
      expect(find.text('Configurações do app'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/app-configs/` key/route (ListTile Widget).
      expect(_appConfigsButton, findsOneWidget);

      /// tap the `/app-configs/` item menu and trigger a frame.
      await tester.tap(_appConfigsButton);
      await tester.pumpAndSettle();
    });

    testWidgets('`SAIR DA CONTA` button smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have text `SAIR DA CONTA`.
      expect(find.text('SAIR DA CONTA'), findsOneWidget);

      /// verify if have a button with `/exit/` key/route.
      expect(_exitButton, findsOneWidget);

      /// tap the `/exit/` item menu and trigger a frame.
      await tester.tap(_exitButton);
      await tester.pumpAndSettle();
    });
  });
}
