import 'package:flutter/widgets.dart';

import 'package:nudemo/home/presenter/fade_presenter.dart';
import 'package:nudemo/home/viewmodel/fade_buttons_viewmodel.dart';
import 'package:nudemo/utils/my_ticker_provider.dart';

class FadeButtonsPresenter extends MyTickerProvider
    with ChangeNotifier
    implements FadePresenter {
  FadeButtonsViewModel _fBoxViewModel;

  FadeButtonsPresenter() {
    this._fBoxViewModel = FadeButtonsViewModel();

    this._fBoxViewModel.controller = AnimationController(
      value: FadeButtonsViewModel.initialOpacity,
      duration: FadeButtonsViewModel.duration,
      reverseDuration: FadeButtonsViewModel.durationReverse,
      vsync: this,
    )..addListener(() => notifyListeners());

    this._fBoxViewModel.curvedAnimation = CurvedAnimation(
      parent: this._fBoxViewModel.controller,
      curve: FadeButtonsViewModel.curveForward,
      reverseCurve: FadeButtonsViewModel.curveReverse,
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
