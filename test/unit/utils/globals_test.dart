import 'package:test/test.dart';

import 'package:nudemo/utils/globals.dart' as globals;

void main() {
  group('[Unit -> Globals] General', () {
    test('initial value of `isLoggedIn` should be false', () {
      expect(globals.isLoggedIn, false);
    });

    test('initial value of `userUuid` should be null', () {
      expect(globals.userUuid, null);
    });

    test('initial value of `userName` should be null', () {
      expect(globals.userName, null);
    });

    test('initial value of `userNickname` should be null', () {
      expect(globals.userNickname, null);
    });

    test('initial value of `userEmail` should be null', () {
      expect(globals.userEmail, null);
    });

    test('initial value of `userPhone` should be null', () {
      expect(globals.userPhone, null);
    });

    test('initial value of `accountUuid` should be null', () {
      expect(globals.accountUuid, null);
    });

    test('initial value of `bankBranch` should be null', () {
      expect(globals.bankBranch, null);
    });

    test('initial value of `bankAccount` should be null', () {
      expect(globals.bankAccount, null);
    });

    test('initial value of `accountLimit` should be 0.0', () {
      expect(globals.accountLimit, 0.0);
    });

    test('initial value of `balancesOpenValue` should be 0.0', () {
      expect(globals.balancesOpenValue, 0.0);
    });

    test('initial value of `balancesOpenPercent` should be 0.0', () {
      expect(globals.balancesOpenPercent, 0.0);
    });

    test('initial value of `balancesOpenFlex` should be 0', () {
      expect(globals.balancesOpenFlex, 0);
    });

    test('initial value of `balancesAvailableValue` should be 0.0', () {
      expect(globals.balancesAvailableValue, 0.0);
    });

    test('initial value of `balancesAvailablePercent` should be 0.0', () {
      expect(globals.balancesAvailablePercent, 0.0);
    });

    test('initial value of `balancesAvailableFlex` should be 0', () {
      expect(globals.balancesAvailableFlex, 0);
    });

    test('initial value of `limitValue` should be equal `globals.accountLimit`',
        () {
      expect(globals.limitValue, globals.accountLimit);
    });

    test('initial value of `limitPercent` should be 100.0', () {
      expect(globals.limitPercent, 100.0);
    });

    test('initial value of `balancesFutureValue` should be 0.0', () {
      expect(globals.balancesFutureValue, 0.0);
    });

    test('initial value of `balancesFuturePercent` should be 0.0', () {
      expect(globals.balancesFuturePercent, 0.0);
    });

    test('initial value of `balancesFutureFlex` should be 0', () {
      expect(globals.balancesFutureFlex, 0);
    });

    test('initial value of `balancesDueValue` should be 0.0', () {
      expect(globals.balancesDueValue, 0.0);
    });

    test('initial value of `balancesDuePercent` should be 0.0', () {
      expect(globals.balancesDuePercent, 0.0);
    });

    test('initial value of `balancesDueFlex` should be 0', () {
      expect(globals.balancesDueFlex, 0);
    });
  });
}
