import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';

void main() {
  group('[Widget -> Home page]', () {
    String _title = 'Chinnon';

    testWidgets('Smoke test - ${_title} [HomePage] - Section I',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(HomePresenter(), title: _title),
        ),
      );

      /// `Section I` - Logo container

      /// verify if have a `Image` widget with `logo` key.
      expect(find.byKey(Key('logo')), findsOneWidget);

      /// verify if have a `Icon` widget with `icon-drag` key.
      expect(find.byKey(Key('icon-drag')), findsOneWidget);

      /// verify if have a `Icon` widget with `keyboard_arrow_down` icon.
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });
  });
}
