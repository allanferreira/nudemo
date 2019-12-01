import 'package:test/test.dart';

import 'package:nudemo/themes/theme.dart';

void main() {
  group('[Unit -> Routes]', () {
    NuThemes nuThemes;

    setUp(() {
      nuThemes = NuThemes();
    });

    test('check theme by key [NuThemeKeys.DEFAULT]', () {
      expect(nuThemes.getThemeFromKey(NuThemeKeys.DEFAULT),
          NuThemes().defaultTheme);
    });

    test('check theme by key [NuThemeKeys.DARK]', () {
      expect(nuThemes.getThemeFromKey(NuThemeKeys.DARK), NuThemes().darkTheme);
    });

    test('check theme by key [NuThemeKeys.CHISTMAS]', () {
      expect(nuThemes.getThemeFromKey(NuThemeKeys.CHISTMAS),
          NuThemes().defaultTheme);
    });

    test('check theme by key [NuThemeKeys.CHISTMAS_DARK]', () {
      expect(nuThemes.getThemeFromKey(NuThemeKeys.CHISTMAS_DARK),
          NuThemes().darkTheme);
    });
  });
}
