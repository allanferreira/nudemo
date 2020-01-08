/// MVP Design Pattern
/// The presenter acts upon the `model` and the `view`. It retrieves data from
/// repositories (the `model`), and formats it for display in the `view`.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/signup/views/signup_view.dart';
import 'package:nudemo/signup/presenter/signup_presenter.dart';
import 'package:nudemo/themes/nu_default_theme.dart';
import 'package:nudemo/themes/nu_dark_theme.dart';
import 'package:nudemo/utils/model/customer_model.dart';
import 'package:nudemo/utils/model/account_model.dart';
import 'package:nudemo/utils/utils.dart';
import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/http.dart';
import 'package:nudemo/utils/globals.dart' as globals;

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class HomePresenter with ChangeNotifier {
  HomeViewModel _homeViewModel;
  Utils _utils = Utils();
  static SharedPreferences sharedPrefs;

  HomePresenter() {
    this._homeViewModel = HomeViewModel();
  }

  /// Check system brightness [platformBrightness]
  Brightness checkSystemBrightness({BuildContext context}) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool darkIsEnable = (brightness == Brightness.dark);
    setNuTheme(darkIsEnable: darkIsEnable);

    // print('Platform Brightness: $brightness');
    // print('darkIsEnable: $darkIsEnable');

    return brightness;
  }

  /// Setup the theme between light or dark
  void setNuTheme({bool darkIsEnable}) {
    if (this._homeViewModel.darkIsEnable != darkIsEnable) {
      this._homeViewModel.darkIsEnable = darkIsEnable;

      Future.delayed(
        const Duration(milliseconds: 500),
        () => notifyListeners(),
      );
    }
  }

  /// Get current system theme
  ThemeData getNuTheme() {
    /// Here there may be a calendar check if it's:
    /// - [CHRISTMAS];
    /// - [EASTER];
    /// - [MOTHERS DAY];
    /// - [VALENTINE'S DAY];
    /// and others... so, enable specific theme based on date.
    if (this._homeViewModel.darkIsEnable) {
      return getNuThemeFromKey(NuThemeKeys.DARK);
    }

    return getNuThemeFromKey(NuThemeKeys.DEFAULT);
  }

  /// Get theme by key
  ThemeData getNuThemeFromKey(NuThemeKeys themeKey) {
    switch (themeKey) {
      case NuThemeKeys.DARK:
        return nuDarkTheme;
      case NuThemeKeys.CHRISTMAS:
        return nuDefaultTheme; // Sorry! Not implemented yet 🤦‍♂
      case NuThemeKeys.CHRISTMAS_DARK:
        return nuDarkTheme; // Sorry! Not implemented yet 🤦‍♂
      default:
        return nuDefaultTheme;
    }
  }

  /// Set page index and notify listeners
  void setCurrentPageCarousel(int index) {
    this._homeViewModel.currentPageCarousel = index;
    // print('On the viewport: $index');

    notifyListeners();
  }

  /// Get initial page index in the center of the viewport.
  int getInitialPageCarousel() => this._homeViewModel.initialPageCarousel;

  /// Get current page index in the center of the viewport.
  int getCurrentPageCarousel() => this._homeViewModel.currentPageCarousel;

  /// Get dotted indicator color
  Color getDottedIndicatorColor({
    int index,
    Color activeColor,
    Color unactiveColor,
  }) =>
      this.getCurrentPageCarousel() == index ? activeColor : unactiveColor;

  /// Called whenever the page in the center of the viewport changes
  // static dynamic onTheViewport(BuildContext context, int index) =>
  //     Provider.of<HomePresenter>(context, listen: false)
  //         .setCurrentPageCarousel(index);

  /// Get the value of Balances Future Value
  double getFutureValue() => HomeViewModel.balancesFutureValue;

  /// Get the value of Balances Open Value
  double getOpenValue() => HomeViewModel.balancesOpenValue;

  /// Get the value of Balances Available Value
  double getAvailableValue() => HomeViewModel.balancesAvailableValue;

  /// Get the value of Balances Due Value
  double getDueValue() => HomeViewModel.balancesDueValue;

  /// Get the value of Balances Future Currency (R$)
  String getFutureCurrency() =>
      _utils.getCurrencyValue(HomeViewModel.balancesFutureValue);

  /// Get the value of Balances Open Currency (R$)
  String getOpenCurrency() =>
      _utils.getCurrencyValue(HomeViewModel.balancesOpenValue);

  /// Get the value of Balances Available Currency (R$)
  String getAvailableCurrency() =>
      _utils.getCurrencyValue(HomeViewModel.balancesAvailableValue);

  /// Get the value of Balances Due Currency
  double getDueCurrency() => HomeViewModel.balancesDueValue;

  /// Get the value of Balances Future Percent
  double getFuturePercent() => HomeViewModel.balancesFuturePercent;

  /// Get the value of Balances Open Percent
  double getOpenPercent() => HomeViewModel.balancesOpenPercent;

  /// Get the value of Balances Available Percent
  double getAvailablePercent() => HomeViewModel.balancesAvailablePercent;

  /// Get the value of Balances Due Percent
  double getDuePercent() => HomeViewModel.balancesDuePercent;

  /// Get the value of Balances Future Flex
  int getFutureFlex() => HomeViewModel.balancesFutureFlex;

  /// Get the value of Balances Open Flex
  int getOpenFlex() => HomeViewModel.balancesOpenFlex;

  /// Get the value of Balances Available Flex
  int getAvailableFlex() => HomeViewModel.balancesAvailableFlex;

  /// Get the value of Balances Due Flex
  int getDueFlex() => HomeViewModel.balancesDueFlex;

  /// Calculate `percentage` and `flex` values of balances
  void calculatePercentBalances({
    double limitValue = 0.0,
    double balancesFutureValue = 0.0,
    double balancesOpenValue = 0.0,
    double balancesAvailableValue = 0.0,
    double balancesDueValue = 0.0,
  }) {
    HomeViewModel.balancesFuturePercent =
        (HomeViewModel.balancesFutureValue / HomeViewModel.limitValue) * 100;
    HomeViewModel.balancesFutureFlex =
        HomeViewModel.balancesFuturePercent.round();

    HomeViewModel.balancesOpenPercent =
        (HomeViewModel.balancesOpenValue / HomeViewModel.limitValue) * 100;
    HomeViewModel.balancesOpenFlex = HomeViewModel.balancesOpenPercent.round();

    HomeViewModel.balancesAvailablePercent =
        (HomeViewModel.balancesAvailableValue / HomeViewModel.limitValue) * 100;
    HomeViewModel.balancesAvailableFlex =
        HomeViewModel.balancesAvailablePercent.round();

    HomeViewModel.balancesDuePercent =
        (HomeViewModel.balancesDueValue / HomeViewModel.limitValue) * 100;
    HomeViewModel.balancesDueFlex = HomeViewModel.balancesDuePercent.round();

    HomeViewModel.limitPercent = HomeViewModel.balancesFuturePercent +
        HomeViewModel.balancesOpenPercent +
        HomeViewModel.balancesAvailablePercent +
        HomeViewModel.balancesDuePercent;
  }

  /// Format currency for summary info box style
  /// Parameter currency should to be BRL format (x.xxx,xx)
  List<String> getFormattedCurrency({String currencyBRL}) {
    List<String> temp1 = [];
    List<String> temp2 = [];
    List<String> formatted = [];

    temp1 = currencyBRL.split('\u00a0');
    if (temp1.length == 2) {
      formatted.add(temp1[0]); // [R$]
      temp2 = temp1[1].split(",");

      if (temp2.length == 2) {
        formatted.addAll(temp1[1].split(",")); // [0.000],[00]
      }
    }

    return formatted.isNotEmpty ? formatted : [r'R$', '?', '??'];
  }

  /// Get last card register
  Map<String, dynamic> getLastCardRegister() => _homeViewModel.lastCardRegister;

  /// Get Customer and Account data from [Shared preferences], otherever
  /// register a new on API.
  /// - For this demo app, don't there is 'login system' or 'registration system'.
  /// - Case the customer isn't exist, the app send the default data for
  /// `createCustomerApi()` (the endpoint responsible for register new
  /// customers), and then the App use this register like the customer!
  /// - The same happens with account setup (using `createAccountApi()`)!
  /// - Balance is updated if customer already exists (using ``).
  Future<bool> initialUserData([
    httpClientMock,
    utilsHttpMock,
    newCustomerMock,
    newAccountMock,
  ]) async {
    // print('initialUserData: Check Customer and Account');

    http.Client httpClient = httpClientMock ?? http.Client();
    Http utilsHttp = utilsHttpMock ?? Http();
    sharedPrefs = await SharedPreferences.getInstance();

    globals.userUuid = sharedPrefs.getString('userUuid');
    globals.userName = sharedPrefs.getString('userName');
    globals.userNickname = sharedPrefs.getString('userNickname');
    globals.userEmail = sharedPrefs.getString('userEmail');
    globals.userPhone = sharedPrefs.getString('userPhone');

    globals.accountUuid = sharedPrefs.getString('accountUuid');
    globals.bankBranch = sharedPrefs.getString('bankBranch');
    globals.bankAccount = sharedPrefs.getString('bankAccount');
    globals.accountLimit = sharedPrefs.getDouble('accountLimit');

    // Registering a new customer and a new account,
    // if they are not already registered...
    if (globals.userUuid == null || globals.accountUuid == null) {
      // print('initialUserData: Register new Customer and Account');

      if (await utilsHttp.checkHealthCustomerApi(httpClient: httpClient) &&
          await utilsHttp.checkHealthAccountApi(httpClient: httpClient)) {
        Customer newCustomer = Customer(
          name: Config().userName,
          eMail: Config().userEmail,
          phone: Config().userPhone,
        );

        Customer regCustomer = await utilsHttp.createCustomerApi(
          httpClient: httpClient,
          customerData: newCustomerMock ?? newCustomer,
        );

        if (regCustomer != null && regCustomer.customerId != null) {
          // print('Create customer ID: ${regCustomer.customerId}');
          final List<String> userNickname = regCustomer.name.split(" ");

          Account newAccount = Account(
            customerId: regCustomer.customerId,
            bankBranch: Config().bankBranch,
            bankAccount: Config().bankAccount,
            limit: Config().accountLimit,
          );

          Account regAccount = await utilsHttp.createAccountApi(
            httpClient: httpClient,
            accountData: newAccountMock ?? newAccount,
          );

          if (regAccount != null && regAccount.accountId != null) {
            // print('Create account ID: ${regAccount.accountId}');

            globals.limitPercent = 100.0;
            globals.balancesOpenValue = 0.0;
            globals.balancesOpenPercent = 0.0;
            globals.balancesOpenFlex = 0;
            globals.balancesAvailableValue = globals.accountLimit;
            globals.balancesAvailablePercent = 100.0;
            globals.balancesAvailableFlex = 100;

            // Persist on device memory the Customer and Account data
            return (await sharedPrefs.setString(
                    'userUuid', regCustomer.customerId) &&
                await sharedPrefs.setString('userName', regCustomer.name) &&
                await sharedPrefs.setString('userNickname', userNickname[0]) &&
                await sharedPrefs.setString('userEmail', regCustomer.eMail) &&
                await sharedPrefs.setString('userPhone', regCustomer.phone) &&
                await sharedPrefs.setString(
                    'accountUuid', regAccount.accountId) &&
                await sharedPrefs.setString(
                    'bankBranch', regAccount.bankBranch) &&
                await sharedPrefs.setString(
                    'bankAccount', regAccount.bankAccount) &&
                await sharedPrefs.setDouble('accountLimit', regAccount.limit) &&
                await sharedPrefs.setDouble(
                    'limitPercent', globals.limitPercent) &&
                await sharedPrefs.setDouble(
                    'balancesOpenValue', globals.balancesOpenValue) &&
                await sharedPrefs.setDouble(
                    'balancesOpenPercent', globals.balancesOpenPercent) &&
                await sharedPrefs.setInt(
                    'balancesOpenFlex', globals.balancesOpenFlex) &&
                await sharedPrefs.setDouble(
                    'balancesAvailableValue', globals.balancesAvailableValue) &&
                await sharedPrefs.setDouble('balancesAvailablePercent',
                    globals.balancesAvailablePercent) &&
                await sharedPrefs.setInt(
                    'balancesAvailableFlex', globals.balancesAvailableFlex));
          }
        }
      }
    }

    //... Or, recover from device memory the Customer and Account data
    if (globals.userUuid != null && globals.accountUuid != null) {
      print('initialUserData: Recover existing Customer ID and Account ID');
      print('Customer ID: ${globals.userUuid}');
      print('Account ID: ${globals.accountUuid}');

      if (await utilsHttp.checkHealthPurchaseApi(httpClient: httpClient)) {
        // Get actualized balance
        print('Puchase API: Ok!');

        return true;
      }
    }
    return false;
  }

  /// Routing the user to [Sign Up] page or [Home] page
  Widget firstPage() {
    if (globals.isLoggedIn) {
      return HomePage(presenter: HomePresenter(), title: 'Home');
    }
    return SignupPage(presenter: SignupPresenter(), title: 'Sign Up');
  }
}
