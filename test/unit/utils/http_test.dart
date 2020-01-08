import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/http.dart';
import 'package:nudemo/utils/model/customer_model.dart';
import 'package:nudemo/utils/model/account_model.dart';
import 'package:nudemo/utils/model/purchase_model.dart';

/// Create a `MockClient` using the `Mock` class provided by the Mockito package.
/// Create new `instances` of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  MockClient client;
  Http utilsHttp;
  final Duration timeRequest = const Duration(milliseconds: 50);
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
  final String customerDataSend =
      '{"name":"Chinnon Santos","e-mail":"chinnonsantos@gmail.com","phone":"11987654321"}';
  final String customerDataReturn =
      '{"customer-id":"a1b2c3","name":"Chinnon Santos","e-mail":"chinnonsantos@gmail.com","phone":"11987654321"}';
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
  final String accountDataReturn =
      '{"account-id":"c3b2a1","customer-id":"a1b2c3","bank-branch":"0001","bank-account":"1234567-8","limit":15000.5}';
  final http.Response accountRegResponseOk = http.Response(
    accountDataReturn,
    201,
    headers: requestHeaders,
  );
  final http.Response accountRegResponseBad = customerRegResponseBad;
  final Account newAccount = Account(
    customerId: 'a1b2c3',
    bankBranch: '0001',
    bankAccount: '1234567-8',
    limit: 15000.5,
  );

  /// Mock of [Purchase API]
  final String purchaseDataReturn =
      '{"purchase-id":"c3b2a1","account-id":"a1b2c3","type":"expense","value":124.9,"date":"2019-11-03T21:36:27.000Z","origin":{"code":2,"name":"shopping online"},"tag":["footwear"]}';
  final http.Response purchaseRegResponseOk = http.Response(
    purchaseDataReturn,
    201,
    headers: requestHeaders,
  );
  final http.Response purchaseRegResponseBad = customerRegResponseBad;
  final Origin originData = Origin(
    code: 2,
    name: 'shopping online',
  );
  final Purchase newPurchase = Purchase(
    purchaseId: 'c3b2a1',
    accountId: 'a1b2c3',
    type: 'expense',
    value: 124.9,
    date: DateTime.parse('2019-11-03T21:36:27.000Z'),
    origin: originData,
    tag: ['footwear'],
  );

  setUp(() {
    client = MockClient();
    utilsHttp = Http();
  });

  group('[Unit -> Http] General', () {
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
        await utilsHttp.loadDataFromAPI(
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
        await utilsHttp.loadDataFromAPI(
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
        await utilsHttp.loadDataFromAPI(
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
        await utilsHttp.loadDataFromAPI(
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
        await utilsHttp.sendDataToAPI(
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
        await utilsHttp.sendDataToAPI(
          httpClient: client,
          endPoint: testEndPoint,
          data: customerDataSend,
        ),
        {
          'statusCode': 201,
          'body': {
            'customer-id': 'a1b2c3',
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
        await utilsHttp.sendDataToAPI(
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
        await utilsHttp.sendDataToAPI(
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
        await utilsHttp.sendDataToAPI(
          httpClient: client,
          endPoint: 'http://invalidendpoint/',
          data: customerDataSend,
        ),
        null,
      );
    });
  });

  group('[Unit -> Http] Customer API', () {
    test(
        'check returns value of `checkHealthCustomerApi()` if the http call completes successfully',
        () async {
      when(client.get(Config.customerEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResOk));

      expect(await utilsHttp.checkHealthCustomerApi(httpClient: client), true);
    });

    test(
        'check returns value of `checkHealthCustomerApi()` if the http call completes with an error',
        () async {
      when(client.get(Config.customerEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResBad));

      expect(await utilsHttp.checkHealthCustomerApi(httpClient: client), false);
    });

    test(
        'check returns type of `createCustomerApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.customerRegisterEndPoint,
              body: customerToJson(newCustomer), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseOk));

      expect(
        await utilsHttp.createCustomerApi(
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

      Customer customer = await utilsHttp.createCustomerApi(
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
        await utilsHttp.createCustomerApi(
          httpClient: client,
          customerData: Customer(),
        ),
        null,
      );
    });
  });

  group('[Unit -> Http] Account API', () {
    test(
        'check returns value of `checkHealthAccountApi()` if the http call completes successfully',
        () async {
      when(client.get(Config.accountEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResOk));

      expect(await utilsHttp.checkHealthAccountApi(httpClient: client), true);
    });

    test(
        'check returns value of `checkHealthAccountApi()` if the http call completes with an error',
        () async {
      when(client.get(Config.accountEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResBad));

      expect(await utilsHttp.checkHealthAccountApi(httpClient: client), false);
    });

    test(
        'check returns type of `createAccountApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.accountRegisterEndPoint,
              body: accountToJson(newAccount), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseOk));

      expect(
        await utilsHttp.createAccountApi(
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

      Account account = await utilsHttp.createAccountApi(
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
        await utilsHttp.createAccountApi(
          httpClient: client,
          accountData: Account(),
        ),
        null,
      );
    });
  });

  group('[Unit -> Http] Purchase API', () {
    test(
        'check returns value of `checkHealthPurchaseApi()` if the http call completes successfully',
        () async {
      when(client.get(Config.purchaseEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResOk));

      expect(await utilsHttp.checkHealthPurchaseApi(httpClient: client), true);
    });

    test(
        'check returns value of `checkHealthPurchaseApi()` if the http call completes with an error',
        () async {
      when(client.get(Config.purchaseEndPoint, headers: requestHeaders))
          .thenAnswer(
              (_) async => Future.delayed(timeRequest, () => checkResBad));

      expect(await utilsHttp.checkHealthPurchaseApi(httpClient: client), false);
    });

    test(
        'check returns type of `createPurchaseApi()` if the http call completes successfully',
        () async {
      when(client.post(Config.purchaseRegisterEndPoint,
              body: purchaseToJson(newPurchase), headers: requestHeaders))
          .thenAnswer((_) async =>
              Future.delayed(timeRequest, () => customerRegResponseOk));

      expect(
        await utilsHttp.createPurchaseApi(
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

      Purchase purchase = await utilsHttp.createPurchaseApi(
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
        await utilsHttp.createPurchaseApi(
          httpClient: client,
          purchaseData: Purchase(),
        ),
        null,
      );
    });
  });
}
