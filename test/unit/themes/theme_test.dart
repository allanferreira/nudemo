import 'package:test/test.dart';

import 'package:nudemo/themes/nu_default_theme.dart';
import 'package:nudemo/themes/nu_dark_theme.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/viewmodel/home_viewmodel.dart';

void main() {
  group('[Unit -> Routes]', () {
    HomePresenter homePresenter;

    setUp(() {
      homePresenter = HomePresenter();
    });

    test('initial theme should be light [nuDefaultTheme]', () {
      expect(homePresenter.getNuTheme(), nuDefaultTheme);
    });

    test('set dark theme [nuDarkTheme]', () {
      expect(homePresenter.getNuTheme(), nuDefaultTheme);

      homePresenter.setNuTheme(darkIsEnable: true);

      expect(homePresenter.getNuTheme(), nuDarkTheme);
    });

    test('check theme by key [NuThemeKeys.DEFAULT]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT),
        nuDefaultTheme,
      );
    });

    test('check theme by key [NuThemeKeys.DARK]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DARK),
        nuDarkTheme,
      );
    });

    test('check theme by key [NuThemeKeys.CHISTMAS]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.CHRISTMAS),
        nuDefaultTheme,
      );
    });

    test('check theme by key [NuThemeKeys.CHISTMAS_DARK]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.CHRISTMAS_DARK),
        nuDarkTheme,
      );
    });
  });
}
