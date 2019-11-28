/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/foundation.dart';

import 'package:nudemo/home/viewmodel/counter_viewmodel.dart';

/// Abstract classes
abstract class CounterPresenter {
  /// Abstract methods
  void onfloatingButtonClicked();
}

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class BasicCounterPresenter with ChangeNotifier implements CounterPresenter {
  CounterViewModel _counterViewModel;

  BasicCounterPresenter() {
    this._counterViewModel = CounterViewModel(0);
  }

  int getValue() => this._counterViewModel.value;

  void _increment() {
    this._counterViewModel.value++;
    // print('Value++: ${getValue()}');
    notifyListeners();
  }

  void _decrement() {
    this._counterViewModel.value--;
    // print('Value--: ${getValue()}');
    notifyListeners();
  }

  @override
  void onfloatingButtonClicked() {
    if (getValue() == 3) {
      _decrement();
      _decrement();
      _decrement();
    } else if (getValue() < 3) {
      _increment();
    }
  }
}
