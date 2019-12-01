import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/main.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Widget -> Home page]', () {
    String title = 'NU {customer}';
    testWidgets('Smoke test - ${title} [MyApp]', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<BasicConstructionPresenter>.value(
              value: BasicConstructionPresenter(),
            ),
          ],
          child: MyApp(),
        ),
      );

      /// verify if have text `NU {customer}` (route `/`).
      expect(find.text(title), findsOneWidget);

      /// verify if have any `Container` widget.
      expect(find.byType(Container), findsWidgets);

      /// verify if have a `Image` widget.
      expect(find.byType(Image), findsOneWidget);

      /// verify if have text `Backbone`.
      expect(find.text('Backbone'), findsOneWidget);

      /// verify if have a `Floating Action Button` widget.
      expect(find.byType(FloatingActionButton), findsOneWidget);

      /// tap the `🔗` icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.link));

      /// rebuild the widget with the new value.
      await tester.pump();
    });

    testWidgets('Smoke test - ${title} [HomePage]',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
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

      /// verify if have text `NU {customer}` (route `/`).
      expect(find.text(title), findsOneWidget);

      /// verify if have any `Container` widget.
      expect(find.byType(Container), findsWidgets);

      /// verify if have a `Image` widget.
      expect(find.byType(Image), findsOneWidget);

      /// verify if have text `Backbone`.
      expect(find.text('Backbone'), findsOneWidget);

      /// verify if have a `Floating Action Button` widget.
      expect(find.byType(FloatingActionButton), findsOneWidget);

      /// tap the `🔗` icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.link));

      /// rebuild the widget with the new value.
      await tester.pump();
    });
  });
}
