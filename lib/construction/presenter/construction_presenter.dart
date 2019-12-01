/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/foundation.dart';

import 'package:nudemo/construction/viewmodel/construction_viewmodel.dart';

/// Abstract classes
abstract class ConstructionPresenter {
  /// Abstract methods
  void onfloatingButtonClicked();
}

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class BasicConstructionPresenter
    with ChangeNotifier
    implements ConstructionPresenter {
  ConstructionViewModel _constructionViewModel;

  BasicConstructionPresenter() {
    this._constructionViewModel = ConstructionViewModel(0);
  }

  int getValue() => this._constructionViewModel.counter;

  void _increment() {
    this._constructionViewModel.counter++;
    // print('Value++: ${getValue()}');
    notifyListeners();
  }

  void _decrement() {
    this._constructionViewModel.counter--;
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
