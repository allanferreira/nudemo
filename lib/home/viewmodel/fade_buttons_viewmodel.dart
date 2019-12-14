import 'package:flutter/widgets.dart';

/// MVP Design Pattern
/// The `model` is an interface defining the data to be displayed or
/// otherwise acted upon in the user interface.

class FadeButtonsViewModel {
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  /// Fade opacity initial level
  /// [0.0] -> Fully transparent (hidden)
  /// [1.0] -> Fully visible (shown)
  static final double initialOpacity = 1.0;
  static final Duration duration = const Duration(milliseconds: 400);
  static final Duration durationReverse = const Duration(milliseconds: 400);
  static final Curve curveForward = Curves.linear;
  static final Curve curveReverse = Curves.linear;

  FadeButtonsViewModel();
}
