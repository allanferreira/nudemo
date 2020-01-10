import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nudemo/signup/views/signup_view.dart';
import 'package:nudemo/signup/presenter/signup_presenter.dart';
import 'package:nudemo/signup/viewmodel/signup_viewmodel.dart';

void main() {
  // Mocking ViewModel
  SignupViewModel signupViewModelMock = SignupViewModel();

  group('[Widget -> Sign Up page]', () {
    final String title = 'Sign Up';

    final Finder _signupPage = find.byKey(Key('signup-page'));

    Widget _pumpApp(SignupViewModel signupViewModelMock) => MaterialApp(
          home: SignupPage(
            // presenter: SignupPresenter(signupViewModelMock),
            presenter: SignupPresenter(),
            title: title,
          ),
        );

    testWidgets('General smoke test - Without mock - ${title}',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpApp(SignupViewModel()));

      /// verify if have a `Stack` widget with `signup-page` key.
      expect(_signupPage, findsOneWidget);
    });

    testWidgets('General smoke test - ${title}', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpApp(signupViewModelMock));

      /// verify if have a `Stack` widget with `signup-page` key.
      expect(_signupPage, findsOneWidget);

      /// verify if have text `Sign Up`.
      expect(find.text(title.toUpperCase()), findsOneWidget);

      /// verify if have any `IconButton` widget to go back.
      expect(find.byKey(Key('go-back-button')), findsWidgets);

      /// verify if have a `Image` widget.
      expect(find.byType(Image), findsOneWidget);

      /// verify if have a `RichText` widget with `text-1` key.
      expect(find.byKey(Key('text-1')), findsOneWidget);

      /// verify if have a `RichText` widget with `text-2` key.
      expect(find.byKey(Key('text-2')), findsOneWidget);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await tester.tap(find.byKey(Key('go-back-button')));

      /// rebuild the widget with the new value.
      await tester.pump();
    });
  });
}
