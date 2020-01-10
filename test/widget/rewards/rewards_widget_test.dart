import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nudemo/rewards/views/rewards_view.dart';
import 'package:nudemo/rewards/presenter/rewards_presenter.dart';
import 'package:nudemo/rewards/viewmodel/rewards_viewmodel.dart';

void main() {
  // Mocking ViewModel
  RewardsViewModel rewardsViewModelMock = RewardsViewModel();

  group('[Widget -> Rewards page]', () {
    final String title = 'Rewards';

    final Finder _rewardsPage = find.byKey(Key('rewards-page'));

    Widget _pumpApp(RewardsViewModel rewardsViewModelMock) => MaterialApp(
          home: RewardsPage(
            // presenter: RewardsPresenter(rewardsViewModelMock),
            presenter: RewardsPresenter(),
            title: title,
          ),
        );

    testWidgets('General smoke test - Without mock - ${title}',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpApp(RewardsViewModel()));

      /// verify if have a `Stack` widget with `rewards-page` key.
      expect(_rewardsPage, findsOneWidget);
    });

    testWidgets('General smoke test - ${title}', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpApp(rewardsViewModelMock));

      /// verify if have a `Stack` widget with `rewards-page` key.
      expect(_rewardsPage, findsOneWidget);

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
