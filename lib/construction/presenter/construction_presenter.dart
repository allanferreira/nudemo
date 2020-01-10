/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/foundation.dart';

import 'package:nudemo/construction/viewmodel/construction_viewmodel.dart';

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class ConstructionPresenter with ChangeNotifier {
  ConstructionViewModel _constructionViewModel;

  ConstructionPresenter([ConstructionViewModel constructionViewModelMock]) {
    this._constructionViewModel =
        constructionViewModelMock ?? ConstructionViewModel();
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
