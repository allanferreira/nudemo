import 'package:flutter/animation.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/viewmodel/fade_box_viewmodel.dart';

void main() {
  group('[Unit -> FadeBoxViewModel]', () {
    FadeBoxViewModel homeViewModel;

    setUp(() {
      homeViewModel = FadeBoxViewModel();
    });

    test('initial `AnimationController` value should be null', () {
      expect(homeViewModel.controller, null);
    });

    test('initial `curvedAnimation` value should be null', () {
      expect(homeViewModel.curvedAnimation, null);
    });

    test('initial `transitionOpacity` value should be null', () {
      expect(homeViewModel.transitionOpacity, null);
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

    test('`durationFast` value should be 100ms', () {
      expect(
        FadeBoxViewModel.durationFast,
        const Duration(milliseconds: 100),
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