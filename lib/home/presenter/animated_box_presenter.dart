/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/widgets.dart';

abstract class AnimatedBoxPresenter {
  /// Return [isLowered] from model
  bool getIsLowered();

  /// Return [dragAlignment] from model
  Alignment getDragAlignment();

  /// Handler for [onPanStart] of GestureDetector
  void handlerPanStart(DragStartDetails details);

  /// Handler for [onPanUpdate] of GestureDetector
  void handlerPanUpdate(
    BuildContext context,
    DragUpdateDetails details,
    Size size,
  );

  /// Handler for [onPanEnd] of GestureDetector
  void handlerPanEnd(
    BuildContext context,
    DragEndDetails details,
    Size size,
  );

  /// Handler for [onPressed] of IconButton
  void handlerIconButtonPressed(
    BuildContext context,
    Size size,
  );
}
