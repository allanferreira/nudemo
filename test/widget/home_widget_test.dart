import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/main.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Widget -> Home page]', () {
    String title = 'Chinnon';

    Finder _creditCardButton = find.byKey(Key('credit-card-button'));
    Finder _nucontaButton = find.byKey(Key('nuconta-button'));
    Finder _rewardsButton = find.byKey(Key('rewards-button'));

    Finder _helpMeItemMenu = find.byKey(Key('/helpme/'));
    Finder _profileItemMenu = find.byKey(Key('/profile/'));
    Finder _nucontaConfigsItemMenu = find.byKey(Key('/nuconta-configs/'));
    Finder _cardConfigsItemMenu = find.byKey(Key('/card-configs/'));
    Finder _appConfigsItemMenu = find.byKey(Key('/app-configs/'));

    testWidgets('Smoke test - ${title} [MyApp]', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      /// verify if have text `Chinnon` (route `/`).
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('Smoke test - ${title} [HomePage] - All Sections',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(HomePresenter(), title: title),
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

    testWidgets('Smoke test - ${title} [HomePage] - Section I',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(HomePresenter(), title: title),
        ),
      );

      /// `Section I` - Logo container

      /// verify if have a `Image` widget (logo).
      // expect(find.byType(Image), findsOneWidget);

      /// verify if have a `Icon` widget with `keyboard_arrow_down` icon.
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('Smoke test - ${title} [HomePage] - Section II',
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
              title: title,
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
      expect(_helpMeItemMenu, findsOneWidget);

      /// tap the `/helpme/` item menu and trigger a frame.
      await tester.tap(_helpMeItemMenu);

      /// verify if have text `Perfil`.
      expect(find.text('Perfil'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/profile/` key/route (ListTile Widget).
      expect(_profileItemMenu, findsOneWidget);

      /// tap the `/profile/` item menu and trigger a frame.
      await tester.tap(_profileItemMenu);

      /// verify if have text `Configurar NuConta`.
      expect(find.text('Configurar NuConta'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/nuconta-configs/` key/route (ListTile Widget).
      expect(_nucontaConfigsItemMenu, findsOneWidget);

      /// tap the `/nuconta-configs/` item menu and trigger a frame.
      await tester.tap(_nucontaConfigsItemMenu);

      /// verify if have text `Configurar cartão`.
      expect(find.text('Configurar cartão'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/card-configs/` key/route (ListTile Widget).
      expect(_cardConfigsItemMenu, findsOneWidget);

      /// tap the `/card-configs/` item menu and trigger a frame.
      await tester.tap(_cardConfigsItemMenu);

      /// verify if have text `Configurações do app`.
      expect(find.text('Configurações do app'), findsOneWidget);

      /// verify if have an item in the menu list with
      /// `/app-configs/` key/route (ListTile Widget).
      expect(_appConfigsItemMenu, findsOneWidget);

      /// tap the `/app-configs/` item menu and trigger a frame.
      await tester.tap(_appConfigsItemMenu);
    });

    testWidgets('Smoke test - ${title} [HomePage] - Section III',
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
              title: title,
            ),
          ),
        ),
      );

      /// `Section III` - Bottom menu container
    });

    testWidgets('Smoke test - ${title} [HomePage] - Section IV',
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
              title: title,
            ),
          ),
        ),
      );

      /// `Section IV` - Slide box container

      /// verify if have a Button widget with `credit-card-button` key.
      expect(_creditCardButton, findsOneWidget);

      /// tap the `credit-card-button` button and trigger a frame.
      await tester.tap(_creditCardButton);

      /// rebuild the widget with the new value.
      await tester.pump();

      /// verify if have a Button widget with `nuconta-button` key.
      expect(_nucontaButton, findsOneWidget);

      /// tap the `nuconta-button` button and trigger a frame.
      await tester.tap(_nucontaButton);

      /// rebuild the widget with the new value.
      await tester.pump();

      /// verify if have a Button widget with `credit-card-button` key.
      expect(_rewardsButton, findsOneWidget);

      /// tap the `rewards-button` button and trigger a frame.
      await tester.tap(_rewardsButton);

      /// rebuild the widget with the new value.
      await tester.pump();
    });
  });
}
