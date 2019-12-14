import 'package:flutter/animation.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/viewmodel/fade_box_viewmodel.dart';

void main() {
  group('[Unit -> FadeBoxViewModel]', () {
    FadeBoxViewModel fadeBoxViewModel;

    setUp(() {
      fadeBoxViewModel = FadeBoxViewModel();
    });

    test('initial `AnimationController` value should be null', () {
      expect(fadeBoxViewModel.controller, null);
    });

    test('initial `curvedAnimation` value should be null', () {
      expect(fadeBoxViewModel.curvedAnimation, null);
    });

    test('`initialOpacity` value should be 0.0', () {
      expect(FadeBoxViewModel.initialOpacity, 0.0);
    });

    test('`duration` value should be 800ms', () {
      expect(
        FadeBoxViewModel.duration,
        const Duration(milliseconds: 800),
      );
    });

    test('`durationReverse` value should be 400ms', () {
      expect(
        FadeBoxViewModel.durationReverse,
        const Duration(milliseconds: 400),
      );
    });

    test('`curveForward` value should be [Curves.easeOutQuad]', () {
      expect(
        FadeBoxViewModel.curveForward,
        Curves.easeOutQuad,
      );
    });

    test('`curveReverse` value should be [Curves.linear]', () {
      expect(
        FadeBoxViewModel.curveReverse,
        Curves.linear,
      );
    });
  });
}
