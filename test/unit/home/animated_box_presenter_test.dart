import 'package:flutter/widgets.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/presenter/basic_animated_box_presenter.dart';

void main() {
  group('[Unit -> BasicAnimatedBoxPresenter]', () {
    BasicAnimatedBoxPresenter basicAnimatedBoxPresenter;

    setUp(() {
      basicAnimatedBoxPresenter = BasicAnimatedBoxPresenter();
    });

    test('`getIsLowered()` initial value should be false', () {
      expect(basicAnimatedBoxPresenter.getIsLowered(), false);
    });

    test('`getDragAlignment()` initial value should be (0.0, -0.08)', () {
      expect(
        basicAnimatedBoxPresenter.getDragAlignment(),
        Alignment(0.0, -0.08),
      );
    });
  });
}
