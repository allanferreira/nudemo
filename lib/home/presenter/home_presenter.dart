/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/themes/nu_default_theme.dart';
import 'package:nudemo/themes/nu_dark_theme.dart';
import 'package:nudemo/utils/utils.dart';

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class HomePresenter with ChangeNotifier {
  HomeViewModel _homeViewModel;
  Utils _utils = Utils();

  HomePresenter() {
    this._homeViewModel = HomeViewModel();
  }

  /// Check system brightness [platformBrightness]
  Brightness checkSystemBrightness({BuildContext context}) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool darkIsEnable = (brightness == Brightness.dark);
    setNuTheme(darkIsEnable: darkIsEnable);

    // print('Platform Brightness: $brightness');
    // print('darkIsEnable: $darkIsEnable');

    return brightness;
  }

  /// Setup the theme between light or dark
  void setNuTheme({bool darkIsEnable}) {
    if (this._homeViewModel.darkIsEnable != darkIsEnable) {
      this._homeViewModel.darkIsEnable = darkIsEnable;

      Future.delayed(
        const Duration(milliseconds: 500),
        () => notifyListeners(),
      );
    }
  }

  /// Get current system theme
  ThemeData getNuTheme() {
    /// Here there may be a calendar check if it's:
    /// - [CHRISTMAS];
    /// - [EASTER];
    /// - [MOTHERS DAY];
    /// - [VALENTINE'S DAY];
    /// and others... so, enable specific theme based on date.
    if (this._homeViewModel.darkIsEnable) {
      return getNuThemeFromKey(NuThemeKeys.DARK);
    }

    return getNuThemeFromKey(NuThemeKeys.DEFAULT);
  }

  /// Get theme by key
  ThemeData getNuThemeFromKey(NuThemeKeys themeKey) {
    switch (themeKey) {
      case NuThemeKeys.DARK:
        return nuDarkTheme;
      case NuThemeKeys.CHRISTMAS:
        return nuDefaultTheme; // Sorry! Not implemented yet 🤦‍♂
      case NuThemeKeys.CHRISTMAS_DARK:
        return nuDarkTheme; // Sorry! Not implemented yet 🤦‍♂
      default:
        return nuDefaultTheme;
    }
  }

  /// Set page index and notify listeners
  void setCurrentPageCarousel(int index) {
    this._homeViewModel.currentPageCarousel = index;
    // print('On the viewport: $index');

    notifyListeners();
  }

  /// Get initial page index in the center of the viewport.
  int getInitialPageCarousel() => this._homeViewModel.initialPageCarousel;

  /// Get current page index in the center of the viewport.
  int getCurrentPageCarousel() => this._homeViewModel.currentPageCarousel;

  /// Get dotted indicator color
  Color getDottedIndicatorColor({
    int index,
    Color activeColor,
    Color unactiveColor,
  }) =>
      this.getCurrentPageCarousel() == index ? activeColor : unactiveColor;

  /// Called whenever the page in the center of the viewport changes
  // static dynamic onTheViewport(BuildContext context, int index) =>
  //     Provider.of<HomePresenter>(context, listen: false)
  //         .setCurrentPageCarousel(index);

  /// Get the value of Balances Future Value
  double getFutureValue() => _homeViewModel.balancesFutureValue;

  /// Get the value of Balances Open Value
  double getOpenValue() => _homeViewModel.balancesOpenValue;

  /// Get the value of Balances Available Value
  double getAvailableValue() => _homeViewModel.balancesAvailableValue;

  /// Get the value of Balances Due Value
  double getDueValue() => _homeViewModel.balancesDueValue;

  /// Get the value of Balances Future Currency (R$)
  String getFutureCurrency() =>
      _utils.getValueCurrency(_homeViewModel.balancesFutureValue);

  /// Get the value of Balances Open Currency (R$)
  String getOpenCurrency() =>
      _utils.getValueCurrency(_homeViewModel.balancesOpenValue);

  /// Get the value of Balances Available Currency (R$)
  String getAvailableCurrency() =>
      _utils.getValueCurrency(_homeViewModel.balancesAvailableValue);

  /// Get the value of Balances Due Currency
  double getDueCurrency() => _homeViewModel.balancesDueValue;

  /// Get the value of Balances Future Percent
  double getFuturePercent() => _homeViewModel.balancesFuturePercent;

  /// Get the value of Balances Open Percent
  double getOpenPercent() => _homeViewModel.balancesOpenPercent;

  /// Get the value of Balances Available Percent
  double getAvailablePercent() => _homeViewModel.balancesAvailablePercent;

  /// Get the value of Balances Due Percent
  double getDuePercent() => _homeViewModel.balancesDuePercent;

  /// Get the value of Balances Future Flex
  int getFutureFlex() => _homeViewModel.balancesFutureFlex;

  /// Get the value of Balances Open Flex
  int getOpenFlex() => _homeViewModel.balancesOpenFlex;

  /// Get the value of Balances Available Flex
  int getAvailableFlex() => _homeViewModel.balancesAvailableFlex;

  /// Get the value of Balances Due Flex
  int getDueFlex() => _homeViewModel.balancesDueFlex;

  /// Calculate `percentage` and `flex` values of balances
  void calculatePercentBalances() {
    _homeViewModel.balancesFuturePercent =
        (_homeViewModel.balancesFutureValue / _homeViewModel.limitValue) * 100;
    _homeViewModel.balancesFutureFlex =
        _homeViewModel.balancesFuturePercent.round();

    _homeViewModel.balancesOpenPercent =
        (_homeViewModel.balancesOpenValue / _homeViewModel.limitValue) * 100;
    _homeViewModel.balancesOpenFlex =
        _homeViewModel.balancesOpenPercent.round();

    _homeViewModel.balancesAvailablePercent =
        (_homeViewModel.balancesAvailableValue / _homeViewModel.limitValue) *
            100;
    _homeViewModel.balancesAvailableFlex =
        _homeViewModel.balancesAvailablePercent.round();

    _homeViewModel.balancesDuePercent =
        (_homeViewModel.balancesDueValue / _homeViewModel.limitValue) * 100;
    _homeViewModel.balancesDueFlex = _homeViewModel.balancesDuePercent.round();

    _homeViewModel.limitPercent = _homeViewModel.balancesFuturePercent +
        _homeViewModel.balancesOpenPercent +
        _homeViewModel.balancesAvailablePercent +
        _homeViewModel.balancesDuePercent;
  }

  /// Format currency for summary info box style
  List<String> getFormattedCurrency(String currency) {
    List<String> temp1 = [];
    List<String> temp2 = [];
    List<String> formatted = [];

    temp1 = currency.split('\u00a0');
    if (temp1.length == 2) {
      formatted.add(temp1[0]); // [R$]
      temp2 = temp1[1].split(",");

      if (temp2.length == 2) {
        formatted.addAll(temp1[1].split(",")); // [0.000],[00]
      }
    }

    return formatted;
  }

  /// Get last card register
  Map<String, dynamic> getLastCardRegister() => _homeViewModel.lastCardRegister;
}
