import 'package:flutter/widgets.dart';

/// MVP Design Pattern
/// The `model` is an interface defining the data to be displayed or
/// otherwise acted upon in the user interface.

class FadeBoxViewModel {
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  /// Fade transition opacity level
  /// [0.0] -> Fully transparent (hidden)
  /// [1.0] -> Fully visible (shown)
  double transitionOpacity;

  static final double initialOpacity = 0.0;
  static final Duration duration = const Duration(milliseconds: 800);
  static final Duration durationReverse = const Duration(milliseconds: 400);
  static final Duration durationFast = const Duration(milliseconds: 100);
  static final Curve curveForward = Curves.easeOutQuad;
  static final Curve curveReverse = Curves.linear;

  FadeBoxViewModel();
}
