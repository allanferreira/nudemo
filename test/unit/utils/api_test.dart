import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/api.dart';
import 'package:nudemo/utils/model/customer_model.dart';
import 'package:nudemo/utils/model/account_model.dart';
import 'package:nudemo/utils/model/purchase_model.dart';

/// Create a `MockClient` using the `Mock` class provided by the Mockito package.
/// Create new `instances` of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  MockClient client;
  Api utilsApi;
  final Duration timeRequest = const Duration(milliseconds: 5);
  final String testEndPoint = "http://localhost:3000/";
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  final http.Response checkResOk = http.Response(
    '{"message":"Alive!"}',
    200,
    headers: requestHeaders,
  );
  final http.Response checkResBad = http.Response(
    '{"message":"Not Found"}',
    404,
    headers: requestHeaders,
  );

  /// Mock of [Customer API]
  final String customerIdMock = 'a1b2c3';
  final String customerDataSend =
      '{"name":"Chinnon Santos","e-mail":"chinnonsantos@gmail.com","phone":"11987654321"}';
  final String customerDataReturn =
      '{"customer-id":"$customerIdMock","name":"Chinnon Santos","e-mail":"chinnonsantos@gmail.com","phone":"11987654321"}';
  final http.Response customerRegResponseOk = http.Response(
    customerDataReturn,
    201,
    headers: requestHeaders,
  );
  final http.Response customerRegResponseBad = http.Response(
    '{"message":"Unprocessable Entity"}',
    422,
    headers: requestHeaders,
  );
  final Customer newCustomer = Customer(
    name: "Chinnon Santos",
    eMail: "chinnonsantos@gmail.com",
    phone: "11987654321",
  );

  /// Mock of [Account API]
  final String accountIdMock = 'a1b2c3d4e5';
  final String accountDataReturn =
      '{"account-id":"$accountIdMock","customer-id":"$customerIdMock","bank-branch":"0001","bank-account":"1234567-8","limit":15000.5}';
  final http.Response accountRegResponseOk = http.Response(
    accountDataReturn,
    201,
    headers: requestHeaders,
  );
  final http.Response accountRegResponseBad = customerRegResponseBad;
  final Account newAccount = Account(
    customerId: customerIdMock,
    bankBranch: '0001',
    bankAccount: '1234567-8',
    limit: 15000.5,
  );

  /// Mock of [Purchase API]
  final String purchaseIdMock = 'c3b2a1';
  final List<String> tagsMock = ['footwear'];
  final String purchaseDataReturn =
      '{"purchase-id":"$purchaseIdMock","account-id":"$accountIdMock","type":"expense","value":124.9,"date":"2019-11-03T21:36:27.000Z","origin":{"code":2,"name":"shopping online"},"tag":["footwear"]}';
  final http.Response purchaseRegResponseOk = http.Response(
    purchaseDataReturn,
    201,
    headers: requestHeaders,
  );
  final String purchaseListDataReturn =
      '[{"purchase-id":"$purchaseIdMock","account-id":"$accountIdMock","type":"expense","value":124.9,"date":"2019-11-03T21:36:27.000Z","origin":{"code":2,"name":"shopping online"},"tag":["footwear"]}]';
  final http.Response purchaseListResponseOk = http.Response(
    purchaseListDataReturn,
    200,
    headers: requestHeaders,
  );
  final http.Response purchaseRegResponseBad = customerRegResponseBad;
  final Origin originData = Origin(
    code: 2,
    name: 'shopping online',
  );
  final Purchase newPurchase = Purchase(
    accountId: accountIdMock,
    type: 'expense',
    value: 124.9,
    date: DateTime.parse('2019-11-03T21:36:27.000Z'),
    origin: originData,
    tag: ['footwear'],
  );
  final String balanceDataReturn = '{"balance":0}';
  final http.Response balanceRegResponseOk = http.Response(
    balanceDataReturn,
    200,
    headers: requestHeaders,
  );

  setUp(() {
    client = MockClient();
    utilsApi = Api();
  });

  group('[Unit -> Api] General', () {
    test(
        'check returns type of `loadDataFromAPI()` if the http call completes successfully',
        () async {
      /// Use [Mockito] to return a successful response when it calls the
      /// provided [http.Client].
      when(client.get(testEndPoint, headers: requestHeaders)).thenAnswer(
          (_) async => Future.delayed(timeRequest, () => checkResOk));

      // There is no stackoverflow for this, I needed to do several
      // tests in various ways until I can mock it...
      // .thenAnswer((_) => {
      //       "statusCode": 200,
      //       "body": {"message": "Alive!"},
      //     });
      // .thenAnswer((_) async => Future.delayed(
      //     Duration(seconds: 1),
      //     () => http.Response('{"message":"Alive!"}', 200)));
      // .thenAnswer((_) async => Future.delayed(
      //     Duration(seconds: 1),
      //     () => {
      //           "statusCode": 200,
      //           "body": {"message": "Alive!"},
      //         }));
      // .thenAnswer((_) async => {
      //       "statusCode": 200,
      //       "body": {"message": "Alive!"},
      //     });

      expect(
        await utilsApi.loadDataFromAPI(
          httpClient: client,
          endPoint: testEndPoint,
        ),
        const TypeMatcher<Map<String, dynamic>>(),
      );
    });

    test(
        'check returns value of `loadDataFromAPI()` if the http call completes successfully',
        () async {
      when(client.get(testEndPoint, headers: requestHeaders)).thenAnswer(
          (_) async => Future.delayed(timeRequest, () => checkResOk));

      expect(
        await utilsApi.loadDataFromAPI(
          httpClient: client,
          endPoint: testEndPoint,
        ),
        {
          'statusCode': 200,
          'body': {'message': 'Alive!'}
        },
      );
    });

    test(
        'check returns value of `loadDataFromAPI()` with the invalid http endpoint call',
        () async {
      when(client.get('$testEndPoint' 'invalid/', headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResBad));

      expect(
        await utilsApi.loadDataFromAPI(
          httpClient: client,
          endPoint: '$testEndPoint' 'invalid/',
        ),
        {
          'statusCode': 404,
          'body': {'message': 'Not Found'}
        },
      );
    });

    test(
        'throws an exception of `loadDataFromAPI()` if the http call completes with an error',
        () async {
      when(client.get('http://invalidendpoint/'))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => null));

      expect(
        await utilsApi.loadDataFromAPI(
          httpClient: client,
          endPoint: 'http://invalidendpoint/',
        ),
        null,
      );
    });

    test(
        'check returns type of `sendDataToAPI()` if the http call completes successfully',
        () async {
      /// Use [Mockito] to return a successful response when it calls the
      /// provided [http.Client].
      when(client.post(testEndPoint,
              body: customerDataSend, headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseOk));

      expect(
        await utilsApi.sendDataToAPI(
          httpClient: client,
          endPoint: testEndPoint,
          data: customerDataSend,
        ),
        const TypeMatcher<Map<String, dynamic>>(),
      );
    });

    test(
        'check returns value of `sendDataToAPI()` if the http call completes successfully',
        () async {
      when(client.post(testEndPoint,
              body: customerDataSend, headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseOk));

      expect(
        await utilsApi.sendDataToAPI(
          httpClient: client,
          endPoint: testEndPoint,
          data: customerDataSend,
        ),
        {
          'statusCode': 201,
          'body': {
            'customer-id': customerIdMock,
            'name': 'Chinnon Santos',
            'e-mail': 'chinnonsantos@gmail.com',
            'phone': '11987654321'
          },
        },
      );
    });

    test('check returns value of `sendDataToAPI()` with invalid data sent',
        () async {
      when(client.post(testEndPoint, body: '', headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseBad));

      expect(
        await utilsApi.sendDataToAPI(
          httpClient: client,
          endPoint: testEndPoint,
          data: '',
        ),
        {
          'statusCode': 422,
          'body': {'message': 'Unprocessable Entity'}
        },
      );
    });

    test(
        'check returns value of `sendDataToAPI()` with the invalid http endpoint call',
        () async {
      when(client.post('$testEndPoint' 'invalid/',
              body: customerDataSend, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResBad));

      expect(
        await utilsApi.sendDataToAPI(
          httpClient: client,
          endPoint: '$testEndPoint' 'invalid/',
          data: customerDataSend,
        ),
        {
          'statusCode': 404,
          'body': {'message': 'Not Found'}
        },
      );
    });

    test(
        'throws an exception of `sendDataToAPI()` if the http call completes with an error',
        () async {
      when(client.post('http://invalidendpoint/'))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => null));

      expect(
        await utilsApi.sendDataToAPI(
          httpClient: client,
          endPoint: 'http://invalidendpoint/',
          data: customerDataSend,
        ),
        null,
      );
    });
  });

  group('[Unit -> Api] Customer API', () {
    test(
        'check returns value of `checkHealthCustomerApi()` if the http call completes successfully',
        () async {
      when(client.get(Config.customerEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResOk));

      expect(await utilsApi.checkHealthCustomerApi(httpClient: client), true);
    });

    test(
        'check returns value of `checkHealthCustomerApi()` if the http call completes with an error',
        () async {
      when(client.get(Config.customerEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResBad));

      expect(await utilsApi.checkHealthCustomerApi(httpClient: client), false);
    });

    test(
        'check returns type of `createCustomerApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.customerRegisterEndPoint,
              body: customerToJson(newCustomer), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseOk));

      expect(
        await utilsApi.createCustomerApi(
          httpClient: client,
          customerData: newCustomer,
        ),
        const TypeMatcher<Customer>(),
      );
    });

    test(
        'check returns value of `createCustomerApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.customerRegisterEndPoint,
              body: customerToJson(newCustomer), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseOk));

      Customer customer = await utilsApi.createCustomerApi(
        httpClient: client,
        customerData: newCustomer,
      );
      Customer customerRet = customerFromJson(customerDataReturn);

      expect(customer.customerId, customerRet.customerId);
      expect(customer.name, customerRet.name);
      expect(customer.eMail, customerRet.eMail);
      expect(customer.phone, customerRet.phone);
    });

    test('check returns value of `createCustomerApi()` with invalid data sent',
        () async {
      when(client.post(Config.customerRegisterEndPoint,
              body: customerToJson(Customer()), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseBad));

      expect(
        await utilsApi.createCustomerApi(
          httpClient: client,
          customerData: Customer(),
        ),
        null,
      );
    });
  });

  group('[Unit -> Api] Account API', () {
    test(
        'check returns value of `checkHealthAccountApi()` if the http call completes successfully',
        () async {
      when(client.get(Config.accountEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResOk));

      expect(await utilsApi.checkHealthAccountApi(httpClient: client), true);
    });

    test(
        'check returns value of `checkHealthAccountApi()` if the http call completes with an error',
        () async {
      when(client.get(Config.accountEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResBad));

      expect(await utilsApi.checkHealthAccountApi(httpClient: client), false);
    });

    test(
        'check returns type of `createAccountApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.accountRegisterEndPoint,
              body: accountToJson(newAccount), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseOk));

      expect(
        await utilsApi.createAccountApi(
          httpClient: client,
          accountData: newAccount,
        ),
        const TypeMatcher<Account>(),
      );
    });

    test(
        'check returns value of `createAccountApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.accountRegisterEndPoint,
              body: accountToJson(newAccount), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => accountRegResponseOk));

      Account account = await utilsApi.createAccountApi(
        httpClient: client,
        accountData: newAccount,
      );
      Account accountRet = accountFromJson(accountDataReturn);

      expect(account.accountId, accountRet.accountId);
      expect(account.accountId, accountRet.accountId);
      expect(account.customerId, accountRet.customerId);
      expect(account.bankBranch, accountRet.bankBranch);
      expect(account.bankAccount, accountRet.bankAccount);
      expect(account.limit, accountRet.limit);
    });

    test('check returns value of `createAccountApi()` with invalid data sent',
        () async {
      when(client.post(Config.accountRegisterEndPoint,
              body: accountToJson(Account()), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => accountRegResponseBad));

      expect(
        await utilsApi.createAccountApi(
          httpClient: client,
          accountData: Account(),
        ),
        null,
      );
    });
  });

  group('[Unit -> Api] Purchase API', () {
    test(
        'check returns value of `checkHealthPurchaseApi()` if the http call completes successfully',
        () async {
      when(client.get(Config.purchaseEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResOk));

      expect(await utilsApi.checkHealthPurchaseApi(httpClient: client), true);
    });

    test(
        'check returns value of `checkHealthPurchaseApi()` if the http call completes with an error',
        () async {
      when(client.get(Config.purchaseEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResBad));

      expect(await utilsApi.checkHealthPurchaseApi(httpClient: client), false);
    });

    test(
        'check returns type of `createPurchaseApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.purchaseRegisterEndPoint,
              body: purchaseToJson(newPurchase), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => purchaseRegResponseOk));

      expect(
        await utilsApi.createPurchaseApi(
          httpClient: client,
          purchaseData: newPurchase,
        ),
        const TypeMatcher<Purchase>(),
      );
    });

    test(
        'check returns value of `createPurchaseApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.purchaseRegisterEndPoint,
              body: purchaseToJson(newPurchase), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => purchaseRegResponseOk));

      Purchase purchase = await utilsApi.createPurchaseApi(
        httpClient: client,
        purchaseData: newPurchase,
      );
      Purchase purchaseRet = purchaseFromJson(purchaseDataReturn);

      expect(purchase.purchaseId, purchaseRet.purchaseId);
      expect(purchase.accountId, purchaseRet.accountId);
      expect(purchase.type, purchaseRet.type);
      expect(purchase.value, purchaseRet.value);
      expect(purchase.date, purchaseRet.date);
      expect(purchase.origin.code, purchaseRet.origin.code);
      expect(purchase.origin.name, purchaseRet.origin.name);
      expect(purchase.tag, purchaseRet.tag);
    });

    test('check returns value of `createPurchaseApi()` with invalid data sent',
        () async {
      when(client.post(Config.purchaseRegisterEndPoint,
              body: purchaseToJson(Purchase()), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => purchaseRegResponseBad));

      expect(
        await utilsApi.createPurchaseApi(
          httpClient: client,
          purchaseData: Purchase(),
        ),
        null,
      );
    });

    test(
        'check returns type of `balancePurchaseApi()` if the http call completes successfully',
        () async {
      when(client.get(Config.purchaseBalanceEndPoint(accountId: accountIdMock),
              headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => balanceRegResponseOk));

      expect(
        await utilsApi.balancePurchaseApi(
          httpClient: client,
          accountId: accountIdMock,
        ),
        const TypeMatcher<Balance>(),
      );
    });

    test(
        'check returns value of `balancePurchaseApi()` if the http call completes successfully',
        () async {
      when(client.get(Config.purchaseBalanceEndPoint(accountId: accountIdMock),
              headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => balanceRegResponseOk));

      Balance balance = await utilsApi.balancePurchaseApi(
        httpClient: client,
        accountId: accountIdMock,
      );
      Balance balanceRet = balanceFromJson(balanceDataReturn);

      expect(balance.balance, balanceRet.balance);
    });

    test(
        'check returns type of `listPurchaseApi()` if the http call completes successfully',
        () async {
      when(client.get(
        Config.purchaseListEndPoint(accountId: accountIdMock, tags: tagsMock),
        headers: requestHeaders,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => purchaseListResponseOk),
      );

      expect(
        await utilsApi.listPurchaseApi(
          httpClient: client,
          accountId: accountIdMock,
          tags: tagsMock,
        ),
        const TypeMatcher<List<Purchase>>(),
      );
    });

    test(
        'check returns value of `listPurchaseApi()` if the http call completes successfully',
        () async {
      when(client.get(
        Config.purchaseListEndPoint(accountId: accountIdMock, tags: tagsMock),
        headers: requestHeaders,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => purchaseListResponseOk),
      );

      List<Purchase> purchaseList = await utilsApi.listPurchaseApi(
        httpClient: client,
        accountId: accountIdMock,
        tags: tagsMock,
      );
      List<Purchase> purchaseListRet = allPurchasesFromJson(
        purchaseListDataReturn,
      );

      expect(purchaseList[0].purchaseId, purchaseListRet[0].purchaseId);
      expect(purchaseList[0].accountId, purchaseListRet[0].accountId);
      expect(purchaseList[0].type, purchaseListRet[0].type);
      expect(purchaseList[0].value, purchaseListRet[0].value);
      expect(purchaseList[0].date, purchaseListRet[0].date);
      expect(purchaseList[0].origin.code, purchaseListRet[0].origin.code);
      expect(purchaseList[0].origin.name, purchaseListRet[0].origin.name);
      expect(purchaseList[0].tag, purchaseListRet[0].tag);
    });
  });
}
