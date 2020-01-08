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
      expect(HomeViewModel.limitValue.runtimeType, double);
    });

    test('the `limitValue` value should be [finite]', () {
      expect(HomeViewModel.limitValue.isFinite, true);
    });

    test('the `limitValue` value should not be [negative]', () {
      expect(HomeViewModel.limitValue.isNegative, false);
    });

    test('initial `limitValue` value should be 15000.5', () {
      expect(HomeViewModel.limitValue, 15000.5);
    });

    test('the `limitPercent` run time type should be [double]', () {
      expect(HomeViewModel.limitPercent.runtimeType, double);
    });

    test('the `limitPercent` value should be [finite]', () {
      expect(HomeViewModel.limitPercent.isFinite, true);
    });

    test('the `limitPercent` value should not be [negative]', () {
      expect(HomeViewModel.limitPercent.isNegative, false);
    });

    test('initial `limitPercent` value should be 100.00', () {
      expect(HomeViewModel.limitPercent, 100.00);
    });

    test('the `balancesFutureValue` run time type should be [double]', () {
      expect(HomeViewModel.balancesFutureValue.runtimeType, double);
    });

    test('initial `balancesFutureValue` value should be 0.0', () {
      expect(HomeViewModel.balancesFutureValue, 0.0);
    });

    test('initial `balancesFuturePercent` value should be 0.0', () {
      expect(HomeViewModel.balancesFuturePercent, 0.0);
    });

    test('initial `balancesFutureFlex` value should be 0', () {
      expect(HomeViewModel.balancesFutureFlex, 0);
    });

    test('the `balancesOpenValue` run time type should be [double]', () {
      expect(HomeViewModel.balancesOpenValue.runtimeType, double);
    });

    test('initial `balancesOpenValue` value should be 5578.79', () {
      expect(HomeViewModel.balancesOpenValue, 5578.79);
    });

    test('initial `balancesOpenPercent` value should be 37.19069364354522', () {
      expect(HomeViewModel.balancesOpenPercent, 37.19069364354522);
    });

    test('initial `balancesOpenFlex` value should be 37', () {
      expect(HomeViewModel.balancesOpenFlex, 37);
    });

    test('the `balancesAvailableValue` run time type should be [double]', () {
      expect(HomeViewModel.balancesAvailableValue.runtimeType, double);
    });

    test('initial `balancesAvailableValue` value should be 9421.71', () {
      expect(HomeViewModel.balancesAvailableValue, 9421.71);
    });

    test(
        'initial `balancesAvailablePercent` value should be 62.809306356454776',
        () {
      expect(HomeViewModel.balancesAvailablePercent, 62.809306356454776);
    });

    test('initial `balancesAvailableFlex` value should be 63', () {
      expect(HomeViewModel.balancesAvailableFlex, 63);
    });

    test('the `balancesDueValue` run time type should be [double]', () {
      expect(HomeViewModel.balancesDueValue.runtimeType, double);
    });

    test('initial `balancesDueValue` value should be 0', () {
      expect(HomeViewModel.balancesDueValue, 0);
    });

    test('the `balancesDuePercent` run time type should be [double]', () {
      expect(HomeViewModel.balancesDuePercent.runtimeType, double);
    });

    test('initial `balancesDuePercent` value should be 0', () {
      expect(HomeViewModel.balancesDuePercent, 0);
    });

    test('the `balancesDueFlex` run time type should be [int]', () {
      expect(HomeViewModel.balancesDueFlex.runtimeType, int);
    });

    test('initial `balancesDueFlex` value should be 0', () {
      expect(HomeViewModel.balancesDueFlex, 0);
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
