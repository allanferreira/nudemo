import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Widget -> Home page]', () {
    String _title = 'Chinnon';

    Finder _cardButton = find.byKey(Key('/card/'));
    Finder _nuContaButton = find.byKey(Key('/nuconta/'));
    Finder _rewardsButton = find.byKey(Key('/rewards/'));

    testWidgets('Smoke test - ${_title} [HomePage] - Section IV',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<BasicConstructionPresenter>.value(
              value: BasicConstructionPresenter(),
            ),
          ],
          child: MaterialApp(
            home: HomePage(
              HomePresenter(),
              title: _title,
            ),
          ),
        ),
      );

      /// `Section IV` - Slide box container

      /// verify if have a Button widget with `/card/` key.
      expect(_cardButton, findsOneWidget);

      /// tap the `/card/` button and trigger a frame.
      await tester.tap(_cardButton);

      /// rebuild the widget with the new value.
      await tester.pump();

      /// verify if have a Button widget with `/nuconta/` key.
      expect(_nuContaButton, findsOneWidget);

      /// tap the `/nuconta/` button and trigger a frame.
      await tester.tap(_nuContaButton);

      /// rebuild the widget with the new value.
      await tester.pump();

      /// verify if have a Button widget with `/rewards/` key.
      expect(_rewardsButton, findsOneWidget);

      /// tap the `/rewards/` button and trigger a frame.
      await tester.tap(_rewardsButton);

      /// rebuild the widget with the new value.
      await tester.pump();
    });
  });
}
