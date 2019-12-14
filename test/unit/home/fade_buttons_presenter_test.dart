import 'package:flutter/animation.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';

void main() {
  group('[Unit -> FadeButtonsPresenter]', () {
    FadeButtonsPresenter fadeButtonsPresenter;

    setUp(() {
      fadeButtonsPresenter = FadeButtonsPresenter();
    });

    test('`getCurvedAnimation()` run time type should be [CurvedAnimation]',
        () {
      expect(
        fadeButtonsPresenter.getCurvedAnimation().runtimeType,
        CurvedAnimation,
      );
    });
  });
}
