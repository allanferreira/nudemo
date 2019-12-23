import 'package:test/test.dart';

import 'package:nudemo/card/viewmodel/card_viewmodel.dart';

void main() {
  group('[Unit -> CardViewModel]', () {
    CardViewModel cardViewModel;
    List<Map<String, dynamic>> cardHistoryItems;

    setUp(() {
      cardViewModel = CardViewModel();
      cardHistoryItems = [
        {
          'type': 'income',
          'icon': null,
          'title': 'Pagamento recebido',
          'text': null,
          'money': 3195.96,
          'division': null,
          'date': DateTime.now().toString(),
          'tags': null,
        },
      ];
    });

    test('initial `initialPageCarousel` value should be 0', () {
      expect(cardViewModel.initialPageCarousel, 0);
    });

    test('initial `currentPageCarousel` value should be 0', () {
      expect(cardViewModel.currentPageCarousel, 0);
    });

    test('the `cardHistoryItems` type should be `List<Map<String, dynamic>>`',
        () {
      expect(
        cardViewModel.cardHistoryItems.runtimeType,
        cardHistoryItems.runtimeType,
      );
    });

    test('the `cardHistoryItems` value should not be empty', () {
      expect(cardViewModel.cardHistoryItems.isNotEmpty, true);
    });

    test('the `cardHistoryItems` value should be a list with 11 items', () {
      expect(cardViewModel.cardHistoryItems.length, 11);
    });
  });
}
