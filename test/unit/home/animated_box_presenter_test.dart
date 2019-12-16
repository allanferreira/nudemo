import 'package:flutter/widgets.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/presenter/animated_box_presenter.dart';

void main() {
  group('[Unit -> AnimatedBoxPresenter]', () {
    AnimatedBoxPresenter basicAnimatedBoxPresenter;

    setUp(() {
      basicAnimatedBoxPresenter = AnimatedBoxPresenter();
    });

    test('`getIsLowered()` initial value should be false', () {
      expect(basicAnimatedBoxPresenter.getIsLowered(), false);
    });

    test('`getDragAlignment()` initial value should be (0.0, -0.18)', () {
      expect(
        basicAnimatedBoxPresenter.getDragAlignment(),
        Alignment(0.0, -0.18),
      );
    });
  });
}
