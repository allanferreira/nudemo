import 'package:flutter/animation.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/viewmodel/fade_buttons_viewmodel.dart';

void main() {
  group('[Unit -> FadeButtonsViewModel]', () {
    FadeButtonsViewModel fadeButtonsViewModel;

    setUp(() {
      fadeButtonsViewModel = FadeButtonsViewModel();
    });

    test('initial `AnimationController` value should be null', () {
      expect(fadeButtonsViewModel.controller, null);
    });

    test('initial `curvedAnimation` value should be null', () {
      expect(fadeButtonsViewModel.curvedAnimation, null);
    });

    test('`initialOpacity` value should be 1.0', () {
      expect(FadeButtonsViewModel.initialOpacity, 1.0);
    });

    test('`duration` value should be 400ms', () {
      expect(
        FadeButtonsViewModel.duration,
        const Duration(milliseconds: 400),
      );
    });

    test('`durationReverse` value should be 400ms', () {
      expect(
        FadeButtonsViewModel.durationReverse,
        const Duration(milliseconds: 400),
      );
    });

    test('`curveForward` value should be [Curves.linear]', () {
      expect(
        FadeButtonsViewModel.curveForward,
        Curves.linear,
      );
    });

    test('`curveReverse` value should be [Curves.linear]', () {
      expect(
        FadeButtonsViewModel.curveReverse,
        Curves.linear,
      );
    });
  });
}
