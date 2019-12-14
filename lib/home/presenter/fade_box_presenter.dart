/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/widgets.dart';

abstract class FadeBoxPresenter {
  /// Return [curvedAnimation] from model
  CurvedAnimation getCurvedAnimation();

  /// Drives the animation from its current value to target.
  void fadeTransitionTo({
    double opacity,
    Duration duration,
    Curve curve,
  });

  /// Starts running this animation forwards
  /// [towards the end].
  void fadeTransitionForward();

  /// Starts running this animation in reverse
  /// [towards the beginning].
  void fadeTransitionReverse();
}
