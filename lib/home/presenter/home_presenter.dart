/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/themes/nu_default_theme.dart';
import 'package:nudemo/themes/nu_dark_theme.dart';

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class HomePresenter with ChangeNotifier {
  HomeViewModel _homeViewModel;

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
  Color getDottedIndicatorColor(BuildContext context, int index) {
    return this.getCurrentPageCarousel() == index
        ? Theme.of(context).iconTheme.color
        : Theme.of(context).iconTheme.color.withOpacity(0.4);
  }

  /// Called whenever the page in the center of the viewport changes
  static dynamic onTheViewport(BuildContext context, int index) =>
      Provider.of<HomePresenter>(context, listen: false)
          .setCurrentPageCarousel(index);

  /// Custom map function
  static List<T> mapCustom<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
