import 'package:test/test.dart';

import 'package:nudemo/home/viewmodel/home_viewmodel.dart';

void main() {
  group('[Unit -> HomeViewModel]', () {
    HomeViewModel homeViewModel;

    setUp(() {
      homeViewModel = HomeViewModel();
    });

    test('initial value should be 0', () {
      expect(homeViewModel.value, 0);
    });
  });
}
