import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/main.dart';
import 'package:nudemo/home/presenter/counter_presenter.dart';

void main() {
  group('Home page', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ChangeNotifierProvider<BasicCounterPresenter>.value(
          value: BasicCounterPresenter(),
          child: MyApp(),
        ),
      );

      /// Verify that our counter starts at `0`.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      /// verify if have a `Floating Action Button` widget.
      expect(find.byType(FloatingActionButton), findsOneWidget);

      /// Tap the  `+` icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      /// Rebuild the widget with the new value.
      await tester.pump();

      /// Verify that our `counter` has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Default text test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ChangeNotifierProvider<BasicCounterPresenter>.value(
          value: BasicCounterPresenter(),
          child: MyApp(),
        ),
      );

      /// Verify that our default text is `You have pushed the button this many times:`.
      expect(find.text('You have pushed the button this many times:'),
          findsOneWidget);
    });

    testWidgets('Container and Image test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ChangeNotifierProvider<BasicCounterPresenter>.value(
          value: BasicCounterPresenter(),
          child: MyApp(),
        ),
      );

      /// verify if have any `Container` widget.
      expect(find.byType(Container), findsWidgets);

      /// verify if have a `Image` widget.
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
