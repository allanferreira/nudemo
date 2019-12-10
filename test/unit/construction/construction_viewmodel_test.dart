import 'package:test/test.dart';

import 'package:nudemo/construction/viewmodel/construction_viewmodel.dart';

void main() {
  group('[Unit -> ConstructionViewModel]', () {
    ConstructionViewModel constructionViewModel;

    setUp(() {
      constructionViewModel = ConstructionViewModel();
    });

    test('Construction initial value should be 0', () {
      expect(constructionViewModel.counter, 0);
    });
  });
}
