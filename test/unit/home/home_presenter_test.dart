import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/themes/nu_default_theme.dart';
import 'package:nudemo/themes/nu_dark_theme.dart';

void main() {
  group('[Unit -> HomePresenter]', () {
    HomePresenter homePresenter;
    HomeViewModel homeViewModel;

    setUp(() {
      homePresenter = HomePresenter();
      homeViewModel = HomeViewModel();
    });

    test('`getNuTheme()` run time type should be [ThemeData]', () {
      expect(
        homePresenter.getNuTheme().runtimeType,
        ThemeData,
      );
    });

    test('initial `getNuTheme()` value should be [nuDefaultTheme]', () {
      expect(
        homePresenter.getNuTheme(),
        nuDefaultTheme,
      );
    });

    test(
        '`getNuTheme()` value should be [nuDarkTheme] after set `Brightness.dark`',
        () {
      expect(
        homePresenter.getNuTheme(),
        nuDefaultTheme,
      );

      homePresenter.setNuTheme(darkIsEnable: true);

      expect(
        homePresenter.getNuTheme(),
        nuDarkTheme,
      );
    });

    test(
        '`getNuTheme()` value should be [nuDefaultTheme] after set `Brightness.dark` and then `Brightness.light`',
        () {
      expect(
        homePresenter.getNuTheme(),
        nuDefaultTheme,
      );

      homePresenter.setNuTheme(darkIsEnable: true);

      expect(
        homePresenter.getNuTheme(),
        nuDarkTheme,
      );

      homePresenter.setNuTheme(darkIsEnable: false);

      expect(
        homePresenter.getNuTheme(),
        nuDefaultTheme,
      );
    });

    test('`getNuThemeFromKey()` run time type should be [ThemeData]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT).runtimeType,
        ThemeData,
      );
    });

    test(
        '`getNuThemeFromKey()` with argument `NuThemeKeys.DEFAULT` should be [nuDefaultTheme]',
        () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT),
        nuDefaultTheme,
      );
    });

    test(
        '`getNuThemeFromKey()` with argument `NuThemeKeys.DARK` should be [nuDarkTheme]',
        () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DARK),
        nuDarkTheme,
      );
    });

    test(
        '`getNuThemeFromKey()` with argument `NuThemeKeys.CHRISTMAS` should be [nuDefaultTheme]',
        () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.CHRISTMAS),
        nuDefaultTheme,
      );
    });

    test(
        '`getNuThemeFromKey()` with argument `NuThemeKeys.CHRISTMAS_DARK` should be [nuDarkTheme]',
        () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.CHRISTMAS_DARK),
        nuDarkTheme,
      );
    });

    test('initial `getInitialPageCarousel()` value should be 0', () {
      expect(homePresenter.getInitialPageCarousel(), 0);
    });

    test('initial `getCurrentPageCarousel()` value should be 0', () {
      expect(homePresenter.getCurrentPageCarousel(), 0);
    });

    test(
        '`getCurrentPageCarousel()` value should be 1 after set new current page with 1',
        () {
      expect(homePresenter.getCurrentPageCarousel(), 0);

      homePresenter.setCurrentPageCarousel(1);

      expect(homePresenter.getCurrentPageCarousel(), 1);
    });

    test(
        '`getCurrentPageCarousel()` value should be 0 after set new current page with 0',
        () {
      expect(homePresenter.getCurrentPageCarousel(), 0);

      homePresenter.setCurrentPageCarousel(0);

      expect(homePresenter.getCurrentPageCarousel(), 0);
    });

    test(
        '`getCurrentPageCarousel()` value should be 2 after set new current page two times',
        () {
      expect(homePresenter.getCurrentPageCarousel(), 0);

      homePresenter.setCurrentPageCarousel(1);

      expect(homePresenter.getCurrentPageCarousel(), 1);

      homePresenter.setCurrentPageCarousel(2);

      expect(homePresenter.getCurrentPageCarousel(), 2);
    });

    test(
        '`getCurrentPageCarousel()` value should be 0 after set new current page two times and go back to 0',
        () {
      expect(homePresenter.getCurrentPageCarousel(), 0);

      homePresenter.setCurrentPageCarousel(1);

      expect(homePresenter.getCurrentPageCarousel(), 1);

      homePresenter.setCurrentPageCarousel(2);

      expect(homePresenter.getCurrentPageCarousel(), 2);

      homePresenter.setCurrentPageCarousel(0);

      expect(homePresenter.getCurrentPageCarousel(), 0);
    });

    test('`getNuThemeFromKey()` run time type should be [ThemeData]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT).runtimeType,
        ThemeData,
      );
    });

    test('`mapCustom()` with argument [] should be []', () {
      expect(HomePresenter.mapCustom([], () {}), []);
    });

    test(
        '`mapCustom()` with argument [1, 2, 3] and `(i, _) => (i * 2)` should be [2, 4, 6]',
        () {
      expect(
        HomePresenter.mapCustom([1, 2, 3], (key, value) => (value * 2)),
        [2, 4, 6],
      );
    });

    test('initial `getFutureValue()` value should be [balancesFutureValue]',
        () {
      expect(
        homePresenter.getFutureValue(),
        homeViewModel.balancesFutureValue,
      );
    });

    test('initial `getOpenValue()` value should be [balancesOpenValue]', () {
      expect(
        homePresenter.getOpenValue(),
        homeViewModel.balancesOpenValue,
      );
    });

    test(
        'initial `getAvailableValue()` value should be [balancesAvailableValue]',
        () {
      expect(
        homePresenter.getAvailableValue(),
        homeViewModel.balancesAvailableValue,
      );
    });

    test('initial `getDueValue()` value should be [balancesDueValue]', () {
      expect(
        homePresenter.getDueValue(),
        homeViewModel.balancesDueValue,
      );
    });

    test('initial `getFuturePercent()` value should be [balancesFuturePercent]',
        () {
      expect(
        homePresenter.getFuturePercent(),
        homeViewModel.balancesFuturePercent,
      );
    });

    test('initial `getOpenPercent()` value should be [balancesOpenPercent]',
        () {
      expect(
        homePresenter.getOpenPercent(),
        homeViewModel.balancesOpenPercent,
      );
    });

    test(
        'initial `getAvailablePercent()` value should be [balancesAvailablePercent]',
        () {
      expect(
        homePresenter.getAvailablePercent(),
        homeViewModel.balancesAvailablePercent,
      );
    });

    test('initial `getDuePercent()` value should be [balancesDuePercent]', () {
      expect(
        homePresenter.getDuePercent(),
        homeViewModel.balancesDuePercent,
      );
    });

    test('initial `getFutureFlex()` value should be [balancesFutureFlex]', () {
      expect(
        homePresenter.getFutureFlex(),
        homeViewModel.balancesFutureFlex,
      );
    });

    test('initial `getOpenFlex()` value should be [balancesOpenFlex]', () {
      expect(
        homePresenter.getOpenFlex(),
        homeViewModel.balancesOpenFlex,
      );
    });

    test('initial `getAvailableFlex()` value should be [balancesAvailableFlex]',
        () {
      expect(
        homePresenter.getAvailableFlex(),
        homeViewModel.balancesAvailableFlex,
      );
    });

    test('initial `getDueFlex()` value should be [balancesDueFlex]', () {
      expect(
        homePresenter.getDueFlex(),
        homeViewModel.balancesDueFlex,
      );
    });

    test('`calculatePercentBalances()` value return', () {
      homePresenter.calculatePercentBalances();

      expect(homePresenter.getFutureValue(), 1529.98);
      expect(homePresenter.getFutureCurrency(), r'R$' + '\u00a0' + '1.529,98');
      expect(homePresenter.getFuturePercent(), 10.199866666666667);
      expect(homePresenter.getFutureFlex(), 10);

      expect(homePresenter.getOpenValue(), 5578.79);
      expect(homePresenter.getOpenCurrency(), r'R$' + '\u00a0' + '5.578,79');
      expect(homePresenter.getOpenPercent(), 37.19193333333333);
      expect(homePresenter.getOpenFlex(), 37);

      expect(homePresenter.getAvailableValue(), 7891.23);
      expect(
        homePresenter.getAvailableCurrency(),
        r'R$' + '\u00a0' + '7.891,23',
      );
      expect(homePresenter.getAvailablePercent(), 52.6082);
      expect(homePresenter.getAvailableFlex(), 53);

      expect(homePresenter.getDueValue(), 0);
      expect(homePresenter.getDueCurrency(), 0.0);
      expect(homePresenter.getDuePercent(), 0);
      expect(homePresenter.getDueFlex(), 0);
    });

    test('`getFormattedCurrency()` value return', () {
      expect(
        homePresenter.getFormattedCurrency(r'R$' + '\u00a0' + '5.453,19'),
        [r'R$', '5.453', '19'],
      );
    });

    test('initial `getLastCardRegister()` value should be [lastCardRegister]',
        () {
      expect(
        homePresenter.getLastCardRegister(),
        homeViewModel.lastCardRegister,
      );
    });
  });
}
