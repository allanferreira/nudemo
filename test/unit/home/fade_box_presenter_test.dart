import 'package:flutter/animation.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/presenter/fade_box_presenter.dart';

void main() {
  group('[Unit -> FadeBoxPresenter]', () {
    FadeBoxPresenter fadeBoxPresenter;

    setUp(() {
      fadeBoxPresenter = FadeBoxPresenter();
    });

    test('`getCurvedAnimation()` run time type should be [CurvedAnimation]',
        () {
      expect(
        fadeBoxPresenter.getCurvedAnimation().runtimeType,
        CurvedAnimation,
      );
    });
  });
}
