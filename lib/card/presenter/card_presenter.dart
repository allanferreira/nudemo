/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:nudemo/card/viewmodel/card_viewmodel.dart';

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class CardPresenter with ChangeNotifier {
  CardViewModel _cardViewModel;

  CardPresenter() {
    this._cardViewModel = CardViewModel();
  }

  List<String> getGeneratedItems() => _cardViewModel.generateItems;

  int getItemsLength() => _cardViewModel.generateItems.length;

  int semanticIndexCallback(widget, index) {
    // print('built index: $index');
    return index;
  }

  Future<String> _lazyProcessFromNetwork() async {
    final response = await Future.delayed(
      const Duration(milliseconds: 5000),
      () => 'Ok!',
    );
    return response;
  }

  Future<Null> refreshCustomScrollView() {
    // print('Refresh indicator triggered!');

    return _lazyProcessFromNetwork().then((response) {
      // print('Refresh indicator done! - response: $response');
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
  Map<String, dynamic> getDottedIndicatorColor({
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
