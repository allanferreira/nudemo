import 'package:flutter/widgets.dart';

abstract class AnimatedBoxPresenter {
  bool getIsLowered();
  Alignment getDragAlignment();
  void handlerPanStart(DragStartDetails details);
  void handlerPanUpdate(DragUpdateDetails details, Size size);
  void handlerPanEnd(DragEndDetails details, Size size);
  void handlerIconButtonPressed(Size size);
}
