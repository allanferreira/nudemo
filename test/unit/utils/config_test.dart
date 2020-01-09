import 'package:test/test.dart';

import 'package:nudemo/utils/config.dart';

void main() {
  group('[Unit -> Config] General', () {
    Config config;

    setUp(() {
      config = Config();
    });

    test('`version` should be 1.0.1', () {
      expect(Config.version, '1.0.1');
    });

    test('initial value of `userUuid` should be null', () {
      expect(config.userUuid, null);
    });

    test('the changed value of `userUuid` should be "a1b2c3d4e5"', () {
      expect(config.userUuid, null);

      config.userUuid = "a1b2c3d4e5";

      expect(config.userUuid, "a1b2c3d4e5");
    });

    test('the changed value of `userUuid` should be "a1b2c3d4e5" for twice',
        () {
      expect(config.userUuid, null);

      config.userUuid = "a1b2c3d4e5";

      expect(config.userUuid, "a1b2c3d4e5");

      config.userUuid = "a1b2c3d4e5";

      expect(config.userUuid, "a1b2c3d4e5");
    });

    test('initial value of `userName` should be "Chinnon Santos"', () {
      expect(config.userName, 'Chinnon Santos');
    });

    test('the changed value of `userName` should be "Chinnon S."', () {
      expect(config.userName, 'Chinnon Santos');

      config.userName = "Chinnon S.";

      expect(config.userName, 'Chinnon S.');
    });

    test('the changed value of `userName` should be "Chinnon S." for twice',
        () {
      expect(config.userName, 'Chinnon Santos');

      config.userName = "Chinnon S.";

      expect(config.userName, 'Chinnon S.');

      config.userName = "Chinnon S.";

      expect(config.userName, 'Chinnon S.');
    });

    test('initial value of `userNickname` should be "Chinnon"', () {
      expect(config.userNickname, 'Chinnon');
    });

    test('the changed value of `userNickname` should be "Shin"', () {
      expect(config.userNickname, 'Chinnon');

      config.userNickname = "Shin";

      expect(config.userNickname, 'Shin');
    });

    test('the changed value of `userNickname` should be "Shin" for twice', () {
      expect(config.userNickname, 'Chinnon');

      config.userNickname = "Shin";

      expect(config.userNickname, 'Shin');

      config.userNickname = "Shin";

      expect(config.userNickname, 'Shin');
    });

    test('initial value of `userEmail` should be "chinnonsantos@gmail.com"',
        () {
      expect(config.userEmail, 'chinnonsantos@gmail.com');
    });

    test(
        'the changed value of `userEmail` should be "contato@chinnonsantos.com.br"',
        () {
      expect(config.userEmail, 'chinnonsantos@gmail.com');

      config.userEmail = "contato@chinnonsantos.com.br";

      expect(config.userEmail, 'contato@chinnonsantos.com.br');
    });

    test(
        'the changed value of `userEmail` should be "contato@chinnonsantos.com.br" for twice',
        () {
      expect(config.userEmail, 'chinnonsantos@gmail.com');

      config.userEmail = "contato@chinnonsantos.com.br";

      expect(config.userEmail, 'contato@chinnonsantos.com.br');
    });

    test('initial value of `userPhone` should be "11987654321"', () {
      expect(config.userPhone, '11987654321');
    });

    test('the changed value of `userPhone` should be "11999999999"', () {
      expect(config.userPhone, '11987654321');

      config.userPhone = '11999999999';

      expect(config.userPhone, '11999999999');
    });

    test('the changed value of `userPhone` should be "11999999999" for twice',
        () {
      expect(config.userPhone, '11987654321');

      config.userPhone = '11999999999';

      expect(config.userPhone, '11999999999');

      config.userPhone = '11999999999';

      expect(config.userPhone, '11999999999');
    });

    test('initial value of `accountUuid` should be null', () {
      expect(config.accountUuid, null);
    });

    test('the changed value of `accountUuid` should be "a1b2c3d4e5"', () {
      expect(config.accountUuid, null);

      config.accountUuid = "a1b2c3d4e5";

      expect(config.accountUuid, "a1b2c3d4e5");
    });

    test('initial value of `bankBranch` should be "0001"', () {
      expect(config.bankBranch, '0001');
    });

    test('the changed value of `bankBranch` should be "0002"', () {
      expect(config.bankBranch, '0001');

      config.bankBranch = "0002";

      expect(config.bankBranch, '0002');
    });

    test('the changed value of `bankBranch` should be "0002" for twice', () {
      expect(config.bankBranch, '0001');

      config.bankBranch = "0002";

      expect(config.bankBranch, '0002');

      config.bankBranch = "0002";

      expect(config.bankBranch, '0002');
    });

    test('initial value of `bankAccount` should be "1234567-8"', () {
      expect(config.bankAccount, '1234567-8');
    });

    test('the changed value of `bankAccount` should be "8765432-1"', () {
      expect(config.bankAccount, '1234567-8');

      config.bankAccount = "8765432-1";

      expect(config.bankAccount, '8765432-1');
    });

    test('the changed value of `bankAccount` should be "8765432-1" for twice',
        () {
      expect(config.bankAccount, '1234567-8');

      config.bankAccount = "8765432-1";

      expect(config.bankAccount, '8765432-1');

      config.bankAccount = "8765432-1";

      expect(config.bankAccount, '8765432-1');
    });

    test('initial value of `accountLimit` should be 15000.5', () {
      expect(config.accountLimit, 15000.5);
    });

    test('the changed value of `accountLimit` should be 18000', () {
      expect(config.accountLimit, 15000.5);

      config.accountLimit = 18000;

      expect(config.accountLimit, 18000);
    });

    test('the changed value of `accountLimit` should be 18000 for twice', () {
      expect(config.accountLimit, 15000.5);

      config.accountLimit = 18000;

      expect(config.accountLimit, 18000);

      config.accountLimit = 18000;

      expect(config.accountLimit, 18000);
    });

    test('the `balancesOpenValue` run time type should be [double]', () {
      expect(config.balancesOpenValue.runtimeType, double);
    });

    test('initial `balancesOpenValue` value should be 5578.79', () {
      expect(config.balancesOpenValue, 5578.79);
    });

    test('initial `balancesOpenPercent` value should be 37.19069364354522', () {
      expect(config.balancesOpenPercent, 37.19069364354522);
    });

    test('initial `balancesOpenFlex` value should be 37', () {
      expect(config.balancesOpenFlex, 37);
    });

    test('the `balancesAvailableValue` run time type should be [double]', () {
      expect(config.balancesAvailableValue.runtimeType, double);
    });

    test('initial `balancesAvailableValue` value should be 9421.71', () {
      expect(config.balancesAvailableValue, 9421.71);
    });

    test(
        'initial `balancesAvailablePercent` value should be 62.809306356454776',
        () {
      expect(config.balancesAvailablePercent, 62.809306356454776);
    });

    test('initial `balancesAvailableFlex` value should be 63', () {
      expect(config.balancesAvailableFlex, 63);
    });
  });

  group('[Unit -> Config] Customer EndPoint', () {
    final int _customerPort = 9000;
    final String _customerIpDns = "http://192.168.0.104";
    final String _customerEndPoint = _customerIpDns + ":$_customerPort/";

    test('`customerEndPoint` should be "$_customerEndPoint"', () {
      expect(Config.customerEndPoint, _customerEndPoint);
    });

    test('`customerListEndPoint` should be ..."customer/"', () {
      expect(Config.customerListEndPoint, _customerEndPoint + "customer/");
    });

    test('`customerInfoEndPoint()` should be ..."customer/:customer-id/"', () {
      expect(Config.customerInfoEndPoint(),
          _customerEndPoint + "customer/:customer-id/");
    });

    test(
        '`customerInfoEndPoint(customerId: "a1b2c3")` should be ..."customer/a1b2c3/"',
        () {
      expect(Config.customerInfoEndPoint(customerId: "a1b2c3"),
          _customerEndPoint + "customer/a1b2c3/");
    });

    test('`customerRegisterEndPoint` should be ..."customer/"', () {
      expect(Config.customerRegisterEndPoint, _customerEndPoint + "customer/");
    });
  });

  group('[Unit -> Config] Account EndPoint', () {
    final int _accountPort = 9001;
    final String _accountIpDns = "http://192.168.0.104";
    final String _accountEndPoint = _accountIpDns + ":$_accountPort/";

    test('`accountEndPoint` should be "$_accountEndPoint"', () {
      expect(Config.accountEndPoint, _accountEndPoint);
    });

    test('`accountListEndPoint` should be ..."account/"', () {
      expect(Config.accountListEndPoint, _accountEndPoint + "account/");
    });

    test('`accountInfoEndPoint()` should be ..."account/:account-id/"', () {
      expect(Config.accountInfoEndPoint(),
          _accountEndPoint + "account/:account-id/");
    });

    test(
        '`accountInfoEndPoint(accountId: "a1b2c3")` should be ..."account/a1b2c3/"',
        () {
      expect(Config.accountInfoEndPoint(accountId: "a1b2c3"),
          _accountEndPoint + "account/a1b2c3/");
    });

    test(
        '`accountInfoByCustomer()` should be ..."account/from-customer/:customer-id/"',
        () {
      expect(Config.accountInfoByCustomer(),
          _accountEndPoint + "account/from-customer/:customer-id/");
    });

    test(
        '`accountInfoByCustomer(customerId: "a1b2c3")` should be ..."account/from-customer/a1b2c3/"',
        () {
      expect(Config.accountInfoByCustomer(customerId: "a1b2c3"),
          _accountEndPoint + "account/from-customer/a1b2c3/");
    });

    test('`accountRegisterEndPoint` should be ..."account/"', () {
      expect(Config.accountRegisterEndPoint, _accountEndPoint + "account/");
    });
  });

  group('[Unit -> Config] Purchase EndPoint', () {
    final int _purchasePort = 9002;
    final String _purchaseIpDns = "http://192.168.0.104";
    final String _purchaseEndPoint = _purchaseIpDns + ":$_purchasePort/";

    test('`purchaseEndPoint` should be "$_purchaseEndPoint"', () {
      expect(Config.purchaseEndPoint, _purchaseEndPoint);
    });

    test('`purchaseBalanceEndPoint()` should be ..."balance/:account-id/"', () {
      expect(Config.purchaseBalanceEndPoint(),
          _purchaseEndPoint + "balance/:account-id/");
    });

    test(
        '`purchaseListEndPoint()` should be ..."purchase/from-account/:account-id/"',
        () {
      expect(Config.purchaseListEndPoint(),
          _purchaseEndPoint + "purchase/from-account/:account-id/");
    });

    test(
        '`purchaseListEndPoint(accountId: "a1b2c3")` should be ..."purchase/from-account/a1b2c3/"',
        () {
      expect(Config.purchaseListEndPoint(accountId: "a1b2c3"),
          _purchaseEndPoint + "purchase/from-account/a1b2c3/");
    });

    test(
        '`purchaseListEndPoint(accountId: "a1b2c3", tags: ["footwear", "furniture"])` should be ..."purchase/from-account/a1b2c3/"',
        () {
      expect(
          Config.purchaseListEndPoint(
              accountId: "a1b2c3", tags: ['footwear', 'furniture']),
          _purchaseEndPoint +
              "purchase/from-account/a1b2c3/?tag=footwear&tag=furniture");
    });

    test('`purchaseInfoEndPoint()` should be ..."purchase/:purchase-id/"', () {
      expect(Config.purchaseInfoEndPoint(),
          _purchaseEndPoint + "purchase/:purchase-id/");
    });

    test(
        '`purchaseInfoEndPoint(purchaseId: "a1b2c3")` should be ..."purchase/a1b2c3/"',
        () {
      expect(Config.purchaseInfoEndPoint(purchaseId: "a1b2c3"),
          _purchaseEndPoint + "purchase/a1b2c3/");
    });

    test('`purchaseRegisterEndPoint` should be ..."purchase/"', () {
      expect(Config.purchaseRegisterEndPoint, _purchaseEndPoint + "purchase/");
    });
  });
}
