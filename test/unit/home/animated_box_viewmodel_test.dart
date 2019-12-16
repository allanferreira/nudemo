import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/viewmodel/animated_box_viewmodel.dart';

void main() {
  group('[Unit -> AnimatedBoxViewModel]', () {
    AnimatedBoxViewModel animatedBoxViewModel;

    setUp(() {
      animatedBoxViewModel = AnimatedBoxViewModel();
    });

    test('initial `AnimationController` value should be null', () {
      expect(animatedBoxViewModel.controller, null);
    });

    test('initial `Animation<Alignment>` value should be null', () {
      expect(animatedBoxViewModel.animation, null);
    });

    test('`beginDragAlignment` value should be (0.0, -0.18)', () {
      expect(
        AnimatedBoxViewModel.beginDragAlignment,
        Alignment(0.0, -0.18),
      );
    });

    test('`endDragAlignment` value should be (0.0, 2.9)', () {
      expect(
        AnimatedBoxViewModel.endDragAlignment,
        Alignment(0.0, 2.9),
      );
    });

    test('initial `targetAlignment` value should be iqual [beginDragAlignment]',
        () {
      expect(
        animatedBoxViewModel.targetAlignment,
        AnimatedBoxViewModel.beginDragAlignment,
      );
    });

    test('initial `dragAlignment` value should be iqual [beginDragAlignment]',
        () {
      expect(
        animatedBoxViewModel.dragAlignment,
        AnimatedBoxViewModel.beginDragAlignment,
      );
    });

    test('`minDragDistance` value should be [15%] of (end - begin)', () {
      expect(
        AnimatedBoxViewModel.minDragDistance,
        ((AnimatedBoxViewModel.endDragAlignment.y -
                AnimatedBoxViewModel.beginDragAlignment.y) *
            0.15),
      );
    });

    test('initial `draggingDirectionY` value should be 0.0', () {
      expect(animatedBoxViewModel.draggingDirectionY, 0.0);
    });

    test('initial `isLowered` value should be false', () {
      expect(animatedBoxViewModel.isLowered, false);
    });

    test('`spring` value should be {mass: 10, stiffness: 500, damping: 0.7,}',
        () {
      expect(
        animatedBoxViewModel.spring,
        const SpringDescription(
          mass: 10,
          stiffness: 500,
          damping: 0.7,
        ),
      );
    });
  });
}
