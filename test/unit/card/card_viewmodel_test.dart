import 'package:test/test.dart';

import 'package:nudemo/card/viewmodel/card_viewmodel.dart';

void main() {
  group('[Unit -> CardViewModel]', () {
    CardViewModel cardViewModel;
    List<String> generateItems;

    setUp(() {
      cardViewModel = CardViewModel();
      generateItems = List<String>.generate(250, (index) => "Item $index");
    });

    test('initial `initialPageCarousel` value should be 0', () {
      expect(cardViewModel.initialPageCarousel, 0);
    });

    test('initial `currentPageCarousel` value should be 0', () {
      expect(cardViewModel.currentPageCarousel, 0);
    });

    test('the `generateItems` type should be `List<String>`', () {
      expect(
        cardViewModel.generateItems.runtimeType,
        generateItems.runtimeType,
      );
    });

    test('the `generateItems` value should be equal `generateItems`', () {
      expect(cardViewModel.generateItems, generateItems);
    });

    test('the `generateItems` value should be a list with 250 items', () {
      expect(cardViewModel.generateItems.length, 250);
    });
  });
}
