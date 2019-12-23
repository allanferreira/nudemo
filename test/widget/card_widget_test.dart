import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/card/views/card_view.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';

void main() {
  group('[Widget -> Card page]', () {
    String title = 'Cartão de crédito scrollview';

    final Finder _cardPage = find.byKey(Key('card-page'));
    final Finder _goBackButton = find.byKey(Key('go-back-button'));
    final Finder _filterButton = find.byKey(Key('filter-button'));
    final Finder _sliverAppBar = find.byType(SliverAppBar);
    final Finder _sliverList = find.byType(SliverList);
    final Finder _verticalChartBar = find.byKey(Key('vertical-chart-bar'));

    final Widget _pumpWidget = MultiProvider(
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
    );

    testWidgets('Smoke test - ${title}', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpWidget);

      /// verify if have any `Stack` widget.
      expect(find.byType(Stack), findsWidgets);

      /// verify if have a `Stack` widget with `card-page` key.
      expect(_cardPage, findsOneWidget);

      /// verify if have any `Icon` widget.
      expect(find.byType(Icon), findsWidgets);

      /// verify if have any `IconButton` widget.
      expect(find.byType(IconButton), findsWidgets);

      /// verify if have a `RefreshIndicator` widget.
      expect(find.byType(RefreshIndicator), findsOneWidget);

      /// verify if have a `CustomScrollView` widget.
      expect(find.byType(CustomScrollView), findsOneWidget);

      /// verify if have a `SliverAppBar` widget.
      expect(_sliverAppBar, findsOneWidget);

      /// verify if have a `SliverList` widget.
      expect(find.byType(SliverList), findsOneWidget);
    });

    testWidgets('Vertical chart bar smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a vertical chart bar widget.
      expect(
        find.descendant(
          of: _cardPage,
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
    });

    testWidgets('RefreshIndicator smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpWidget);

      /// [Gesture 👆↕️👆] Drag `Down` the `CustomScrollView` Widget
      await tester.drag(
        find.byKey(Key('item-0')),
        Offset(0.0, 1000),
      );
      await tester.pumpAndSettle();
    });

    testWidgets('SliverAppBar smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpWidget);

      /// verify if have a `Icon` widget with `lock` icon.
      expect(
        find.descendant(
          of: _sliverAppBar,
          matching: find.byIcon(Icons.lock),
        ),
        findsOneWidget,
      );

      /// verify if have a `Text` widget with
      /// `Cartão virtual bloqueado` text.
      expect(
        find.descendant(
          of: _sliverAppBar,
          matching: find.text('Cartão virtual bloqueado'),
        ),
        findsOneWidget,
      );

      /// verify if have a `FlatButton` widget.
      expect(
        find.descendant(
          of: _sliverAppBar,
          matching: find.byType(FlatButton),
        ),
        findsOneWidget,
      );

      /// verify if have a `FlatButton` widget with
      /// `Desbloquear` text.
      expect(
        find.descendant(
          of: find.byType(FlatButton),
          matching: find.text('Desbloquear'.toUpperCase()),
        ),
        findsOneWidget,
      );

      /// verify if have a SliderBox dotted indicator container.
      expect(
        find.descendant(
          of: _sliverAppBar,
          matching: find.byKey(Key('slider-dotted')),
        ),
        findsOneWidget,
      );

      /// verify if have any dotted item.
      [1, 2, 3, 4, 5].map((index) {
        expect(
          find.descendant(
            of: _sliverAppBar,
            matching: find.byKey(Key('dotted-$index')),
          ),
          findsOneWidget,
        );
      });

      /// tap the `🔍` search icon and trigger a frame.
      await tester.tap(_filterButton);

      /// rebuild the widget with the new value.
      await tester.pump();

      /// Verify that our snackBar text is `Filtering not supported yet!`.
      expect(find.text('Filtering not supported yet!'), findsOneWidget);

      /// verify if have any `IconButton` widget to go back.
      expect(_goBackButton, findsWidgets);

      /// verify if have a `Icon` widget with `keyboard_arrow_left` icon.
      expect(
        find.descendant(
          of: _goBackButton,
          matching: find.byIcon(Icons.keyboard_arrow_left),
        ),
        findsOneWidget,
      );

      /// verify if have a `Icon` widget with `credit_card` icon.
      expect(
        find.descendant(
          of: _goBackButton,
          matching: find.byIcon(Icons.credit_card),
        ),
        findsOneWidget,
      );

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await tester.tap(_goBackButton);

      /// rebuild the widget with the new value.
      await tester.pump();
    });

    testWidgets('SliverList smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_pumpWidget);

      /// verify if have any list item [Key].
      [1, 2, 3, 4, 5, 6].map((index) {
        expect(
          find.descendant(
            of: _sliverList,
            matching: find.byKey(Key('item-$index')),
          ),
          findsOneWidget,
        );
      });

      /// verify if have any list item [Text].
      [1, 2, 3, 4, 5, 6].map((index) {
        expect(
          find.descendant(
            of: _sliverList,
            matching: find.text('Item $index'),
          ),
          findsOneWidget,
        );
      });

      /// [Gesture 👇↕️👇] Drag `Up` the `CustomScrollView` Widget
      await tester.drag(
        find.byKey(Key('item-1')),
        Offset(0.0, -300),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(Key('item-6')), findsOneWidget);
    });
  });
}
