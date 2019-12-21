import 'package:test/test.dart';

import 'package:nudemo/utils/utils.dart';

void main() {
  group('[Unit -> Utils]', () {
    // Utils utils;

    setUp(() {
      // utils = Utils();
    });

    test('`mapCustom()` with argument [] should be []', () {
      expect(Utils.mapCustom([], () {}), []);
    });

    test(
        '`mapCustom()` with argument [1, 2, 3] and `(i, _) => (i * 2)` should be [2, 4, 6]',
        () {
      expect(
        Utils.mapCustom([1, 2, 3], (key, value) => (value * 2)),
        [2, 4, 6],
      );
    });
  });
}
