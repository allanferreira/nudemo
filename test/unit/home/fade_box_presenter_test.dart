import 'package:flutter/animation.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/presenter/fade_box_presenter.dart';

void main() {
  group('[Unit -> FadeBoxPresenter]', () {
    FadeBoxPresenter basicFadeBoxPresenter;

    setUp(() {
      basicFadeBoxPresenter = FadeBoxPresenter();
    });

    test('`getCurvedAnimation()` run time type should be [CurvedAnimation]',
        () {
      expect(
        basicFadeBoxPresenter.getCurvedAnimation().runtimeType,
        CurvedAnimation,
      );
    });
  });
}
