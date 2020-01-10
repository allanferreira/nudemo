import 'package:flutter/animation.dart';
import 'package:test/test.dart';
import 'package:matcher/src/type_matcher.dart' as matcher;

import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';

void main() {
  group('[Unit -> FadeButtonsPresenter]', () {
    FadeButtonsPresenter fadeButtonsPresenter;

    setUp(() {
      fadeButtonsPresenter = FadeButtonsPresenter();
    });

    test('`getCurvedAnimation()` TypeMatcher should be [CurvedAnimation]', () {
      expect(
        fadeButtonsPresenter.getCurvedAnimation(),
        const matcher.TypeMatcher<CurvedAnimation>(),
      );
    });
  });
}
