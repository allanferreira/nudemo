/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:nudemo/home/viewmodel/home_viewmodel.dart';

class HomePresenter {
  HomeViewModel _homeViewModel;

  HomePresenter() {
    this._homeViewModel = HomeViewModel();
  }

  int getValue() => this._homeViewModel.value;
}
