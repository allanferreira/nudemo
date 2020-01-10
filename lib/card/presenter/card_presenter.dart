/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:nudemo/card/viewmodel/card_viewmodel.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/utils/model/purchase_model.dart';
import 'package:nudemo/utils/api.dart';
import 'package:nudemo/utils/globals.dart' as globals;

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

  /// Refresh Custom ScrollView
  Future<void> refreshCustomScrollView(BuildContext context) async {
    // print('Refresh indicator triggered!');

    http.Client httpClient = http.Client();
    Api utilsApi = Api();

    // Get purchase list
    List<Purchase> cardHistoryItems = await utilsApi.listPurchaseApi(
      httpClient: httpClient,
      accountId: globals.accountUuid,
    );

    // Get account balance
    Balance accountBalance = await utilsApi.balancePurchaseApi(
      httpClient: httpClient,
      accountId: globals.accountUuid,
    );

    if (accountBalance != null) {
      /// Calculate percentage balances
      Provider.of<HomePresenter>(context, listen: false)
          .calculatePercentBalances(
        accountBalance: accountBalance.balance,
      );

      this._cardViewModel.cardHistoryItems = allPurchasesToMapApp(
        cardHistoryItems.reversed.toList(),
      );

      notifyListeners();
    }
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
