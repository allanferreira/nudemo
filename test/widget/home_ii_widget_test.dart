import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/basic_animated_box_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Widget -> Home page] - Section II', () {
    String _title = 'Chinnon';

    Finder _helpMeButton = find.byKey(Key('/helpme/'));
    Finder _profileButton = find.byKey(Key('/profile/'));
    Finder _nuContaConfigsButton = find.byKey(Key('/nuconta-configs/'));
    Finder _cardConfigsButton = find.byKey(Key('/card-configs/'));
    Finder _appConfigsButton = find.byKey(Key('/app-configs/'));
    Finder _exitButton = find.byKey(Key('/exit/'));

    testWidgets('Smoke test - ${_title}', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<BasicConstructionPresenter>(
              create: (context) => BasicConstructionPresenter(),
            ),
            ListenableProvider<BasicAnimatedBoxPresenter>(
              create: (context) => BasicAnimatedBoxPresenter(),
            ),
          ],
          child: MaterialApp(
            home: HomePage(
              presenter: HomePresenter(),
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
  });
}
