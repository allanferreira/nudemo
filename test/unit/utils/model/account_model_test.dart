import 'package:test/test.dart';

import 'package:nudemo/utils/model/account_model.dart';

void main() {
  group('[Unit -> Model -> Account Model - General]', () {
    Account account;
    final Account accountData = Account(
      accountId: 'c3b2a1',
      customerId: 'a1b2c3',
      bankBranch: '0001',
      bankAccount: '1234567-8',
      limit: 15000.5,
    );
    final Map<String, dynamic> accountJson = {
      'account-id': 'c3b2a1',
      'customer-id': 'a1b2c3',
      'bank-branch': '0001',
      'bank-account': '1234567-8',
      'limit': 15000.5,
    };
    final String accountJsonString =
        '{"account-id":"c3b2a1","customer-id":"a1b2c3","bank-branch":"0001","bank-account":"1234567-8","limit":15000.5}';
    final String accountsJsonString = '['
        '{"account-id":"c3b2a1","customer-id":"a1b2c3","bank-branch":"0001","bank-account":"1234567-8","limit":15000.5},'
        '{"account-id":"c3b2a1d4e5","customer-id":"a1b2c3d5e5","bank-branch":"0001","bank-account":"7654321-0","limit":3400.5}'
        ']';

    setUp(() {
      account = Account();
    });

    test('initial value of `accountId` should be null', () {
      expect(account.accountId, null);
    });

    test('initial value of `customerId` should be null', () {
      expect(account.customerId, null);
    });

    test('initial value of `bank-branch` should be null', () {
      expect(account.bankBranch, null);
    });

    test('initial value of `bankAccount` should be null', () {
      expect(account.bankAccount, null);
    });

    test('initial value of `limit` should be null', () {
      expect(account.limit, null);
    });

    test('initiate class with data', () {
      expect(accountData.accountId, 'c3b2a1');
      expect(accountData.customerId, 'a1b2c3');
      expect(accountData.bankBranch, '0001');
      expect(accountData.bankAccount, '1234567-8');
      expect(accountData.limit, 15000.5);
    });

    test('initiate class null and then change the data', () {
      expect(account.accountId, null);
      expect(account.customerId, null);
      expect(account.bankBranch, null);
      expect(account.bankAccount, null);
      expect(account.limit, null);

      account = Account(
        accountId: 'c3b2a1',
        customerId: 'a1b2c3',
        bankBranch: '0001',
        bankAccount: '1234567-8',
        limit: 15000.5,
      );

      expect(account.accountId, 'c3b2a1');
      expect(account.customerId, 'a1b2c3');
      expect(account.bankBranch, '0001');
      expect(account.bankAccount, '1234567-8');
      expect(account.limit, 15000.5);
    });

    test('check value of `Account.fromJson()`', () {
      Account newAccount = Account.fromJson(accountJson);

      expect(newAccount.accountId, 'c3b2a1');
      expect(newAccount.customerId, 'a1b2c3');
      expect(newAccount.bankBranch, '0001');
      expect(newAccount.bankAccount, '1234567-8');
      expect(newAccount.limit, 15000.5);
    });

    test('check value of `toJson()`', () {
      Map<String, dynamic> jsonData = accountData.toJson();

      expect(jsonData, accountJson);
    });

    test('check value of `accountFromJson()`', () {
      Account newAccount = accountFromJson(accountJsonString);

      expect(newAccount.accountId, 'c3b2a1');
      expect(newAccount.customerId, 'a1b2c3');
      expect(newAccount.bankBranch, '0001');
      expect(newAccount.bankAccount, '1234567-8');
      expect(newAccount.limit, 15000.5);
    });

    test('check value of `accountToJson()`', () {
      String jsonData = accountToJson(accountData);

      expect(jsonData, accountJsonString);
    });

    test('check value of `allAccountsFromJson()`', () {
      List<Account> newAccount = allAccountsFromJson(accountsJsonString);

      expect(newAccount[0].accountId, 'c3b2a1');
      expect(newAccount[0].customerId, 'a1b2c3');
      expect(newAccount[0].bankBranch, '0001');
      expect(newAccount[0].bankAccount, '1234567-8');
      expect(newAccount[0].limit, 15000.5);

      expect(newAccount[1].accountId, 'c3b2a1d4e5');
      expect(newAccount[1].customerId, 'a1b2c3d5e5');
      expect(newAccount[1].bankBranch, '0001');
      expect(newAccount[1].bankAccount, '7654321-0');
      expect(newAccount[1].limit, 3400.5);
    });

    test('check value of `allAccountsToJson()`', () {
      String jsonData = allAccountsToJson([
        accountData,
        Account(
          accountId: 'c3b2a1d4e5',
          customerId: 'a1b2c3d5e5',
          bankBranch: '0001',
          bankAccount: '7654321-0',
          limit: 3400.5,
        ),
      ]);

      expect(jsonData, accountsJsonString);
    });
  });
}
