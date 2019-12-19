import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/card/views/card_view.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';

void main() {
  group('[Widget -> Card page]', () {
    String title = 'Cartão de crédito';
    testWidgets('Smoke test - ${title}', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<CardPresenter>.value(
              value: CardPresenter(),
            ),
          ],
          child: MaterialApp(
            home: CardPage(
              presenter: CardPresenter(),
              title: title,
            ),
          ),
        ),
      );

      /// verify if have text `Cartão de crédito` (route `/card/`).
      expect(find.text(title.toUpperCase()), findsOneWidget);

      /// verify if have any `IconButton` widget to go back.
      expect(find.byKey(Key('go-back-button')), findsWidgets);

      /// verify if have any `IconButton` widget to filtering.
      expect(find.byKey(Key('filter-button')), findsWidgets);

      /// verify if have a `Image` widget.
      expect(find.byType(Image), findsOneWidget);

      /// tap the `🔍` search icon and trigger a frame.
      await tester.tap(find.byKey(Key('filter-button')));

      /// rebuild the widget with the new value.
      await tester.pump();

      /// Verify that our snackBar text is `Filtering not supported yet!`.
      expect(find.text('Filtering not supported yet!'), findsOneWidget);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await tester.tap(find.byKey(Key('go-back-button')));

      /// rebuild the widget with the new value.
      await tester.pump();
    });
  });
}
