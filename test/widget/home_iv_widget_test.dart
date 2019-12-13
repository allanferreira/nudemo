import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/basic_animated_box_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

/// `Section IV` - Slide box container widget test
void main() {
  group('[Widget -> Home page] - Section IV', () {
    final String _title = 'Chinnon';

    final Finder _homePage = find.byKey(Key('home-page'));
    final Finder _animatedBox = find.byKey(Key('section-iv'));
    final Finder _buttonUp = find.byIcon(Icons.keyboard_arrow_up);
    final Finder _buttonDown = find.byIcon(Icons.keyboard_arrow_down);

    final Finder _cardButton = find.byKey(Key('/card/'));
    final Finder _nuContaButton = find.byKey(Key('/nuconta/'));
    final Finder _rewardsButton = find.byKey(Key('/rewards/'));

    final Finder _goBackButton = find.byKey(Key('go-back-button'));

    testWidgets('Tap gesture animation smoke test',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
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

      /// Verify that there is a `Container` Widget.
      expect(_animatedBox, findsOneWidget);

      /// [Openned State 🔼] Verify that there is a `keyboard_arrow_up`
      /// icon in `IconButton` Widget, and nothing `keyboard_arrow_down`.
      expect(_buttonDown, findsNothing);
      expect(_buttonUp, findsOneWidget);

      /// [Gesture 👆] Tap the `IconButton` Widget to drag `Up 🔼`...
      await tester.tap(_buttonUp);
      await tester.pumpAndSettle();

      /// Verify that there is a `Container` Widget.
      expect(_animatedBox, findsOneWidget);

      /// [Closed State 🔽]
      expect(_buttonUp, findsNothing);
      expect(_buttonDown, findsOneWidget);
    });

    testWidgets('Drag gesture animation smoke test',
        (WidgetTester tester) async {
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

      final BuildContext childContext = tester.element(_homePage);
      final size = MediaQuery.of(childContext).size;
      final double minDragHeight = ((size.height - 100) / 2);

      // print('size: $size');
      // print('minDragHeight: $minDragHeight');

      /// Verify that there is a `Container` Widget.
      expect(_animatedBox, findsOneWidget);

      /// [Closed State 🔽] Verify that there is a `keyboard_arrow_down`
      /// icon in `IconButton` Widget, and nothing `keyboard_arrow_up`.
      expect(_buttonUp, findsNothing);
      expect(_buttonDown, findsOneWidget);

      /// [Gesture 👉↔️👉] Drag `Down` the `Container` Widget MORE (➕)
      /// than minimum height to start the animation down...
      await tester.drag(_animatedBox, Offset(0.0, minDragHeight + 10));
      await tester.pumpAndSettle();

      /// Verify that there is a `Container` Widget.
      expect(_animatedBox, findsOneWidget);

      /// [Openned State 🔼] Verify that there is a `keyboard_arrow_up`
      /// icon in `IconButton` Widget, and nothing `keyboard_arrow_down`.
      expect(_buttonDown, findsNothing);
      expect(_buttonUp, findsOneWidget);

      /// [Gesture 👉↔️👉] Drag `UP` the `Container` Widget MORE (➕)
      /// than minimum height to start the animation up...
      await tester.drag(_animatedBox, Offset(0.0, -(minDragHeight + 10)));
      await tester.pumpAndSettle();

      /// Verify that there is a `Container` Widget.
      expect(_animatedBox, findsOneWidget);

      /// [Openned State 🔼]
      expect(_buttonDown, findsNothing);
      expect(_buttonUp, findsOneWidget);
    }, timeout: Timeout.factor(2));

    testWidgets('Tap route of carousel smoke test - ${_title}',
        (WidgetTester tester) async {
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

      /// verify if have a Button widget with `/card/` key.
      expect(_cardButton, findsOneWidget);

      /// tap the `/card/` button and trigger a frame.
      await tester.tap(_cardButton);
      await tester.pumpAndSettle();

      /// verify if have any `IconButton` widget to go back.
      expect(_goBackButton, findsWidgets);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await tester.tap(_goBackButton);
      await tester.pumpAndSettle();

      /// verify if have a Button widget with `/nuconta/` key.
      expect(_nuContaButton, findsOneWidget);

      /// tap the `/nuconta/` button and trigger a frame.
      await tester.tap(_nuContaButton);
      await tester.pumpAndSettle();

      /// verify if have any `IconButton` widget to go back.
      expect(_goBackButton, findsWidgets);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await tester.tap(_goBackButton);
      await tester.pumpAndSettle();

      /// verify if have a Button widget with `/rewards/` key.
      expect(_rewardsButton, findsOneWidget);

      /// tap the `/rewards/` button and trigger a frame.
      await tester.tap(_rewardsButton);
      await tester.pumpAndSettle();

      /// verify if have any `IconButton` widget to go back.
      expect(_goBackButton, findsWidgets);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await tester.tap(_goBackButton);
      await tester.pumpAndSettle();
    });
  });
}
