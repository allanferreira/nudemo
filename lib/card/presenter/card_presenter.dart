/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:nudemo/card/viewmodel/card_viewmodel.dart';
import 'package:nudemo/utils/config.dart';

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class CardPresenter with ChangeNotifier {
  CardViewModel _cardViewModel;

  CardPresenter([CardViewModel cardViewModelMock]) {
    this._cardViewModel = cardViewModelMock ?? CardViewModel();
  }

  List<Map<String, dynamic>> getCardHistoryItems() =>
      this._cardViewModel.cardHistoryItems;

  int getItemsLength() => this._cardViewModel.cardHistoryItems.length;

  int semanticIndexCallback(widget, index) {
    // print('built index: $index');
    return index;
  }

  Future<List<Map<String, dynamic>>> _lazyProcessFromNetwork() async {
    return await Future.delayed(
      const Duration(milliseconds: 5000),
      () => Config().cardHistoryItems,
    );
  }

  Future<void> refreshCustomScrollView() async {
    // print('Refresh indicator triggered!');

    return await _lazyProcessFromNetwork().then((response) {
      // print('Refresh indicator done! - response: $response');

      this._cardViewModel.cardHistoryItems = [];
      notifyListeners();
    });
  }

  /// Set page index and notify listeners
  void setCurrentPageCarousel(int index) {
    this._cardViewModel.currentPageCarousel = index;
    // print('On the viewport: $index');

    notifyListeners();
  }

  /// Get initial page index in the center of the viewport.
  int getInitialPageCarousel() => this._cardViewModel.initialPageCarousel;

  /// Get current page index in the center of the viewport.
  int getCurrentPageCarousel() => this._cardViewModel.currentPageCarousel;

  /// Get dotted indicator color and width/height
  Map<String, dynamic> getDottedIndicatorColorWidth({
    int index,
    double widthHeight,
    Color activeColor,
    Color unactiveColor,
  }) {
    Map<String, dynamic> active = {
      'color': activeColor,
      'widthHeight': widthHeight + (widthHeight * 0.35),
    };
    Map<String, dynamic> unactive = {
      'color': unactiveColor,
      'widthHeight': widthHeight,
    };

    return this.getCurrentPageCarousel() == index ? active : unactive;
  }

  /// Called whenever the page in the center of the viewport changes
  // static dynamic onTheViewport(BuildContext context, int index) =>
  //     Provider.of<CardPresenter>(context, listen: false)
  //         .setCurrentPageCarousel(index);
}
