import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:matcher/src/type_matcher.dart' as matcher;

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/themes/nu_default_theme.dart';
import 'package:nudemo/themes/nu_dark_theme.dart';
import 'package:nudemo/utils/model/customer_model.dart';
import 'package:nudemo/utils/model/account_model.dart';
import 'package:nudemo/utils/model/purchase_model.dart';
import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/api.dart';

/// Create a `MockClient` using the `Mock` class provided by the Mockito package.
/// Create new `instances` of this class in each test.
class MockClient extends Mock implements http.Client {}

/// Create a `MockApi` using the `Mock` class provided by the Mockito package.
/// Create new `instances` of this class in each test.
class MockApi extends Mock implements Api {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HomePresenter homePresenter;
  HomeViewModel homeViewModel;
  MockClient client;
  MockApi mockApi;
  Config config;

  final Duration timeRequest = const Duration(milliseconds: 5);
  final String userUuidMock = "a1b2c3";
  final String accountUuidMock = "a1b2c3d4e5";
  final Customer newCustomerMock = Customer(
    name: Config().userName,
    eMail: Config().userEmail,
    phone: Config().userPhone,
  );
  final Customer customerRegisteredMock = Customer(
    customerId: userUuidMock,
    name: Config().userName,
    eMail: Config().userEmail,
    phone: Config().userPhone,
  );
  Account newAccountMock = Account(
    customerId: userUuidMock,
    bankBranch: Config().bankBranch,
    bankAccount: Config().bankAccount,
    limit: Config().accountLimit,
  );
  Account accountRegisteredMock = Account(
    accountId: accountUuidMock,
    customerId: userUuidMock,
    bankBranch: Config().bankBranch,
    bankAccount: Config().bankAccount,
    limit: Config().accountLimit,
  );

  setUp(() {
    homePresenter = HomePresenter();
    homeViewModel = HomeViewModel();
    client = MockClient();
    mockApi = MockApi();
    config = Config();

    /// Mock Config class
    config.userUuid = userUuidMock;
    config.accountUuid = accountUuidMock;

    /// Mock SharedPreferences
    SharedPreferences.setMockInitialValues(config.fullDataMock(config));

    /// Mock Global Variables
    config.globalVariablesMock(isLoggedIn: true, config: config);
  });

  group('[Unit -> HomePresenter] General', () {
    final Color activeColor = Colors.black45;
    final Color unactiveColor = Colors.white;

    test('`getNuTheme()` TypeMatcher should be [ThemeData]', () {
      expect(
        homePresenter.getNuTheme(),
        const matcher.TypeMatcher<ThemeData>(),
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

    test('`getNuThemeFromKey()` TypeMatcher should be [ThemeData]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT),
        const matcher.TypeMatcher<ThemeData>(),
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

    test('`getNuThemeFromKey()` TypeMatcher should be [ThemeData]', () {
      expect(
        homePresenter.getNuThemeFromKey(NuThemeKeys.DEFAULT),
        const matcher.TypeMatcher<ThemeData>(),
      );
    });

    test('initial `getFutureValue()` value should be 0.0', () {
      expect(homePresenter.getFutureValue(), 0.0);
    });

    test('initial `getOpenValue()` value should be 5578.79', () {
      expect(homePresenter.getOpenValue(), 5578.79);
    });

    test('initial `getAvailableValue()` value should be 9421.71', () {
      expect(homePresenter.getAvailableValue(), 9421.71);
    });

    test('initial `getDueValue()` value should be 0.0', () {
      expect(homePresenter.getDueValue(), 0.0);
    });

    test('initial `getFuturePercent()` value should be 0.0', () {
      expect(homePresenter.getFuturePercent(), 0.0);
    });

    test('initial `getOpenPercent()` value should be 37.19069364354522', () {
      expect(homePresenter.getOpenPercent(), 37.19069364354522);
    });

    test('initial `getAvailablePercent()` value should be 62.809306356454776',
        () {
      expect(homePresenter.getAvailablePercent(), 62.809306356454776);
    });

    test('initial `getDuePercent()` value should be 0.0', () {
      expect(homePresenter.getDuePercent(), 0.0);
    });

    test('initial `getFutureFlex()` value should be 0', () {
      expect(homePresenter.getFutureFlex(), 0);
    });

    test('initial `getOpenFlex()` value should be 37', () {
      expect(homePresenter.getOpenFlex(), 37);
    });

    test('initial `getAvailableFlex()` value should be 63', () {
      expect(homePresenter.getAvailableFlex(), 63);
    });

    test('initial `getDueFlex()` value should be 0', () {
      expect(homePresenter.getDueFlex(), 0);
    });

    test('`calculatePercentBalances()` with `accountBalance: 0.0`', () {
      homePresenter.calculatePercentBalances(accountBalance: 0.0);

      expect(homePresenter.getFutureValue(), 0.0);
      expect(homePresenter.getFutureCurrency(), r'R$' + '\u00a0' + '0,00');
      expect(homePresenter.getFuturePercent(), 0.0);
      expect(homePresenter.getFutureFlex(), 0);

      expect(homePresenter.getOpenValue(), 0.0);
      expect(homePresenter.getOpenCurrency(), r'R$' + '\u00a0' + '0,00');
      expect(homePresenter.getOpenPercent(), 0.0);
      expect(homePresenter.getOpenFlex(), 0);

      expect(homePresenter.getAvailableValue(), 15000.5);
      expect(
          homePresenter.getAvailableCurrency(), r'R$' + '\u00a0' + '15.000,50');
      expect(homePresenter.getAvailablePercent(), 100.0);
      expect(homePresenter.getAvailableFlex(), 100);

      expect(homePresenter.getDueValue(), 0);
      expect(homePresenter.getDueCurrency(), 0.0);
      expect(homePresenter.getDuePercent(), 0);
      expect(homePresenter.getDueFlex(), 0);
    });

    test('`calculatePercentBalances()` with `accountBalance: -5578.79`', () {
      homePresenter.calculatePercentBalances(accountBalance: -5578.79);

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

    test('`calculatePercentBalances()` with `accountBalance: -220.0`', () {
      homePresenter.calculatePercentBalances(accountBalance: -220.0);

      expect(homePresenter.getFutureValue(), 0.0);
      expect(
        homePresenter.getFutureCurrency(),
        r'R$' + '\u00a0' + '0,00',
      );
      expect(homePresenter.getFuturePercent(), 0.0);
      expect(homePresenter.getFutureFlex(), 0);

      expect(homePresenter.getOpenValue(), 220.0);
      expect(
        homePresenter.getOpenCurrency(),
        r'R$' + '\u00a0' + '220,00',
      );
      expect(homePresenter.getOpenPercent(), 1.4666177794073532);
      expect(homePresenter.getOpenFlex(), 1);

      expect(homePresenter.getAvailableValue(), 14780.5);
      expect(
        homePresenter.getAvailableCurrency(),
        r'R$' + '\u00a0' + '14.780,50',
      );
      expect(homePresenter.getAvailablePercent(), 98.53338222059264);
      expect(homePresenter.getAvailableFlex(), 99);

      expect(homePresenter.getDueValue(), 0);
      expect(homePresenter.getDueCurrency(), 0.0);
      expect(homePresenter.getDuePercent(), 0);
      expect(homePresenter.getDueFlex(), 0);
    });

    test('`calculatePercentBalances()` with `accountBalance: 340.0`', () {
      homePresenter.calculatePercentBalances(accountBalance: 340.0);

      expect(homePresenter.getFutureValue(), 0.0);
      expect(homePresenter.getFutureCurrency(), r'R$' + '\u00a0' + '0,00');
      expect(homePresenter.getFuturePercent(), 0.0);
      expect(homePresenter.getFutureFlex(), 0);

      expect(homePresenter.getOpenValue(), 0.0);
      expect(homePresenter.getOpenCurrency(), r'R$' + '\u00a0' + '0,00');
      expect(homePresenter.getOpenPercent(), 0.0);
      expect(homePresenter.getOpenFlex(), 0);

      expect(homePresenter.getAvailableValue(), 15340.50);
      expect(
          homePresenter.getAvailableCurrency(), r'R$' + '\u00a0' + '15.340,50');
      expect(homePresenter.getAvailablePercent(), 100.0);
      expect(homePresenter.getAvailableFlex(), 100);

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
      expect(
        pref.getDouble('balancesOpenValue'),
        config.balancesOpenValue,
      );
      expect(
        pref.getDouble('balancesOpenPercent'),
        config.balancesOpenPercent,
      );
      expect(
        pref.getInt('balancesOpenFlex'),
        config.balancesOpenFlex,
      );
      expect(
        pref.getDouble('balancesAvailableValue'),
        config.balancesAvailableValue,
      );
      expect(
        pref.getDouble('balancesAvailablePercent'),
        config.balancesAvailablePercent,
      );
      expect(
        pref.getInt('balancesAvailableFlex'),
        config.balancesAvailableFlex,
      );
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
      expect(
        pref.getDouble('balancesOpenValue'),
        config.balancesOpenValue,
      );
      expect(
        pref.getDouble('balancesOpenPercent'),
        config.balancesOpenPercent,
      );
      expect(
        pref.getInt('balancesOpenFlex'),
        config.balancesOpenFlex,
      );
      expect(
        pref.getDouble('balancesAvailableValue'),
        config.balancesAvailableValue,
      );
      expect(
        pref.getDouble('balancesAvailablePercent'),
        config.balancesAvailablePercent,
      );
      expect(
        pref.getInt('balancesAvailableFlex'),
        config.balancesAvailableFlex,
      );

      String userUuid = "a1b2c3d4e5";
      String userName = "Chinnon S.";
      String userNickname = "Shin";
      String userEmail = "contato@chinnonsantos.com.br";
      String userPhone = "11999999999";
      String accountUuid = "e5d4c3b2a1";
      String bankBranch = "0002";
      String bankAccount = "8765432-1";
      double accountLimit = 18000.0;
      double balancesOpenValue = 4500.5;
      double balancesOpenPercent = 33.338271788;
      int balancesOpenFlex = 33;
      double balancesAvailableValue = 13499.5;
      double balancesAvailablePercent = 66.661728212;
      int balancesAvailableFlex = 67;

      await pref.setString('userUuid', userUuid);
      await pref.setString('userName', userName);
      await pref.setString('userNickname', userNickname);
      await pref.setString('userEmail', userEmail);
      await pref.setString('userPhone', userPhone);
      await pref.setString('accountUuid', accountUuid);
      await pref.setString('bankBranch', bankBranch);
      await pref.setString('bankAccount', bankAccount);
      await pref.setDouble('accountLimit', accountLimit);
      await pref.setDouble(
        'balancesOpenValue',
        balancesOpenValue,
      );
      await pref.setDouble(
        'balancesOpenPercent',
        balancesOpenPercent,
      );
      await pref.setInt(
        'balancesOpenFlex',
        balancesOpenFlex,
      );
      await pref.setDouble(
        'balancesAvailableValue',
        balancesAvailableValue,
      );
      await pref.setDouble(
        'balancesAvailablePercent',
        balancesAvailablePercent,
      );
      await pref.setInt(
        'balancesAvailableFlex',
        balancesAvailableFlex,
      );

      expect(pref.getString('userUuid'), userUuid);
      expect(pref.getString('userName'), userName);
      expect(pref.getString('userNickname'), userNickname);
      expect(pref.getString('userEmail'), userEmail);
      expect(pref.getString('userPhone'), userPhone);
      expect(pref.getString('accountUuid'), accountUuid);
      expect(pref.getString('bankBranch'), bankBranch);
      expect(pref.getString('bankAccount'), bankAccount);
      expect(pref.getDouble('accountLimit'), accountLimit);
      expect(
        pref.getDouble('balancesOpenValue'),
        balancesOpenValue,
      );
      expect(
        pref.getDouble('balancesOpenPercent'),
        balancesOpenPercent,
      );
      expect(
        pref.getInt('balancesOpenFlex'),
        balancesOpenFlex,
      );
      expect(
        pref.getDouble('balancesAvailableValue'),
        balancesAvailableValue,
      );
      expect(
        pref.getDouble('balancesAvailablePercent'),
        balancesAvailablePercent,
      );
      expect(
        pref.getInt('balancesAvailableFlex'),
        balancesAvailableFlex,
      );
    }, timeout: Timeout.factor(2));

    test('check values after second run `userDataInitialSetup()` successfully',
        () async {
      /// Mock purchase status API [Ok]
      when(mockApi.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthPurchaseApi(httpClient: client), true);

      /// Mock balance purchase API [Ok]
      Balance balanceRes = Balance(balance: 0.0);
      when(mockApi.balancePurchaseApi(
        httpClient: client,
        accountId: config.accountUuid,
      )).thenAnswer((_) async => Future.delayed(timeRequest, () => balanceRes));

      expect(
        await mockApi.balancePurchaseApi(
          httpClient: client,
          accountId: config.accountUuid,
        ),
        balanceRes,
      );

      expect(await homePresenter.userDataInitialSetup(client, mockApi), true);
    }, timeout: Timeout.factor(2));

    test(
        'check values after second run `userDataInitialSetup()` with error (Purchase API Off!)',
        () async {
      /// Mock purchase status API [Off]
      when(mockApi.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockApi.checkHealthPurchaseApi(httpClient: client), false);

      expect(await homePresenter.userDataInitialSetup(client, mockApi), false);
    }, timeout: Timeout.factor(2));

    test(
        'check values after second run `userDataInitialSetup()` with error (Balance API Off!)',
        () async {
      /// Mock purchase status API [Ok]
      when(mockApi.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthPurchaseApi(httpClient: client), true);

      /// Mock balance purchase API [Off]
      when(mockApi.balancePurchaseApi(
        httpClient: client,
        accountId: config.accountUuid,
      )).thenAnswer((_) async => Future.delayed(timeRequest, () => null));

      expect(
        await mockApi.balancePurchaseApi(
          httpClient: client,
          accountId: config.accountUuid,
        ),
        null,
      );

      expect(await homePresenter.userDataInitialSetup(client, mockApi), false);
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
      config.balancesOpenValue = null;
      config.balancesOpenPercent = null;
      config.balancesOpenFlex = null;
      config.balancesAvailableValue = null;
      config.balancesAvailablePercent = null;
      config.balancesAvailableFlex = null;

      /// Mock SharedPreferences
      SharedPreferences.setMockInitialValues({});

      /// Mock Global Variables
      config.globalVariablesMock(isLoggedIn: false, config: config);
    });

    test('initial `sharedPrefs` TypeMatcher should be [SharedPreferences]', () {
      expect(
        HomePresenter.sharedPrefs,
        const matcher.TypeMatcher<SharedPreferences>(),
      );
    });

    test('check values after first run `userDataInitialSetup()` successfully',
        () async {
      /// Mock customer status API [Ok]
      when(mockApi.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthCustomerApi(httpClient: client), true);

      /// Mock account status API [Ok]
      when(mockApi.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthAccountApi(httpClient: client), true);

      /// Mock purchase status API [Ok]
      when(mockApi.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthPurchaseApi(httpClient: client), true);

      /// Mock customer register [Ok]
      when(mockApi.createCustomerApi(
        httpClient: client,
        customerData: newCustomerMock,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => customerRegisteredMock),
      );

      expect(
        await mockApi.createCustomerApi(
          httpClient: client,
          customerData: newCustomerMock,
        ),
        customerRegisteredMock,
      );

      /// Mock account register [Ok]
      when(mockApi.createAccountApi(
        httpClient: client,
        accountData: newAccountMock,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => accountRegisteredMock),
      );

      expect(
        await mockApi.createAccountApi(
          httpClient: client,
          accountData: newAccountMock,
        ),
        accountRegisteredMock,
      );

      expect(
        await homePresenter.userDataInitialSetup(
          client,
          mockApi,
          newCustomerMock,
          newAccountMock,
        ),
        true,
      );
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `userDataInitialSetup()` with error (Customer API Off!)',
        () async {
      /// Mock customer status API [Off]
      when(mockApi.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockApi.checkHealthCustomerApi(httpClient: client), false);

      expect(await homePresenter.userDataInitialSetup(client, mockApi), false);
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `userDataInitialSetup()` with error (Account API Off!)',
        () async {
      /// Mock account status API [Off]
      when(mockApi.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockApi.checkHealthAccountApi(httpClient: client), false);

      expect(await homePresenter.userDataInitialSetup(client, mockApi), false);
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `userDataInitialSetup()` with error (Purchase API Off!)',
        () async {
      /// Mock purchase status API [Off]
      when(mockApi.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockApi.checkHealthPurchaseApi(httpClient: client), false);

      expect(await homePresenter.userDataInitialSetup(client, mockApi), false);
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `userDataInitialSetup()` with error (Customer, Account and Purchase API Off!)',
        () async {
      /// Mock customer status API [Off]
      when(mockApi.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockApi.checkHealthCustomerApi(httpClient: client), false);

      /// Mock account status API [Off]
      when(mockApi.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockApi.checkHealthAccountApi(httpClient: client), false);

      /// Mock purchase status API [Off]
      when(mockApi.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => false));

      expect(await mockApi.checkHealthPurchaseApi(httpClient: client), false);

      expect(await homePresenter.userDataInitialSetup(client, mockApi), false);
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `userDataInitialSetup()` with error (Customer create API Off!)',
        () async {
      /// Mock customer status API [Ok]
      when(mockApi.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthCustomerApi(httpClient: client), true);

      /// Mock account status API [Ok]
      when(mockApi.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthAccountApi(httpClient: client), true);

      /// Mock purchase status API [Ok]
      when(mockApi.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthPurchaseApi(httpClient: client), true);

      /// Mock customer register [Off]
      when(mockApi.createCustomerApi(
        httpClient: client,
        customerData: newCustomerMock,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => null),
      );

      expect(
        await mockApi.createCustomerApi(
          httpClient: client,
          customerData: newCustomerMock,
        ),
        null,
      );

      expect(
        await homePresenter.userDataInitialSetup(
          client,
          mockApi,
          newCustomerMock,
        ),
        false,
      );
    }, timeout: Timeout.factor(2));

    test(
        'check values after first run `userDataInitialSetup()` with error (Account create API Off!)',
        () async {
      /// Mock customer status API [Ok]
      when(mockApi.checkHealthCustomerApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthCustomerApi(httpClient: client), true);

      /// Mock account status API [Ok]
      when(mockApi.checkHealthAccountApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthAccountApi(httpClient: client), true);

      /// Mock purchase status API [Ok]
      when(mockApi.checkHealthPurchaseApi(httpClient: client))
          .thenAnswer((_) async => Future.delayed(timeRequest, () => true));

      expect(await mockApi.checkHealthPurchaseApi(httpClient: client), true);

      /// Mock customer register [Ok]
      when(mockApi.createCustomerApi(
        httpClient: client,
        customerData: newCustomerMock,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => customerRegisteredMock),
      );

      expect(
        await mockApi.createCustomerApi(
          httpClient: client,
          customerData: newCustomerMock,
        ),
        customerRegisteredMock,
      );

      /// Mock account register [Off]
      when(mockApi.createAccountApi(
        httpClient: client,
        accountData: newAccountMock,
      )).thenAnswer(
        (_) async => Future.delayed(timeRequest, () => null),
      );

      expect(
        await mockApi.createAccountApi(
          httpClient: client,
          accountData: newAccountMock,
        ),
        null,
      );

      expect(
        await homePresenter.userDataInitialSetup(
          client,
          mockApi,
          newCustomerMock,
          newAccountMock,
        ),
        false,
      );
    }, timeout: Timeout.factor(2));
  }, timeout: Timeout.factor(2));
}
