import 'package:test/test.dart';
import 'package:matcher/src/type_matcher.dart' as matcher;

import 'package:nudemo/card/viewmodel/card_viewmodel.dart';

void main() {
  group('[Unit -> CardViewModel]', () {
    CardViewModel cardViewModel;

    setUp(() {
      cardViewModel = CardViewModel();
    });

    test('initial `initialPageCarousel` value should be 0', () {
      expect(cardViewModel.initialPageCarousel, 0);
    });

    test('initial `currentPageCarousel` value should be 0', () {
      expect(cardViewModel.currentPageCarousel, 0);
    });

    test(
        'the `cardHistoryItems` TypeMatcher should be [List<Map<String, dynamic>>]',
        () {
      expect(
        cardViewModel.cardHistoryItems,
        const matcher.TypeMatcher<List<Map<String, dynamic>>>(),
      );
    });

    test('the `cardHistoryItems` value should be empty', () {
      expect(cardViewModel.cardHistoryItems.isEmpty, true);
    });

    test('the `cardHistoryItems` value should be a list with 0 item', () {
      expect(cardViewModel.cardHistoryItems.length, 0);
    });
  });
}
