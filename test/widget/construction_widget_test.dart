import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/construction/views/construction_view.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Widget -> Construction page]', () {
    String title = 'Cartão de crédito';
    testWidgets('Smoke test - ${title}', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<BasicConstructionPresenter>.value(
              value: BasicConstructionPresenter(),
            ),
          ],
          child: MaterialApp(
            home: ConstructionPage(
              BasicConstructionPresenter(),
              title: title,
            ),
          ),
        ),
      );

      /// verify if have text `Cartão de crédito` (route `/credit-card/`).
      expect(find.text(title), findsOneWidget);

      /// verify if have any `Container` widget.
      expect(find.byType(Container), findsWidgets);

      /// verify if have a `Image` widget.
      expect(find.byType(Image), findsOneWidget);

      /// Verify that our default text is `This page has NOT been implemented yet!!!`.
      expect(find.byKey(Key('attencion')), findsOneWidget);

      /// Verify that our default text is `You have pushed the button this many times:`.
      expect(find.text('You have pushed the button this many times:'),
          findsOneWidget);

      /// Verify that our counter starts at `0`.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      /// verify if have a `Floating Action Button` widget.
      expect(find.byType(FloatingActionButton), findsOneWidget);

      /// Tap the `➕` icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));

      /// Rebuild the widget with the new value.
      await tester.pump();

      /// Verify that our `counter` has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
