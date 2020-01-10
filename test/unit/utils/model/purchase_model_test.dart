import 'dart:convert';

import 'package:test/test.dart';

import 'package:nudemo/utils/model/purchase_model.dart';

void main() {
  group('[Unit -> Model -> Purchase, Origin and Balance Model] General', () {
    Purchase purchase;
    Origin origin;
    Balance balance;

    final Balance balanceData = Balance(
      balance: 15000.5,
    );
    final Origin originData = Origin(
      code: 2,
      name: 'shopping online',
    );
    final Origin originData2 = Origin(
      code: 1,
      name: 'shopping',
    );
    final Purchase purchaseData = Purchase(
      purchaseId: 'c3b2a1',
      accountId: 'a1b2c3',
      type: 'expense',
      value: 124.9,
      date: DateTime.parse('2019-11-03T21:36:27.000Z'),
      origin: originData,
      tag: ['footwear'],
    );
    final Map<String, dynamic> purchaseJson = {
      'purchase-id': 'c3b2a1',
      'account-id': 'a1b2c3',
      'type': 'expense',
      'value': 124.9,
      'date': '2019-11-03T21:36:27.000Z',
      'origin': {
        'code': 2,
        'name': 'shopping online',
      },
      'tag': ['footwear'],
    };
    final String purchaseJsonString =
        '{"purchase-id":"c3b2a1","account-id":"a1b2c3","type":"expense","value":124.9,"date":"2019-11-03T21:36:27.000Z","origin":{"code":2,"name":"shopping online"},"tag":["footwear"]}';
    final String purchasesJsonString = '['
        '{"purchase-id":"c3b2a1","account-id":"a1b2c3","type":"expense","value":124.9,"date":"2019-11-03T21:36:27.000Z","origin":{"code":2,"name":"shopping online"},"tag":["footwear"]},'
        '{"purchase-id":"c3b2a1d4e5","account-id":"a1b2c3d5e5","type":"income","value":459.99,"date":"2019-11-05T14:45:01.000Z","origin":{"code":1,"name":"shopping"},"tag":["furniture","kitchen"]}'
        ']';
    final Map<String, dynamic> originJson = {
      'code': 2,
      'name': 'shopping online',
    };
    final Map<String, dynamic> balanceJson = {
      'balance': 15000.5,
    };
    final String balanceJsonString = '{"balance":15000.5}';

    setUp(() {
      purchase = Purchase();
      origin = Origin();
      balance = Balance();
    });

    test('initial value of `purchaseId` should be null', () {
      expect(purchase.purchaseId, null);
    });

    test('initial value of `accountId` should be null', () {
      expect(purchase.accountId, null);
    });

    test('initial value of `type` should be null', () {
      expect(purchase.type, null);
    });

    test('initial value of `value` should be null', () {
      expect(purchase.value, null);
    });

    test('initial value of `date` should be null', () {
      expect(purchase.date, null);
    });

    test('initial value of `origin` should be null', () {
      expect(purchase.origin, null);
    });

    test('initial value of `tag` should be null', () {
      expect(purchase.tag, null);
    });

    test('initial value of `code` should be null', () {
      expect(origin.code, null);
    });

    test('initial value of `name` should be null', () {
      expect(origin.name, null);
    });

    test('initial value of `balance` should be null', () {
      expect(balance.balance, null);
    });

    test('initiate Purchase class with data', () {
      expect(purchaseData.purchaseId, 'c3b2a1');
      expect(purchaseData.accountId, 'a1b2c3');
      expect(purchaseData.type, 'expense');
      expect(purchaseData.value, 124.9);
      expect(purchaseData.date, DateTime.parse('2019-11-03T21:36:27.000Z'));
      expect(purchaseData.origin.code, originData.code);
      expect(purchaseData.origin.name, originData.name);
      expect(purchaseData.tag, ['footwear']);
    });

    test('initiate Origin class with data', () {
      expect(originData.code, 2);
      expect(originData.name, 'shopping online');
    });

    test('initiate Balance class with data', () {
      expect(balanceData.balance, 15000.5);
    });

    test('initiate Purchase class null and then change the data', () {
      expect(purchase.purchaseId, null);
      expect(purchase.accountId, null);
      expect(purchase.type, null);
      expect(purchase.value, null);
      expect(purchase.date, null);
      expect(purchase.origin, null);
      expect(purchase.tag, null);

      purchase = Purchase(
        purchaseId: 'c3b2a1',
        accountId: 'a1b2c3',
        type: 'expense',
        value: 124.9,
        date: DateTime.parse('2019-11-03T21:36:27.000Z'),
        origin: originData,
        tag: ['footwear'],
      );

      expect(purchase.purchaseId, 'c3b2a1');
      expect(purchase.accountId, 'a1b2c3');
      expect(purchase.type, 'expense');
      expect(purchase.value, 124.9);
      expect(purchase.date, DateTime.parse('2019-11-03T21:36:27.000Z'));
      expect(purchase.origin.code, originData.code);
      expect(purchase.origin.name, originData.name);
      expect(purchase.tag, ['footwear']);
    });

    test('check value of `Purchase.fromJson()`', () {
      Purchase newPurchase = Purchase.fromJson(purchaseJson);

      expect(newPurchase.purchaseId, 'c3b2a1');
      expect(newPurchase.accountId, 'a1b2c3');
      expect(newPurchase.type, 'expense');
      expect(newPurchase.value, 124.9);
      expect(newPurchase.date, DateTime.parse('2019-11-03T21:36:27.000Z'));
      expect(newPurchase.origin.code, originData.code);
      expect(newPurchase.origin.name, originData.name);
      expect(newPurchase.tag, ['footwear']);
    });

    test('check value of `Purchase.toJson()`', () {
      Map<String, dynamic> jsonData = purchaseData.toJson();

      expect(jsonData, purchaseJson);
    });

    test('check value of `Balance.fromJson()`', () {
      Balance newBalance = Balance.fromJson(balanceJson);

      expect(newBalance.balance, 15000.5);
    });

    test('check value of `Balance.toJson()`', () {
      Map<String, dynamic> jsonData = balanceData.toJson();

      expect(jsonData, balanceJson);
    });

    test('check value of `Origin.fromJson()`', () {
      Origin newOrigin = Origin.fromJson(originJson);

      expect(newOrigin.code, 2);
      expect(newOrigin.name, 'shopping online');
    });

    test('check value of `Origin.toJson()`', () {
      Map<String, dynamic> jsonData = originData.toJson();

      expect(jsonData, originJson);
    });

    test('check value of `purchaseFromJson()`', () {
      Purchase newPurchase = purchaseFromJson(purchaseJsonString);

      expect(newPurchase.purchaseId, 'c3b2a1');
      expect(newPurchase.accountId, 'a1b2c3');
      expect(newPurchase.type, 'expense');
      expect(newPurchase.value, 124.9);
      expect(newPurchase.date, DateTime.parse('2019-11-03T21:36:27.000Z'));
      expect(newPurchase.origin.code, originData.code);
      expect(newPurchase.origin.name, originData.name);
      expect(newPurchase.tag, ['footwear']);
    });

    test('check value of `purchaseToJson()`', () {
      String jsonData = purchaseToJson(purchaseData);

      expect(jsonData, purchaseJsonString);
    });

    test('check value of `balanceFromJson()`', () {
      Balance newBalance = balanceFromJson(balanceJsonString);

      expect(newBalance.balance, 15000.5);
    });

    test('check value of `balanceToJson()`', () {
      String jsonData = balanceToJson(balanceData);

      expect(jsonData, balanceJsonString);
    });

    test('check value of `allPurchasesFromJson()`', () {
      List<Purchase> newPurchase = allPurchasesFromJson(purchasesJsonString);

      expect(newPurchase[0].purchaseId, 'c3b2a1');
      expect(newPurchase[0].accountId, 'a1b2c3');
      expect(newPurchase[0].type, 'expense');
      expect(newPurchase[0].value, 124.9);
      expect(newPurchase[0].date, DateTime.parse('2019-11-03T21:36:27.000Z'));
      expect(newPurchase[0].origin.code, originData.code);
      expect(newPurchase[0].origin.name, originData.name);
      expect(newPurchase[0].tag, ['footwear']);

      expect(newPurchase[1].purchaseId, 'c3b2a1d4e5');
      expect(newPurchase[1].accountId, 'a1b2c3d5e5');
      expect(newPurchase[1].type, 'income');
      expect(newPurchase[1].value, 459.99);
      expect(newPurchase[1].date, DateTime.parse('2019-11-05T14:45:01.000Z'));
      expect(newPurchase[1].origin.code, originData2.code);
      expect(newPurchase[1].origin.name, originData2.name);
      expect(newPurchase[1].tag, ['furniture', 'kitchen']);
    });

    test('check value of `allPurchasesFromMapList()`', () {
      List<Purchase> newPurchase = allPurchasesFromMapList(
        json.decode(purchasesJsonString),
      );

      expect(newPurchase[0].purchaseId, 'c3b2a1');
      expect(newPurchase[0].accountId, 'a1b2c3');
      expect(newPurchase[0].type, 'expense');
      expect(newPurchase[0].value, 124.9);
      expect(newPurchase[0].date, DateTime.parse('2019-11-03T21:36:27.000Z'));
      expect(newPurchase[0].origin.code, originData.code);
      expect(newPurchase[0].origin.name, originData.name);
      expect(newPurchase[0].tag, ['footwear']);

      expect(newPurchase[1].purchaseId, 'c3b2a1d4e5');
      expect(newPurchase[1].accountId, 'a1b2c3d5e5');
      expect(newPurchase[1].type, 'income');
      expect(newPurchase[1].value, 459.99);
      expect(newPurchase[1].date, DateTime.parse('2019-11-05T14:45:01.000Z'));
      expect(newPurchase[1].origin.code, originData2.code);
      expect(newPurchase[1].origin.name, originData2.name);
      expect(newPurchase[1].tag, ['furniture', 'kitchen']);
    });

    test('check value of `allPurchasesToJson()`', () {
      String jsonData = allPurchasesToJson([
        purchaseData,
        Purchase(
          purchaseId: 'c3b2a1d4e5',
          accountId: 'a1b2c3d5e5',
          type: 'income',
          value: 459.99,
          date: DateTime.parse('2019-11-05T14:45:01.000Z'),
          origin: originData2,
          tag: ['furniture', 'kitchen'],
        ),
      ]);

      expect(jsonData, purchasesJsonString);
    });
  });
}
