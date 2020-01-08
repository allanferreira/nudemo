import 'package:test/test.dart';

import 'package:nudemo/home/viewmodel/home_viewmodel.dart';

void main() {
  group('[Unit -> HomeViewModel]', () {
    HomeViewModel homeViewModel;
    Map<String, dynamic> lastCardRegister;

    setUp(() {
      homeViewModel = HomeViewModel();
      lastCardRegister = {
        'icon': 57746,
        'text': 'Aguardando a sua primeira compra com o cartão',
      };
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

    test('the `limitValue` run time type should be [double]', () {
      expect(homeViewModel.limitValue.runtimeType, double);
    });

    test('the `limitValue` value should be [finite]', () {
      expect(homeViewModel.limitValue.isFinite, true);
    });

    test('the `limitValue` value should not be [negative]', () {
      expect(homeViewModel.limitValue.isNegative, false);
    });

    test('initial `limitValue` value should be 15000.5', () {
      expect(homeViewModel.limitValue, 15000.5);
    });

    test('the `limitPercent` run time type should be [double]', () {
      expect(homeViewModel.limitPercent.runtimeType, double);
    });

    test('the `limitPercent` value should be [finite]', () {
      expect(homeViewModel.limitPercent.isFinite, true);
    });

    test('the `limitPercent` value should not be [negative]', () {
      expect(homeViewModel.limitPercent.isNegative, false);
    });

    test('initial `limitPercent` value should be 100.00', () {
      expect(homeViewModel.limitPercent, 100.00);
    });

    test('the `balancesFutureValue` run time type should be [double]', () {
      expect(homeViewModel.balancesFutureValue.runtimeType, double);
    });

    test('initial `balancesFutureValue` value should be 1529.98', () {
      expect(homeViewModel.balancesFutureValue, 1529.98);
    });

    test('initial `balancesFuturePercent` value should be null', () {
      expect(homeViewModel.balancesFuturePercent, null);
    });

    test('initial `balancesFutureFlex` value should be null', () {
      expect(homeViewModel.balancesFutureFlex, null);
    });

    test('the `balancesOpenValue` run time type should be [double]', () {
      expect(homeViewModel.balancesOpenValue.runtimeType, double);
    });

    test('initial `balancesOpenValue` value should be 5578.79', () {
      expect(homeViewModel.balancesOpenValue, 5578.79);
    });

    test('initial `balancesOpenPercent` value should be null', () {
      expect(homeViewModel.balancesOpenPercent, null);
    });

    test('initial `balancesOpenFlex` value should be null', () {
      expect(homeViewModel.balancesOpenFlex, null);
    });

    test('the `balancesAvailableValue` run time type should be [double]', () {
      expect(homeViewModel.balancesAvailableValue.runtimeType, double);
    });

    test('initial `balancesAvailableValue` value should be 7891.23', () {
      expect(homeViewModel.balancesAvailableValue, 7891.23);
    });

    test('initial `balancesAvailablePercent` value should be null', () {
      expect(homeViewModel.balancesAvailablePercent, null);
    });

    test('initial `balancesAvailableFlex` value should be null', () {
      expect(homeViewModel.balancesAvailableFlex, null);
    });

    test('the `balancesDueValue` run time type should be [double]', () {
      expect(homeViewModel.balancesDueValue.runtimeType, double);
    });

    test('initial `balancesDueValue` value should be 0', () {
      expect(homeViewModel.balancesDueValue, 0);
    });

    test('the `balancesDuePercent` run time type should be [double]', () {
      expect(homeViewModel.balancesDuePercent.runtimeType, double);
    });

    test('initial `balancesDuePercent` value should be 0', () {
      expect(homeViewModel.balancesDuePercent, 0);
    });

    test('the `balancesDueFlex` run time type should be [int]', () {
      expect(homeViewModel.balancesDueFlex.runtimeType, int);
    });

    test('initial `balancesDueFlex` value should be 0', () {
      expect(homeViewModel.balancesDueFlex, 0);
    });

    test('the `lastCardRegister` tyle should be `Map<String, dynamic>`', () {
      expect(
        homeViewModel.lastCardRegister.runtimeType,
        lastCardRegister.runtimeType,
      );
    });

    test('initial `lastCardRegister` value should be equal `lastCardRegister`',
        () {
      expect(homeViewModel.lastCardRegister, lastCardRegister);
    });

    test('the `lastCardRegister["icon"]` run time type should be [int]', () {
      expect(homeViewModel.lastCardRegister['icon'].runtimeType, int);
    });

    test('the `lastCardRegister["text"]` run time type should be [String]', () {
      expect(homeViewModel.lastCardRegister['text'].runtimeType, String);
    });
  });
}
