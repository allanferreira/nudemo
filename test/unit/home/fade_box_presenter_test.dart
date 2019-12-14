import 'package:flutter/animation.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/presenter/basic_fade_box_presenter.dart';

void main() {
  group('[Unit -> BasicFadeBoxPresenter]', () {
    BasicFadeBoxPresenter basicFadeBoxPresenter;

    setUp(() {
      basicFadeBoxPresenter = BasicFadeBoxPresenter();
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
