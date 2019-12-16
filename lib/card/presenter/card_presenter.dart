/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/foundation.dart';

// import 'package:nudemo/card/viewmodel/card_viewmodel.dart';

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class CardPresenter with ChangeNotifier {
  // CardViewModel _cardViewModel;

  // CardPresenter() {
  //   this._cardViewModel = CardViewModel();
  // }
}
