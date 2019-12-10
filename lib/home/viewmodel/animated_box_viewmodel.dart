import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';

class AnimatedBoxViewModel {
  /// The alignment of the box as it is dragged or being animated.
  ///
  /// While the box is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [animation].

  AnimationController controller;
  Animation<Alignment> animation;

  static const Alignment beginDragAlignment = Alignment(0.0, -0.5);
  static const Alignment endDragAlignment = Alignment(0.0, 1.0);
  Alignment targetAlignment = beginDragAlignment;
  Alignment dragAlignment = beginDragAlignment;

  /// Minimum drag distance for drag animation [20%]
  static double minDragDistance =
      (endDragAlignment.y - beginDragAlignment.y) * 0.20;

  /// Initial value to calculate drag direction
  double draggingDirectionY = 0.0;
  bool isLowered = false;

  // Physics data
  final spring = const SpringDescription(
    mass: 10,
    stiffness: 500,
    damping: 0.7,
  );

  AnimatedBoxViewModel();
}
