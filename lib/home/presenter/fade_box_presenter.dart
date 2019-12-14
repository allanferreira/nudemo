import 'package:flutter/widgets.dart';

import 'package:nudemo/home/presenter/fade_presenter.dart';
import 'package:nudemo/home/viewmodel/fade_box_viewmodel.dart';
import 'package:nudemo/utils/my_ticker_provider.dart';

class FadeBoxPresenter extends MyTickerProvider
    with ChangeNotifier
    implements FadePresenter {
  FadeBoxViewModel _fBoxViewModel;

  FadeBoxPresenter() {
    this._fBoxViewModel = FadeBoxViewModel();

    this._fBoxViewModel.controller = AnimationController(
      value: FadeBoxViewModel.initialOpacity,
      duration: FadeBoxViewModel.duration,
      reverseDuration: FadeBoxViewModel.durationReverse,
      vsync: this,
    )..addListener(() {
        // print('curvedAnimation: ${this._fBoxViewModel.curvedAnimation}');
        // print('opacity: ${this._fBoxViewModel.controller.value}');
        // print('velocity: ${this._fBoxViewModel.controller.velocity}');
        // print('status: ${this._fBoxViewModel.controller.status}');

        notifyListeners();
      });

    this._fBoxViewModel.curvedAnimation = CurvedAnimation(
      parent: this._fBoxViewModel.controller,
      curve: FadeBoxViewModel.curveForward,
      reverseCurve: FadeBoxViewModel.curveReverse,
    );
  }

  /// Return [curvedAnimation] from model
  CurvedAnimation getCurvedAnimation() => this._fBoxViewModel.curvedAnimation;

  /// Drives the animation from its current value to target.
  void fadeTransitionTo(double opacity) =>
      this._fBoxViewModel.controller.value = opacity;

  /// Starts running this animation forwards
  /// [towards the end].
  void fadeTransitionForward() {
    this._fBoxViewModel.controller.stop(canceled: true);

    this._fBoxViewModel.controller.forward();
  }

  /// Starts running this animation in reverse
  /// [towards the beginning].
  void fadeTransitionReverse() {
    this._fBoxViewModel.controller.stop(canceled: true);

    this._fBoxViewModel.controller.reverse();
  }
}
