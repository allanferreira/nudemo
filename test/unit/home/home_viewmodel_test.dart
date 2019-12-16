import 'package:test/test.dart';

import 'package:nudemo/home/viewmodel/home_viewmodel.dart';

void main() {
  group('[Unit -> HomeViewModel]', () {
    HomeViewModel homeViewModel;

    setUp(() {
      homeViewModel = HomeViewModel();
    });

    test('initial `darkIsEnable` value should be false', () {
      expect(homeViewModel.darkIsEnable, false);
    });

    test('initial `initialPageCarousel` value should be 0', () {
      expect(homeViewModel.initialPageCarousel, 0);
    });

    test('initial `currentPageCarousel` value should be 0', () {
      expect(homeViewModel.currentPageCarousel, 0);
    });

    test('the `themeKeys` length should be 4', () {
      expect(NuThemeKeys.values.length, 4);
    });
  });
}
