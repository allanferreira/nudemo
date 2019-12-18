import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';

/// `Section IV` - Slide box container widget test
void main() {
  group('[Widget -> Home page] - Section IV', () {
    final String _title = 'Chinnon';

    final Finder _homePage = find.byKey(Key('home-page'));
    // final Finder _cardPage = find.byKey(Key('card-page'));
    // final Finder _nucontaPage = find.byKey(Key('nuconta-page'));
    // final Finder _rewardsPage = find.byKey(Key('rewards-page'));
    final Finder _animatedBox = find.byKey(Key('section-iv'));
    final Finder _buttonUp = find.byIcon(Icons.keyboard_arrow_up);
    final Finder _buttonDown = find.byIcon(Icons.keyboard_arrow_down);

    final Finder _cardButton = find.byKey(Key('/card/'));
    final Finder _nuContaButton = find.byKey(Key('/nuconta/'));
    final Finder _rewardsButton = find.byKey(Key('/rewards/'));

    // final Finder _goBackButton = find.byKey(Key('go-back-button'));

    final Widget _pumpWidget = MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePresenter>(
          create: (context) => HomePresenter(),
        ),
        ChangeNotifierProvider<ConstructionPresenter>(
          create: (context) => ConstructionPresenter(),
        ),
        ChangeNotifierProvider<CardPresenter>(
          create: (context) => CardPresenter(),
        ),
        ListenableProvider<AnimatedBoxPresenter>(
          create: (context) => AnimatedBoxPresenter(),
        ),
        ListenableProvider<FadeBoxPresenter>(
          create: (context) => FadeBoxPresenter(),
        ),
        ListenableProvider<FadeButtonsPresenter>(
          create: (context) => FadeButtonsPresenter(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(
          presenter: HomePresenter(),
          title: _title,
        ),
      ),
    );

    testWidgets('Tap gesture animation smoke test',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpWidget);

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
    }, timeout: Timeout.factor(2));

    testWidgets('Drag gesture animation smoke test',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

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

    testWidgets('Tap `/card/` route of carousel smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have 3 `Icon` widgets.
      expect(
        find.descendant(of: _animatedBox, matching: find.byType(Icon)),
        findsNWidgets(3),
      );

      /// verify if have a `Icon` widgets with [Icons.credit_card].
      expect(
        find.descendant(
          of: _animatedBox,
          matching: find.byIcon(Icons.credit_card),
        ),
        findsOneWidget,
      );

      /// verify if have a `Text` widgets with [Cartão de crédito].
      expect(
        find.descendant(
          of: _animatedBox,
          matching: find.text('Cartão de crédito'),
        ),
        findsOneWidget,
      );

      /// verify if have a `Text` widgets with [Fatura atual].
      expect(
        find.descendant(
          of: _animatedBox,
          matching: find.text('Fatura atual'.toUpperCase()),
        ),
        findsOneWidget,
      );

      /// verify if have a `RichText` widgets.
      expect(
        find.descendant(
          of: _animatedBox,
          matching: find.byType(RichText),
        ),
        findsWidgets,
      );

      /// verify if have a `Icon` widgets with [Icons.access_time].
      expect(
        find.descendant(
          of: _animatedBox,
          matching: find.byIcon(Icons.access_time),
        ),
        findsOneWidget,
      );

      /// verify if have a `Icon` widgets with [Icons.access_time].
      expect(
        find.descendant(
          of: _animatedBox,
          matching: find.byIcon(Icons.keyboard_arrow_right),
        ),
        findsOneWidget,
      );

      /// verify if have a [Button] widget with `/card/` key.
      expect(_cardButton, findsOneWidget);

      /// tap the `/card/` button and trigger a frame.
      await tester.tap(_cardButton);
      await tester.pumpAndSettle();

      /// [The tests below don't work ANY MORE], because the target of
      /// this widget has the same source widget context, but it isn't
      /// directly in the parent tree widget.
      ///
      /// -- We separate the list of carousel widgets, after that,
      /// the tests don't work any more, but I need to separate these
      /// widgets for a better code. --
      ///
      /// Don't care about it, we still have the integration test
      /// (drive test) for test this!

      // /// verify if have a [Positioned] widget with `card-page` key.
      // expect(_cardPage, findsOneWidget);

      // /// verify if have any [IconButton] widget to go back.
      // expect(_goBackButton, findsWidgets);

      // /// tap the `⬅️` arrow_back icon and trigger a frame.
      // await tester.tap(_goBackButton);
      // await tester.pumpAndSettle();
    });

    testWidgets('Tap `/nuconta/` route of carousel smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a [Button] widget with `/nuconta/` key.
      expect(_nuContaButton, findsOneWidget);

      /// tap the `/nuconta/` button and trigger a frame.
      await tester.tap(_nuContaButton);
      await tester.pumpAndSettle();
    }, skip: true);

    testWidgets('Tap `/rewards/` route of carousel smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a [Button] widget with `/rewards/` key.
      expect(_rewardsButton, findsOneWidget);

      /// tap the `/rewards/` button and trigger a frame.
      await tester.tap(_rewardsButton);
      await tester.pumpAndSettle();
    }, skip: true);
  });
}
