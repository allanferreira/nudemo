import 'package:flutter/animation.dart';
import 'package:test/test.dart';
import 'package:matcher/src/type_matcher.dart' as matcher;

import 'package:nudemo/home/presenter/fade_box_presenter.dart';

void main() {
  group('[Unit -> FadeBoxPresenter]', () {
    FadeBoxPresenter fadeBoxPresenter;

    setUp(() {
      fadeBoxPresenter = FadeBoxPresenter();
    });

    test('`getCurvedAnimation()` TypeMatcher should be [CurvedAnimation]', () {
      expect(
        fadeBoxPresenter.getCurvedAnimation(),
        const matcher.TypeMatcher<CurvedAnimation>(),
      );
    });
  });
}
