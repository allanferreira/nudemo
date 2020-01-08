import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/themes/nu_default_theme.dart';
import 'package:nudemo/themes/nu_dark_theme.dart';
import 'package:nudemo/utils/model/customer_model.dart';
import 'package:nudemo/utils/model/account_model.dart';
import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/http.dart';
import 'package:nudemo/utils/globals.dart' as globals;

/// Create a `MockClient` using the `Mock` class provided by the Mockito package.
/// Create new `instances` of this class in each test.
class MockClient extends Mock implements http.Client {}

/// Create a `MockHttp` using the `Mock` class provided by the Mockito package.
/// Create new `instances` of this class in each test.
class MockHttp extends Mock implements Http {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Duration timeRequest = const Duration(milliseconds: 5);
  HomePresenter homePresenter;
  HomeViewModel homeViewModel;
  MockClient client;
  MockHttp mockHttp;
  Config config;

  setUp(() {
    homePresenter = HomePresenter();
    homeViewModel = HomeViewModel();
    client = MockClient();
    mockHttp = MockHttp();
    config = Config();

    /// Mock Config class
    config.userUuid = "a1b2c3";
    config.accountUuid = "a1b2c3d4e5";

    /// Mock SharedPreferences
    SharedPreferences.setMockInitialValues({
      "userUuid": config.userUuid,
      "userName": config.userName,
      "userNickname": config.userNickname,
      "userEmail": config.userEmail,
      "userPhone": config.userPhone,
      "accountUuid": config.accountUuid,
      "bankBranch": config.bankBranch,
      "bankAccount": config.bankAccount,
      "accountLimit": config.accountLimit,
      "limitPercent": HomeViewModel.limitPercent,
      "balancesOpenValue": HomeViewModel.balancesOpenValue,
      "balancesOpenPercent": HomeViewModel.balancesOpenPercent,
      "balancesOpenFlex": HomeViewModel.balancesOpenFlex,
      "balancesAvailableValue": HomeViewModel.balancesAvailableValue,
      "balancesAvailablePercent": HomeViewModel.balancesAvailablePercent,
      "balancesAvailableFlex": HomeViewModel.balancesAvailableFlex,
    });

    /// Mock Global Variables
    globals.isLoggedIn = true;
    globals.userUuid = config.userUuid;
    globals.userName = config.userName;
    globals.userNickname = config.userNickname;
    globals.userEmail = config.userEmail;
    globals.userPhone = config.userPhone;
    globals.accountUuid = config.accountUuid;
    globals.bankBranch = config.bankBranch;
    globals.bankAccount = config.bankAccount;
    globals.accountLimit = config.accountLimit;
    globals.limitPercent = HomeViewModel.limitPercent;
    globals.balancesOpenValue = HomeViewModel.balancesOpenValue;
    globals.balancesOpenPercent = HomeViewModel.balancesOpenPercent;
    globals.balancesOpenFlex = HomeViewModel.balancesOpenFlex;
    globals.balancesAvailableValue = HomeViewModel.balancesAvailableValue;
    globals.balancesAvailablePercent = HomeViewModel.balancesAvailablePercent;
    globals.balancesAvailableFlex = HomeViewModel.balancesAvailableFlex;
  });

  group('[Unit -> HomePresenter] General', () {
    final Color activeColor = Colors.black45;
    final Color unactiveColor = Colors.white;

    test('`getNuTheme()` run time type should be [ThemeData]', () {
      expect(
        homePresenter.getNuTheme().runtimeType,
        ThemeData,
      );
    });

    test('initial `getNuTheme()` value should be [nuDefaultTheme]', () {
      expect(
        homePresenter.getNuTheme(),
        nuDefaultTheme,
      );
    });

    test(
        '`getNuTheme()` value should be [nuDarkTheme] after set `Brightness.dark`',
        () {
      expect(
        homePresenter.getNuTheme(),
        nuDefaultTheme,
      );

      homePresenter.setNuTheme(darkIsEnable: true);

      expect(
        homePresenter.getNuTheme(),
        nuDarkTheme,
      );
    });

    test(
        '`getNuTheme()` value should be [nuDefaultTheme] after set `Brightness.dark` and then `Brightness.light`',
        () {
      expect(
        homePresenter.getNuTheme(),
        nuDefaultTheme,
      );

      homePresenter.setNuTheme(darkIsEnable: true);

      expect(
        homePresenter.getNuTheme(),
        nuDarkTheme,
      );

      homePresenter.setNuTheme(darkIsEnable: false);

      expect(
        homePresenter.getNuTheme(),
        nuDefaultTheme,
      );
    });

    test('`getNuThemeFromKey()` run time type should be [ThemeData]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT).runtimeType,
        ThemeData,
      );
    });

    test(
        '`getNuThemeFromKey()` with argument `NuThemeKeys.DEFAULT` should be [nuDefaultTheme]',
        () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT),
        nuDefaultTheme,
      );
    });

    test(
        '`getNuThemeFromKey()` with argument `NuThemeKeys.DARK` should be [nuDarkTheme]',
        () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DARK),
        nuDarkTheme,
      );
    });

    test(
        '`getNuThemeFromKey()` with argument `NuThemeKeys.CHRISTMAS` should be [nuDefaultTheme]',
        () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.CHRISTMAS),
        nuDefaultTheme,
      );
    });

    test(
        '`getNuThemeFromKey()` with argument `NuThemeKeys.CHRISTMAS_DARK` should be [nuDarkTheme]',
        () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.CHRISTMAS_DARK),
        nuDarkTheme,
      );
    });

    test('initial `getInitialPageCarousel()` value should be 0', () {
      expect(homePresenter.getInitialPageCarousel(), 0);
    });

    test('initial `getCurrentPageCarousel()` value should be 0', () {
      expect(homePresenter.getCurrentPageCarousel(), 0);
    });

    test(
        '`getCurrentPageCarousel()` value should be 1 after set new current page with 1',
        () {
      expect(homePresenter.getCurrentPageCarousel(), 0);

      homePresenter.setCurrentPageCarousel(1);

      expect(homePresenter.getCurrentPageCarousel(), 1);
    });

    test(
        '`getCurrentPageCarousel()` value should be 0 after set new current page with 0',
        () {
      expect(homePresenter.getCurrentPageCarousel(), 0);

      homePresenter.setCurrentPageCarousel(0);

      expect(homePresenter.getCurrentPageCarousel(), 0);
    });

    test(
        '`getCurrentPageCarousel()` value should be 2 after set new current page two times',
        () {
      expect(homePresenter.getCurrentPageCarousel(), 0);

      homePresenter.setCurrentPageCarousel(1);

      expect(homePresenter.getCurrentPageCarousel(), 1);

      homePresenter.setCurrentPageCarousel(2);

      expect(homePresenter.getCurrentPageCarousel(), 2);
    });

    test(
        '`getCurrentPageCarousel()` value should be 0 after set new current page two times and go back to 0',
        () {
      expect(homePresenter.getCurrentPageCarousel(), 0);

      homePresenter.setCurrentPageCarousel(1);

      expect(homePresenter.getCurrentPageCarousel(), 1);

      homePresenter.setCurrentPageCarousel(2);

      expect(homePresenter.getCurrentPageCarousel(), 2);

      homePresenter.setCurrentPageCarousel(0);

      expect(homePresenter.getCurrentPageCarousel(), 0);
    });

    test(
        'initial `getDottedIndicatorColor()` value should be equal `activeColor`',
        () {
      int index = 0;

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeColor,
      );
    });

    test(
        'initial `getDottedIndicatorColor()` value should be equal `unactiveColor` with index = 1',
        () {
      int index = 1;

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveColor,
      );
    });

    test(
        '`getDottedIndicatorColor()` value should be equal `activeColor` with index = 1 and setCurrentPageCarousel() with index = 1',
        () {
      int index = 1;

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveColor,
      );

      homePresenter.setCurrentPageCarousel(1);

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeColor,
      );
    });

    test(
        '`getDottedIndicatorColor()` value should be equal `unactiveColor` with index = 1 and setCurrentPageCarousel() with index = 2',
        () {
      int index = 1;

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveColor,
      );

      homePresenter.setCurrentPageCarousel(1);

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeColor,
      );

      homePresenter.setCurrentPageCarousel(2);

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveColor,
      );
    });

    test(
        '`getDottedIndicatorColor()` value should be equal `unactiveColor` with index = 1 and setCurrentPageCarousel() with index = 2 some times',
        () {
      int index = 1;

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        unactiveColor,
      );

      homePresenter.setCurrentPageCarousel(1);

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeColor,
      );

      homePresenter.setCurrentPageCarousel(1);

      expect(
        homePresenter.getDottedIndicatorColor(
          index: index,
          activeColor: activeColor,
          unactiveColor: unactiveColor,
        ),
        activeColor,
      );
    });

    test('`getNuThemeFromKey()` run time type should be [ThemeData]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT).runtimeType,
        ThemeData,
      );
    });

    test('initial `getFutureValue()` value should be [balancesFutureValue]',
        () {
      expect(
        homePresenter.getFutureValue(),
        HomeViewModel.balancesFutureValue,
      );
    });

    test('initial `getOpenValue()` value should be [balancesOpenValue]', () {
      expect(
        homePresenter.getOpenValue(),
        HomeViewModel.balancesOpenValue,
      );
    });

    test(
        'initial `getAvailableValue()` value should be [balancesAvailableValue]',
        () {
      expect(
        homePresenter.getAvailableValue(),
        HomeViewModel.balancesAvailableValue,
      );
    });

    test('initial `getDueValue()` value should be [balancesDueValue]', () {
      expect(
        homePresenter.getDueValue(),
        HomeViewModel.balancesDueValue,
      );
    });

    test('initial `getFuturePercent()` value should be [balancesFuturePercent]',
        () {
      expect(
        homePresenter.getFuturePercent(),
        HomeViewModel.balancesFuturePercent,
      );
    });

    test('initial `getOpenPercent()` value should be [balancesOpenPercent]',
        () {
      expect(
        homePresenter.getOpenPercent(),
        HomeViewModel.balancesOpenPercent,
      );
    });

    test(
        'initial `getAvailablePercent()` value should be [balancesAvailablePercent]',
        () {
      expect(
        homePresenter.getAvailablePercent(),
        HomeViewModel.balancesAvailablePercent,
      );
    });

    test('initial `getDuePercent()` value should be [balancesDuePercent]', () {
      expect(
        homePresenter.getDuePercent(),
        HomeViewModel.balancesDuePercent,
      );
    });

    test('initial `getFutureFlex()` value should be [balancesFutureFlex]', () {
      expect(
        homePresenter.getFutureFlex(),
        HomeViewModel.balancesFutureFlex,
      );
    });

    test('initial `getOpenFlex()` value should be [balancesOpenFlex]', () {
      expect(
        homePresenter.getOpenFlex(),
        HomeViewModel.balancesOpenFlex,
      );
    });

    test('initial `getAvailableFlex()` value should be [balancesAvailableFlex]',
        () {
      expect(
        homePresenter.getAvailableFlex(),
        HomeViewModel.balancesAvailableFlex,
      );
    });

    test('initial `getDueFlex()` value should be [balancesDueFlex]', () {
      expect(
        homePresenter.getDueFlex(),
        HomeViewModel.balancesDueFlex,
      );
    });

    test('`calculatePercentBalances()` value return', () {
      homePresenter.calculatePercentBalances();

      expect(homePresenter.getFutureValue(), 0.0);
      expect(homePresenter.getFutureCurrency(), r'R$' + '\u00a0' + '0,00');
      expect(homePresenter.getFuturePercent(), 0.0);
      expect(homePresenter.getFutureFlex(), 0);

      expect(homePresenter.getOpenValue(), 5578.79);
      expect(homePresenter.getOpenCurrency(), r'R$' + '\u00a0' + '5.578,79');
      expect(homePresenter.getOpenPercent(), 37.19069364354522);
      expect(homePresenter.getOpenFlex(), 37);

      expect(homePresenter.getAvailableValue(), 9421.71);
      expect(
          homePresenter.getAvailableCurrency(), r'R$' + '\u00a0' + '9.421,71');
      expect(homePresenter.getAvailablePercent(), 62.809306356454776);
      expect(homePresenter.getAvailableFlex(), 63);

      expect(homePresenter.getDueValue(), 0);
      expect(homePresenter.getDueCurrency(), 0.0);
      expect(homePresenter.getDuePercent(), 0);
      expect(homePresenter.getDueFlex(), 0);
    });

    test('`getFormattedCurrency()` value return with BRL currency', () {
      expect(
        homePresenter.getFormattedCurrency(
          currencyBRL: r'R$' + '\u00a0' + '5.453,19',
        ),
        [r'R$', '5.453', '19'],
      );
    });

    test('`getFormattedCurrency()` value return with USD currency', () {
      expect(
        homePresenter.getFormattedCurrency(
          currencyBRL: r'$' + '5,578.79',
        ),
        [r'R$', '?', '??'],
      );
    });

    test('initial `getLastCardRegister()` value should be [lastCardRegister]',
        () {
      expect(
        homePresenter.getLastCardRegister(),
        homeViewModel.lastCardRegister,
      );
    });
  });

  group(
      '[Unit -> HomePresenter] SharedPreferences and Mock with full user data',
      () {
    test('check initial data of `sharedPrefs`', () async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      expect(pref.getString('userUuid'), config.userUuid);
      expect(pref.getString('userName'), config.userName);
      expect(pref.getString('userNickname'), config.userNickname);
      expect(pref.getString('userEmail'), config.userEmail);
      expect(pref.getString('userPhone'), config.userPhone);
      expect(pref.getString('accountUuid'), config.accountUuid);
      expect(pref.getString('bankBranch'), config.bankBranch);
      expect(pref.getString('bankAccount'), config.bankAccount);
      expect(pref.getDouble('accountLimit'), config.accountLimit);
    }, timeout: Timeout.factor(2));

    test('check data of `sharedPrefs` after changed', () async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      expect(pref.getString('userUuid'), config.userUuid);
      expect(pref.getString('userName'), config.userName);
      expect(pref.getString('userNickname'), config.userNickname);
      expect(pref.getString('userEmail'), config.userEmail);
      expect(pref.getString('userPhone'), config.userPhone);
      expect(pref.getString('accountUuid'), config.accountUuid);
      expect(pref.getString('bankBranch'), config.bankBranch);
      expect(pref.getString('bankAccount'), config.bankAccount);
      expect(pref.getDouble('accountLimit'), config.accountLimit);

      String userUuid = "a1b2c3d4e5";
      String userName = "Chinnon S.";
      String userNickname = "Shin";
      String userEmail = "contato@chinnonsantos.com.br";
      String userPhone = "11999999999";
      String accountUuid = "e5d4c3b2a1";
      String bankBranch = "0002";
      String bankAccount = "8765432-1";
      double accountLimit = 18000;

      await pref.setString('userUuid', userUuid);
      await pref.setString('userName', userName);
      await pref.setString('userNickname', userNickname);
      await pref.setString('userEmail', userEmail);
      await pref.setString('userPhone', userPhone);
      await pref.setString('accountUuid', accountUuid);
      await pref.setString('bankBranch', bankBranch);
      await pref.setString('bankAccount', bankAccount);
      await pref.setDouble('accountLimit', accountLimit);

      expect(pref.getString('userUuid'), userUuid);
      expect(pref.getString('userName'), userName);
      expect(pref.getString('userNickname'), userNickname);
      expect(pref.getString('userEmail'), userEmail);
      expect(pref.getString('userPhone'), userPhone);
      expect(pref.getString('accountUuid'), accountUuid);
      expect(pref.getString('bankBranch'), bankBranch);
      expect(pref.getString('bankAccount'), bankAccount);
      expect(pref.getDouble('accountLimit'), accountLimit);
    }, timeout: Timeout.factor(2));

    test('check values after second run `initialUserData()` successfully',
        () async {
      /// Mock customer status API [Ok]
      when(mockHttp.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockHttp.checkHealthPurchaseApi(httpClient: client), true);

      expect(await homePresenter.initialUserData(client, mockHttp), true);
    }, timeout: Timeout.factor(2));

    test(
        'check values after second run `initialUserData()` with error (Purchase API Off!)',
        () async {
      /// Mock customer status API [Ok]
      when(mockHttp.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockHttp.checkHealthPurchaseApi(httpClient: client), false);

      expect(await homePresenter.initialUserData(client, mockHttp), false);
    }, timeout: Timeout.factor(2));
  }, timeout: Timeout.factor(2));

  group(
      '[Unit -> HomePresenter] SharedPreferences and Mock with empty user data',
      () {
    setUp(() {
      /// Mock Config class
      config.userUuid = null;
      config.userName = null;
      config.userNickname = null;
      config.userEmail = null;
      config.userPhone = null;
      config.accountUuid = null;
      config.bankBranch = null;
      config.bankAccount = null;
      config.accountLimit = null;

      /// Mock SharedPreferences
      SharedPreferences.setMockInitialValues({});

      /// Mock Global Variables
      globals.isLoggedIn = false;
      globals.userUuid = config.userUuid;
      globals.userName = config.userName;
      globals.userNickname = config.userNickname;
      globals.userEmail = config.userEmail;
      globals.userPhone = config.userPhone;
      globals.accountUuid = config.accountUuid;
      globals.bankBranch = config.bankBranch;
      globals.bankAccount = config.bankAccount;
      globals.accountLimit = config.accountLimit;
      globals.limitPercent = HomeViewModel.limitPercent;
      globals.balancesOpenValue = HomeViewModel.balancesOpenValue;
      globals.balancesOpenPercent = HomeViewModel.balancesOpenPercent;
      globals.balancesOpenFlex = HomeViewModel.balancesOpenFlex;
      globals.balancesAvailableValue = HomeViewModel.balancesAvailableValue;
      globals.balancesAvailablePercent = HomeViewModel.balancesAvailablePercent;
      globals.balancesAvailableFlex = HomeViewModel.balancesAvailableFlex;
    });

    test('initial `sharedPrefs` value should be null', () {
      expect(HomePresenter.sharedPrefs.runtimeType, SharedPreferences);
    });

    test('check values after first run `initialUserData()` successfully',
        () async {
      /// Mock customer status API [Ok]
      when(mockHttp.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockHttp.checkHealthCustomerApi(httpClient: client), true);

      /// Mock account status API [Ok]
      when(mockHttp.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockHttp.checkHealthAccountApi(httpClient: client), true);

      /// Mock customer register [Ok]
      final Customer newCustomer = Customer(
        name: Config().userName,
        eMail: Config().userEmail,
        phone: Config().userPhone,
      );
      final String customerId = 'a1b2c3';
      final Customer customerRegistered = Customer(
        customerId: customerId,
        name: Config().userName,
        eMail: Config().userEmail,
        phone: Config().userPhone,
      );

      when(mockHttp.createCustomerApi(
        httpClient: client,
        customerData: newCustomer,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => customerRegistered),
      );

      expect(
        await mockHttp.createCustomerApi(
          httpClient: client,
          customerData: newCustomer,
        ),
        customerRegistered,
      );

      /// Mock account register [Ok]
      Account newAccount = Account(
        customerId: customerId,
        bankBranch: Config().bankBranch,
        bankAccount: Config().bankAccount,
        limit: Config().accountLimit,
      );
      final String accountId = 'c3b2a1';
      Account accountRegistered = Account(
        accountId: accountId,
        customerId: customerId,
        bankBranch: Config().bankBranch,
        bankAccount: Config().bankAccount,
        limit: Config().accountLimit,
      );

      when(mockHttp.createAccountApi(
        httpClient: client,
        accountData: newAccount,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => accountRegistered),
      );

      expect(
        await mockHttp.createAccountApi(
          httpClient: client,
          accountData: newAccount,
        ),
        accountRegistered,
      );

      expect(
        await homePresenter.initialUserData(
          client,
          mockHttp,
          newCustomer,
          newAccount,
        ),
        true,
      );
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `initialUserData()` with error (Customer API Off!)',
        () async {
      /// Mock customer status API [Off]
      when(mockHttp.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockHttp.checkHealthCustomerApi(httpClient: client), false);

      expect(await homePresenter.initialUserData(client, mockHttp), false);
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `initialUserData()` with error (Account API Off!)',
        () async {
      /// Mock account status API [Off]
      when(mockHttp.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockHttp.checkHealthAccountApi(httpClient: client), false);

      expect(await homePresenter.initialUserData(client, mockHttp), false);
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `initialUserData()` with error (Customer and Account API Off!)',
        () async {
      /// Mock customer status API [Off]
      when(mockHttp.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockHttp.checkHealthCustomerApi(httpClient: client), false);

      /// Mock account status API [Off]
      when(mockHttp.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockHttp.checkHealthAccountApi(httpClient: client), false);

      expect(await homePresenter.initialUserData(client, mockHttp), false);
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `initialUserData()` with error (Customer create API Off!)',
        () async {
      /// Mock customer status API [Ok]
      when(mockHttp.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockHttp.checkHealthCustomerApi(httpClient: client), true);

      /// Mock account status API [Ok]
      when(mockHttp.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockHttp.checkHealthAccountApi(httpClient: client), true);

      /// Mock customer register [Ok]
      final Customer newCustomer = Customer(
        name: Config().userName,
        eMail: Config().userEmail,
        phone: Config().userPhone,
      );

      when(mockHttp.createCustomerApi(
        httpClient: client,
        customerData: newCustomer,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => null),
      );

      expect(
        await mockHttp.createCustomerApi(
          httpClient: client,
          customerData: newCustomer,
        ),
        null,
      );

      expect(
        await homePresenter.initialUserData(
          client,
          mockHttp,
          newCustomer,
        ),
        false,
      );
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `initialUserData()` with error (Account create API Off!)',
        () async {
      /// Mock customer status API [Ok]
      when(mockHttp.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockHttp.checkHealthCustomerApi(httpClient: client), true);

      /// Mock account status API [Ok]
      when(mockHttp.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockHttp.checkHealthAccountApi(httpClient: client), true);

      /// Mock customer register [Ok]
      final Customer newCustomer = Customer(
        name: Config().userName,
        eMail: Config().userEmail,
        phone: Config().userPhone,
      );
      final String customerId = 'a1b2c3';
      final Customer customerRegistered = Customer(
        customerId: customerId,
        name: Config().userName,
        eMail: Config().userEmail,
        phone: Config().userPhone,
      );

      when(mockHttp.createCustomerApi(
        httpClient: client,
        customerData: newCustomer,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => customerRegistered),
      );

      expect(
        await mockHttp.createCustomerApi(
          httpClient: client,
          customerData: newCustomer,
        ),
        customerRegistered,
      );

      /// Mock account register [Ok]
      Account newAccount = Account(
        customerId: customerId,
        bankBranch: Config().bankBranch,
        bankAccount: Config().bankAccount,
        limit: Config().accountLimit,
      );

      when(mockHttp.createAccountApi(
        httpClient: client,
        accountData: newAccount,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => null),
      );

      expect(
        await mockHttp.createAccountApi(
          httpClient: client,
          accountData: newAccount,
        ),
        null,
      );

      expect(
        await homePresenter.initialUserData(
          client,
          mockHttp,
          newCustomer,
          newAccount,
        ),
        false,
      );
    }, timeout: Timeout.factor(2));

    test('check values after second run `initialUserData()` with error',
        () async {
      /// Mock customer status API [Ok]
      when(mockHttp.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockHttp.checkHealthCustomerApi(httpClient: client), false);

      when(mockHttp.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockHttp.checkHealthAccountApi(httpClient: client), false);

      expect(await homePresenter.initialUserData(client, mockHttp), false);
    }, timeout: Timeout.factor(2));
  }, timeout: Timeout.factor(2));
}
