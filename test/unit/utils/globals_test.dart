import 'package:test/test.dart';

import 'package:nudemo/utils/globals.dart' as globals;

void main() {
  group('[Unit -> Globals] General', () {
    test('initial value of `isLoggedIn` should be false', () {
      expect(globals.isLoggedIn, false);
    });

    test('the changed value of `isLoggedIn` should be true', () {
      expect(globals.isLoggedIn, false);

      globals.isLoggedIn = true;

      expect(globals.isLoggedIn, true);
    });
  });
}
