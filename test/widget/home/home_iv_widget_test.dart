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
import 'package:nudemo/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nudemo/utils/globals.dart' as globals;

/// `Section IV` - Slide box container widget test
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Config config = Config();

  setUp(() {
    /// Mock Config class
    config.userUuid = "a1b2c3";
    config.accountUuid = "a1b2c3d4e5";

    /// Mock SharedPreferences
    SharedPreferences.setMockInitialValues({
      "userUuid": config.userUuid,
      "userName": config.userName,
      "userNickname": config.userNickname,
      "userEmail": config.userEmail,
      "userPhone": config.userPhone,
      "accountUuid": config.accountUuid,
      "bankBranch": config.bankBranch,
      "bankAccount": config.bankAccount,
      "accountLimit": config.accountLimit,
    });

    /// Mock Global Variables
    globals.isLoggedIn = true;
    globals.userUuid = config.userUuid;
    globals.userName = config.userName;
    globals.userNickname = config.userNickname;
    globals.userEmail = config.userEmail;
    globals.userPhone = config.userPhone;
    globals.accountUuid = config.accountUuid;
    globals.bankBranch = config.bankBranch;
    globals.bankAccount = config.bankAccount;
    globals.accountLimit = config.accountLimit;
  });

  group('[Widget -> Home page] - Section IV', () {
    final String _title = Config().userNickname;

    final Finder _homePage = find.byKey(Key('home-page'));
    final Finder _cardPage = find.byKey(Key('card-page'));
    // final Finder _nucontaPage = find.byKey(Key('nuconta-page'));
    // final Finder _rewardsPage = find.byKey(Key('rewards-page'));
    final Finder _sectionIV = find.byKey(Key('section-iv'));
    final Finder _pointDrag = find.byKey(Key('point-drag'));
    final Finder _buttonUp = find.byIcon(Icons.keyboard_arrow_up);
    final Finder _buttonDown = find.byIcon(Icons.keyboard_arrow_down);
    final Finder _verticalChartBar = find.byKey(Key('vertical-chart-bar'));

    final Finder _cardButton = find.byKey(Key('/card/'));
    final Finder _nuContaButton = find.byKey(Key('/nuconta/'));
    final Finder _rewardsButton = find.byKey(Key('/rewards/'));

    final Finder _goBackButton = find.byKey(Key('go-back-button'));

    final Widget _pumpWidget = MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePresenter>(
          create: (BuildContext context) => HomePresenter(),
        ),
        ChangeNotifierProvider<ConstructionPresenter>(
          create: (BuildContext context) => ConstructionPresenter(),
        ),
        ChangeNotifierProvider<CardPresenter>(
          create: (BuildContext context) => CardPresenter(),
        ),
        ListenableProvider<AnimatedBoxPresenter>(
          create: (BuildContext context) => AnimatedBoxPresenter(),
        ),
        ListenableProvider<FadeBoxPresenter>(
          create: (BuildContext context) => FadeBoxPresenter(),
        ),
        ListenableProvider<FadeButtonsPresenter>(
          create: (BuildContext context) => FadeButtonsPresenter(),
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
      expect(_sectionIV, findsOneWidget);

      /// Verify that there is a `Container` Widget with key `point-drag`.
      expect(_pointDrag, findsOneWidget);

      /// [Closed State 🔽] Verify that there is a `keyboard_arrow_down`
      /// icon in `IconButton` Widget, and nothing `keyboard_arrow_up`.
      expect(_buttonUp, findsNothing);
      expect(_buttonDown, findsOneWidget);

      /// [Gesture 👆] Tap the `IconButton` Widget to drag `Down 🔽`
      /// and trigger all frames.
      await tester.tap(_buttonDown);
      await tester.pumpAndSettle();

      /// Verify that there is a `Container` Widget with key `point-drag`.
      expect(_pointDrag, findsOneWidget);

      /// [Openned State 🔼] Verify that there is a `keyboard_arrow_up`
      /// icon in `IconButton` Widget, and nothing `keyboard_arrow_down`.
      expect(_buttonDown, findsNothing);
      expect(_buttonUp, findsOneWidget);

      /// [Gesture 👆] Tap the `IconButton` Widget to drag `Up 🔼`...
      await tester.tap(_buttonUp);
      await tester.pumpAndSettle();

      /// Verify that there is a `Align` Widget with key `section-iv`.
      expect(_sectionIV, findsOneWidget);

      /// Verify that there is a `Container` Widget with key `point-drag`.
      expect(_pointDrag, findsOneWidget);

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

      /// Verify that there is a `Align` Widget with key `section-iv`.
      expect(_sectionIV, findsOneWidget);

      /// Verify that there is a `Container` Widget with key `point-drag`.
      expect(_pointDrag, findsOneWidget);

      /// [Closed State 🔽] Verify that there is a `keyboard_arrow_down`
      /// icon in `IconButton` Widget, and nothing `keyboard_arrow_up`.
      expect(_buttonUp, findsNothing);
      expect(_buttonDown, findsOneWidget);

      /// [Gesture 👉↔️👉] Drag `Down` the `Align` Widget MORE (➕)
      /// than minimum height to start the animation down...
      await tester.drag(_pointDrag, Offset(0.0, minDragHeight + 10));
      await tester.pumpAndSettle();

      /// Verify that there is a `Container` Widget with key `point-drag`.
      expect(_pointDrag, findsOneWidget);

      /// [Openned State 🔼] Verify that there is a `keyboard_arrow_up`
      /// icon in `IconButton` Widget, and nothing `keyboard_arrow_down`.
      expect(_buttonDown, findsNothing);
      expect(_buttonUp, findsOneWidget);

      /// [Gesture 👉↔️👉] Drag `UP` the `Align` Widget MORE (➕)
      /// than minimum height to start the animation up...
      await tester.drag(_pointDrag, Offset(0.0, -(minDragHeight + 10)));
      await tester.pumpAndSettle();

      /// Verify that there is a `Align` Widget with key `section-iv`.
      expect(_sectionIV, findsOneWidget);

      /// Verify that there is a `Container` Widget with key `point-drag`.
      expect(_pointDrag, findsOneWidget);

      /// [Openned State 🔼]
      expect(_buttonDown, findsNothing);
      expect(_buttonUp, findsOneWidget);
    }, timeout: Timeout.factor(2));

    testWidgets('Tap `/card/` route of carousel smoke test - ${_title}',
        (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// verify if have 3 `Icon` widgets.
      expect(
        find.descendant(of: _sectionIV, matching: find.byType(Icon)),
        findsNWidgets(3),
      );

      /// verify if have a `Icon` widgets with [Icons.credit_card].
      expect(
        find.descendant(
          of: _sectionIV,
          matching: find.byIcon(Icons.credit_card),
        ),
        findsOneWidget,
      );

      /// verify if have a `Text` widgets with [Cartão de crédito].
      expect(
        find.descendant(
          of: _sectionIV,
          matching: find.text('Cartão de crédito'),
        ),
        findsOneWidget,
      );

      /// verify if have a `Text` widgets with [Fatura atual].
      expect(
        find.descendant(
          of: _sectionIV,
          matching: find.text('Fatura atual'.toUpperCase()),
        ),
        findsOneWidget,
      );

      /// verify if have a `RichText` widgets.
      expect(
        find.descendant(
          of: _sectionIV,
          matching: find.byType(RichText),
        ),
        findsWidgets,
      );

      /// verify if have a `Icon` widgets with [Icons.access_time].
      expect(
        find.descendant(
          of: _sectionIV,
          matching: find.byIcon(Icons.access_time),
        ),
        findsOneWidget,
      );

      /// verify if have a `Icon` widgets with [Icons.access_time].
      expect(
        find.descendant(
          of: _sectionIV,
          matching: find.byIcon(Icons.keyboard_arrow_right),
        ),
        findsOneWidget,
      );

      /// verify if have a vertical chart bar widget.
      expect(
        find.descendant(
          of: _sectionIV,
          matching: _verticalChartBar,
        ),
        findsOneWidget,
      );

      /// verify if have a [future] balances bar.
      expect(
        find.descendant(
          of: _verticalChartBar,
          matching: find.byKey(Key('future-bar')),
        ),
        findsOneWidget,
      );

      /// verify if have a [open] balances bar.
      expect(
        find.descendant(
          of: _verticalChartBar,
          matching: find.byKey(Key('open-bar')),
        ),
        findsOneWidget,
      );

      /// verify if have a [due] balances bar.
      expect(
        find.descendant(
          of: _verticalChartBar,
          matching: find.byKey(Key('due-bar')),
        ),
        findsOneWidget,
      );

      /// verify if have a [available] balances bar.
      expect(
        find.descendant(
          of: _verticalChartBar,
          matching: find.byKey(Key('available-bar')),
        ),
        findsOneWidget,
      );

      /// verify if have a [Button] widget with `/card/` key.
      expect(_cardButton, findsOneWidget);

      /// tap the `/card/` button and trigger a frame.
      await tester.tap(_cardButton);
      await tester.pumpAndSettle();

      /// verify if have a [Positioned] widget with `card-page` key.
      expect(_cardPage, findsOneWidget);

      /// verify if have any [IconButton] widget to go back.
      expect(_goBackButton, findsWidgets);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await tester.tap(_goBackButton);
      await tester.pumpAndSettle();
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
