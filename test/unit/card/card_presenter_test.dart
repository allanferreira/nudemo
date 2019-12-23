import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/card/viewmodel/card_viewmodel.dart';

void main() {
  group('[Unit -> CardPresenter]', () {
    CardPresenter cardPresenter;
    CardViewModel cardViewModel;
    List<Map<String, dynamic>> cardHistoryItems;
    Future<Null> futureNull;
    final double widthHeight = 5.0;
    final Color activeColor = Colors.black45;
    final Color unactiveColor = Colors.white;
    final Map<String, dynamic> activeDotted = {
      'color': activeColor,
      'widthHeight': widthHeight + (widthHeight * 0.35),
    };
    final Map<String, dynamic> unactiveDotted = {
      'color': unactiveColor,
      'widthHeight': widthHeight,
    };

    setUp(() {
      cardPresenter = CardPresenter();
      cardViewModel = CardViewModel();
      cardHistoryItems = cardViewModel.cardHistoryItems;
    });

    test('the `getCardHistoryItems()` value should be equal `cardHistoryItems`',
        () {
      expect(
        cardPresenter.getCardHistoryItems(),
        cardHistoryItems,
      );
    });

    test(
        'the `getItemsLength()` value should be equal `cardHistoryItems.length`',
        () {
      expect(
        cardPresenter.getItemsLength(),
        cardHistoryItems.length,
      );
    });

    test('the `semanticIndexCallback(widget, index)` value should be `index`',
        () {
      expect(cardPresenter.semanticIndexCallback(Container(), 1), 1);
    });

    test('the `refreshCustomScrollView()` type should be `Future<Null>`',
        () async {
      Future<Null> _futureNull = await cardPresenter.refreshCustomScrollView();

      expect(
        _futureNull.runtimeType,
        futureNull.runtimeType,
      );
    });

    test(
        'the `setCurrentPageCarousel()` should be change `currentPageCarousel`',
        () {
      cardPresenter.setCurrentPageCarousel(2);

      expect(cardPresenter.getCurrentPageCarousel(), 2);
    });

    test('initial `getInitialPageCarousel()` value should be 0', () {
      expect(cardPresenter.getInitialPageCarousel(), 0);
    });

    test('initial `getCurrentPageCarousel()` value should be 0', () {
      expect(cardPresenter.getCurrentPageCarousel(), 0);
    });

    test(
        '`getCurrentPageCarousel()` value should be 1 after set new current page with 1',
        () {
      expect(cardPresenter.getCurrentPageCarousel(), 0);

      cardPresenter.setCurrentPageCarousel(1);

      expect(cardPresenter.getCurrentPageCarousel(), 1);
    });

    test(
        '`getCurrentPageCarousel()` value should be 0 after set new current page with 0',
        () {
      expect(cardPresenter.getCurrentPageCarousel(), 0);

      cardPresenter.setCurrentPageCarousel(0);

      expect(cardPresenter.getCurrentPageCarousel(), 0);
    });

    test(
        '`getCurrentPageCarousel()` value should be 2 after set new current page two times',
        () {
      expect(cardPresenter.getCurrentPageCarousel(), 0);

      cardPresenter.setCurrentPageCarousel(1);

      expect(cardPresenter.getCurrentPageCarousel(), 1);

      cardPresenter.setCurrentPageCarousel(2);

      expect(cardPresenter.getCurrentPageCarousel(), 2);
    });

    test(
        '`getCurrentPageCarousel()` value should be 0 after set new current page two times and go back to 0',
        () {
      expect(cardPresenter.getCurrentPageCarousel(), 0);

      cardPresenter.setCurrentPageCarousel(1);

      expect(cardPresenter.getCurrentPageCarousel(), 1);

      cardPresenter.setCurrentPageCarousel(2);

      expect(cardPresenter.getCurrentPageCarousel(), 2);

      cardPresenter.setCurrentPageCarousel(0);

      expect(cardPresenter.getCurrentPageCarousel(), 0);
    });

    test(
        'initial `getDottedIndicatorColorWidth()` value should be equal `activeDotted`',
        () {
      int index = 0;

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeDotted,
      );
    });

    test(
        'initial `getDottedIndicatorColorWidth()` value should be equal `unactiveDotted` with index = 1',
        () {
      int index = 1;

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveDotted,
      );
    });

    test(
        '`getDottedIndicatorColorWidth()` value should be equal `activeDotted` with index = 1 and setCurrentPageCarousel() with index = 1',
        () {
      int index = 1;

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveDotted,
      );

      cardPresenter.setCurrentPageCarousel(1);

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeDotted,
      );
    });

    test(
        '`getDottedIndicatorColorWidth()` value should be equal `unactiveDotted` with index = 1 and setCurrentPageCarousel() with index = 2',
        () {
      int index = 1;

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveDotted,
      );

      cardPresenter.setCurrentPageCarousel(1);

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeDotted,
      );

      cardPresenter.setCurrentPageCarousel(2);

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveDotted,
      );
    });

    test(
        '`getDottedIndicatorColorWidth()` value should be equal `activeDotted` with index = 1 and setCurrentPageCarousel() with index = 1 some times',
        () {
      int index = 1;

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveDotted,
      );

      cardPresenter.setCurrentPageCarousel(1);

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeDotted,
      );

      cardPresenter.setCurrentPageCarousel(1);

      expect(
        cardPresenter.getDottedIndicatorColorWidth(
          index: index,
          widthHeight: widthHeight,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeDotted,
      );
    });
  });
}
