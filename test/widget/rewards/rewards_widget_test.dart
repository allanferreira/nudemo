import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nudemo/rewards/views/rewards_view.dart';
import 'package:nudemo/rewards/presenter/rewards_presenter.dart';

void main() {
  group('[Widget -> Rewards page]', () {
    String title = 'Rewards';
    testWidgets('Smoke test - ${title}', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: RewardsPage(
            presenter: RewardsPresenter(),
            title: title,
          ),
        ),
      );

      /// verify if have text `Rewards` (route `/card/`).
      expect(find.text(title.toUpperCase()), findsOneWidget);

      /// verify if have any `IconButton` widget to go back.
      expect(find.byKey(Key('go-back-button')), findsWidgets);

      /// verify if have any `IconButton` widget to filtering.
      expect(find.byKey(Key('filter-button')), findsWidgets);

      /// verify if have a `Image` widget.
      expect(find.byType(Image), findsOneWidget);

      /// Verify that our default text is `This page has NOT been implemented yet!!!`.
      expect(find.text('This page has NOT been implemented yet!!!'),
          findsOneWidget);

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