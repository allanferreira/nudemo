import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/animated_presenter.dart';
import 'package:nudemo/home/presenter/fade_box_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/home/viewmodel/animated_box_viewmodel.dart';
import 'package:nudemo/utils/my_ticker_provider.dart';

class AnimatedBoxPresenter extends MyTickerProvider
    with ChangeNotifier
    implements AnimatedPresenter {
  AnimatedBoxViewModel _aBoxViewModel;

  static const Alignment _beginDragAlignment =
      AnimatedBoxViewModel.beginDragAlignment;
  static const Alignment _endDragAlignment =
      AnimatedBoxViewModel.endDragAlignment;
  static double _minDragDistance = AnimatedBoxViewModel.minDragDistance;

  AnimatedBoxPresenter() {
    this._aBoxViewModel = AnimatedBoxViewModel();

    this._aBoxViewModel.controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        this._aBoxViewModel.dragAlignment = this._aBoxViewModel.animation.value;
        // print('isCompleted: ${this._aBoxViewModel.controller.isCompleted}');

        notifyListeners();
      });
  }

  /// Calculate the velocity relative to the unit interval, [0,1],
  /// used by the animation controller.
  double _normalizeVelocity(Offset velocity, Size size) {
    final normalizedVelocity = Offset(
      velocity.dx / size.width,
      velocity.dy / size.height,
    );
    // Returning negative implies dragging away from center
    return -normalizedVelocity.distance;
  }

  /// Calculates and runs a [SpringSimulation]
  void _runAnimation({
    Offset velocity = Offset.zero,
    Size size,
    Alignment begin = _beginDragAlignment,
    Alignment end = _beginDragAlignment,
  }) {
    this._aBoxViewModel.animation = this._aBoxViewModel.controller.drive(
          AlignmentTween(begin: begin, end: end),
        );

    final simulation = SpringSimulation(
        this._aBoxViewModel.spring, 0, 1, _normalizeVelocity(velocity, size));

    this._aBoxViewModel.controller.animateWith(simulation);
  }

  /// Invert the drag target
  void _invertDragTarget() {
    if (this._aBoxViewModel.targetAlignment == _endDragAlignment) {
      this._aBoxViewModel.targetAlignment = _beginDragAlignment;
    } else {
      this._aBoxViewModel.targetAlignment = _endDragAlignment;
    }

    notifyListeners();
  }

  /// Stop animation controller
  void _stopAnimation() => this._aBoxViewModel.controller.stop(canceled: true);

  /// Return [isLowered] from model
  bool getIsLowered() => this._aBoxViewModel.isLowered;

  /// Return [dragAlignment] from model
  Alignment getDragAlignment() => this._aBoxViewModel.dragAlignment;

  /// Handler for [onPanStart] of GestureDetector
  void handlerPanStart(details) => _stopAnimation();

  /// Handler for [onPanUpdate] of GestureDetector
  void handlerPanUpdate(context, details, size) {
    /// [Animated Box Controller]
    // Top (-1.0) -> Center (0.0) -> Bottom (1.0)
    double _alignY = details.delta.dy / (size.height / 2);
    this._aBoxViewModel.dragAlignment += Alignment(0.0, _alignY);
    this._aBoxViewModel.draggingDirectionY =
        this._aBoxViewModel.draggingDirectionY + _alignY;

    /// [Fade Box Controller]
    // Hidden initiate (0.0) -> Then shown (1.0)
    double transitionOpacity = (details.globalPosition.dy / size.height) - 0.1;
    Provider.of<FadeBoxPresenter>(context, listen: false)
        .fadeTransitionTo(transitionOpacity);

    /// [Fade Buttons Controller]
    // Shown initiate (1.0) -> Then Hidden (0.0)
    double transitionOpacityReverse = 0.85;
    transitionOpacityReverse -= transitionOpacity;
    Provider.of<FadeButtonsPresenter>(context, listen: false)
        .fadeTransitionTo(transitionOpacityReverse);

    /// Drag direction: `TOP` <-> `BOTTOM`
    // if (this._aBoxViewModel.draggingDirectionY > 0 &&
    //     this._aBoxViewModel.draggingDirectionY > _minDragDistance) {
    //   print('Go to BOTTOM!');
    // } else if (this._aBoxViewModel.draggingDirectionY < 0 &&
    //     this._aBoxViewModel.draggingDirectionY < -(_minDragDistance)) {
    //   print('Go to TOP!');
    // } else {
    //   print('Go back!');
    // }

    /// Drag direction: `LEFT` <-> `RIGHT`
    /// ...
    /// maybe!!! maybe in the future... who know...

    notifyListeners();
  }

  /// Handler for [onPanEnd] of GestureDetector
  void handlerPanEnd(context, details, size) {
    if (this._aBoxViewModel.draggingDirectionY > 0 &&
        this._aBoxViewModel.draggingDirectionY > _minDragDistance) {
      _invertDragTarget();
      // print('Go to BOTTOM!');
    } else if (this._aBoxViewModel.draggingDirectionY < 0 &&
        this._aBoxViewModel.draggingDirectionY < -(_minDragDistance)) {
      _invertDragTarget();
      // print('Go to TOP!');
    } else {
      // print('Go back!');
    }

    _runAnimation(
      velocity: details.velocity.pixelsPerSecond,
      size: size,
      begin: this._aBoxViewModel.dragAlignment,
      end: this._aBoxViewModel.targetAlignment,
    );

    if (this._aBoxViewModel.targetAlignment == _endDragAlignment) {
      this._aBoxViewModel.isLowered = true;
      // Show the main menu box
      Provider.of<FadeBoxPresenter>(context, listen: false)
          .fadeTransitionForward();
      // Hide the buttons list bottom
      Provider.of<FadeButtonsPresenter>(context, listen: false)
          .fadeTransitionReverse();
    } else {
      this._aBoxViewModel.isLowered = false;
      // Hide the main menu box
      Provider.of<FadeBoxPresenter>(context, listen: false)
          .fadeTransitionReverse();
      // Show the buttons list bottom
      Provider.of<FadeButtonsPresenter>(context, listen: false)
          .fadeTransitionForward();
    }

    this._aBoxViewModel.draggingDirectionY = 0.0;

    notifyListeners();
  }

  /// Handler for [onPressed] of IconButton
  void handlerIconButtonPressed(BuildContext context, Size size) {
    _stopAnimation();

    Alignment endRun;
    if (this._aBoxViewModel.isLowered) {
      endRun = _beginDragAlignment;
      // Hide the main menu box
      Provider.of<FadeBoxPresenter>(context, listen: false)
          .fadeTransitionReverse();
      // Show the buttons list bottom
      Provider.of<FadeButtonsPresenter>(context, listen: false)
          .fadeTransitionForward();
    } else {
      endRun = _endDragAlignment;
      // Show the main menu box
      Provider.of<FadeBoxPresenter>(context, listen: false)
          .fadeTransitionForward();
      // Hide the buttons list bottom
      Provider.of<FadeButtonsPresenter>(context, listen: false)
          .fadeTransitionReverse();
    }

    _runAnimation(
      size: size,
      begin: this._aBoxViewModel.dragAlignment,
      end: endRun,
    );

    _invertDragTarget();

    this._aBoxViewModel.isLowered = !this._aBoxViewModel.isLowered;

    notifyListeners();
  }
}
