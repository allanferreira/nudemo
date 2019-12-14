import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Widget -> Home page] - Section I', () {
    String _title = 'Chinnon';

    final Widget _pumpWidget = MultiProvider(
      providers: [
        ChangeNotifierProvider<BasicConstructionPresenter>(
          create: (context) => BasicConstructionPresenter(),
        ),
        ListenableProvider<AnimatedBoxPresenter>(
          create: (context) => AnimatedBoxPresenter(),
        ),
        ListenableProvider<FadeBoxPresenter>(
          create: (context) => FadeBoxPresenter(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(
          presenter: HomePresenter(),
          title: _title,
        ),
      ),
    );

    testWidgets('Smoke test - ${_title}', (WidgetTester tester) async {
      await tester.pumpWidget(_pumpWidget);

      /// `Section I` - Logo container

      /// verify if have a `Image` widget with `logo` key.
      expect(find.byKey(Key('logo-main')), findsOneWidget);

      /// verify if have a `Icon` widget with `icon-drag` key.
      expect(find.byKey(Key('icon-drag')), findsOneWidget);

      /// verify if have a `Icon` widget with `keyboard_arrow_down` icon.
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });
  });
}
