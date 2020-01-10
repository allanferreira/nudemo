import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nudemo/nuconta/views/nuconta_view.dart';
import 'package:nudemo/nuconta/presenter/nuconta_presenter.dart';
import 'package:nudemo/nuconta/viewmodel/nuconta_viewmodel.dart';

void main() {
  // Mocking ViewModel
  NucontaViewModel nucontaViewModelMock = NucontaViewModel();

  group('[Widget -> Nuconta page]', () {
    final String title = 'NuConta';

    final Finder _nucontaPage = find.byKey(Key('nuconta-page'));

    Widget _pumpApp(NucontaViewModel nucontaViewModelMock) => MaterialApp(
          home: NucontaPage(
            // presenter: NucontaPresenter(nucontaViewModelMock),
            presenter: NucontaPresenter(),
            title: title,
          ),
        );

    testWidgets('General smoke test - Without mock - ${title}',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpApp(NucontaViewModel()));

      /// verify if have a `Stack` widget with `nuconta-page` key.
      expect(_nucontaPage, findsOneWidget);
    });

    testWidgets('General smoke test - ${title}', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpApp(nucontaViewModelMock));

      /// verify if have a `Stack` widget with `nuconta-page` key.
      expect(_nucontaPage, findsOneWidget);

      /// verify if have text `NuConta` (route `/card/`).
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
