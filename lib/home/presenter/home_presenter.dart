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
  double getFutureValue() => this._homeViewModel.balancesFutureValue;

  /// Get the value of Balances Open Value
  double getOpenValue() => this._homeViewModel.balancesOpenValue;

  /// Get the value of Balances Available Value
  double getAvailableValue() => this._homeViewModel.balancesAvailableValue;

  /// Get the value of Balances Due Value
  double getDueValue() => this._homeViewModel.balancesDueValue;

  /// Get the value of Balances Future Currency (R$)
  String getFutureCurrency() =>
      _utils.getCurrencyValue(this._homeViewModel.balancesFutureValue);

  /// Get the value of Balances Open Currency (R$)
  String getOpenCurrency() =>
      _utils.getCurrencyValue(this._homeViewModel.balancesOpenValue);

  /// Get the value of Balances Available Currency (R$)
  String getAvailableCurrency() =>
      _utils.getCurrencyValue(this._homeViewModel.balancesAvailableValue);

  /// Get the value of Balances Due Currency
  double getDueCurrency() => this._homeViewModel.balancesDueValue;

  /// Get the value of Balances Future Percent
  double getFuturePercent() => this._homeViewModel.balancesFuturePercent;

  /// Get the value of Balances Open Percent
  double getOpenPercent() => this._homeViewModel.balancesOpenPercent;

  /// Get the value of Balances Available Percent
  double getAvailablePercent() => this._homeViewModel.balancesAvailablePercent;

  /// Get the value of Balances Due Percent
  double getDuePercent() => this._homeViewModel.balancesDuePercent;

  /// Get the value of Balances Future Flex
  int getFutureFlex() => this._homeViewModel.balancesFutureFlex;

  /// Get the value of Balances Open Flex
  int getOpenFlex() => this._homeViewModel.balancesOpenFlex;

  /// Get the value of Balances Available Flex
  int getAvailableFlex() => this._homeViewModel.balancesAvailableFlex;

  /// Get the value of Balances Due Flex
  int getDueFlex() => this._homeViewModel.balancesDueFlex;

  /// Calculate `percentage` and `flex` values of balances
  void calculatePercentBalances() {
    if (this._homeViewModel.limitValue > 0.0) {
      // We don't cover balancesFuture and balancesDue in this demo!

      if (this._homeViewModel.balancesOpenValue > 0.0) {
        globals.balancesOpenPercent = (this._homeViewModel.balancesOpenValue /
                this._homeViewModel.limitValue) *
            100;
        globals.balancesOpenFlex = globals.balancesOpenPercent.round();
      } else {
        globals.balancesOpenPercent = 0.0;
        globals.balancesOpenFlex = 0;
      }

      if (this._homeViewModel.balancesAvailableValue > 0.0) {
        globals.balancesAvailablePercent =
            (this._homeViewModel.balancesAvailableValue /
                    this._homeViewModel.limitValue) *
                100;
        globals.balancesAvailableFlex =
            globals.balancesAvailablePercent.round();
      } else {
        globals.balancesAvailablePercent = 0.0;
        globals.balancesAvailablePercent = 0;
      }
    } else {
      globals.balancesOpenPercent = 0.0;
      globals.balancesOpenFlex = 0;
      globals.balancesAvailablePercent = 0.0;
      globals.balancesAvailablePercent = 0;
    }
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
  Future<bool> initialUserData(
    http.Client httpClient,
    Http utilsHttp, [
    Customer newCustomerMock,
    Account newAccountMock,
  ]) async {
    // Recover from device memory the Customer and Account data...
    sharedPrefs = await _getDataFromSharedPreferences();

    // Recovered existing Customer ID and Account ID,
    // if they are registered...
    if (globals.userUuid != null && globals.accountUuid != null) {
      return true;
    }
    // ... or, registering a new Customer and a new Account,
    // if they are not already registered...
    else {
      if (await utilsHttp.checkHealthCustomerApi(httpClient: httpClient) &&
          await utilsHttp.checkHealthAccountApi(httpClient: httpClient) &&
          await utilsHttp.checkHealthPurchaseApi(httpClient: httpClient)) {
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
            // Saving the initial balance with 100% of limit
            globals.balancesOpenValue = 0.0;
            globals.balancesOpenPercent = 0.0;
            globals.balancesOpenFlex = 0;
            globals.balancesAvailableValue = globals.accountLimit;
            globals.balancesAvailablePercent = 100.0;
            globals.balancesAvailableFlex = 100;

            // Persist on device memory the Customer and Account data
            return _saveDataToSharedPreferences(
              sharedPrefs,
              regCustomer,
              regAccount,
            );
          }
        }
      }
    }
    return false;
  }

  /// Get Customer and Account data from [SharedPreferences]
  Future<SharedPreferences> _getDataFromSharedPreferences() async {
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

    globals.balancesOpenValue = sharedPrefs.getDouble('balancesOpenValue');
    globals.balancesOpenPercent = sharedPrefs.getDouble('balancesOpenPercent');
    globals.balancesOpenFlex = sharedPrefs.getInt('balancesOpenFlex');
    globals.balancesAvailableValue =
        sharedPrefs.getDouble('balancesAvailableValue');
    globals.balancesAvailablePercent =
        sharedPrefs.getDouble('balancesAvailablePercent');
    globals.balancesAvailableFlex = sharedPrefs.getInt('balancesAvailableFlex');

    return sharedPrefs;
  }

  /// Save Customer and Account data to [SharedPreferences]
  Future<bool> _saveDataToSharedPreferences(
      sharedPrefs, regCustomer, regAccount) async {
    final List<String> userNickname = regCustomer.name.split(" ");

    return (await sharedPrefs.setString('userUuid', regCustomer.customerId) &&
        await sharedPrefs.setString('userName', regCustomer.name) &&
        await sharedPrefs.setString('userNickname', userNickname[0]) &&
        await sharedPrefs.setString('userEmail', regCustomer.eMail) &&
        await sharedPrefs.setString('userPhone', regCustomer.phone) &&
        await sharedPrefs.setString('accountUuid', regAccount.accountId) &&
        await sharedPrefs.setString('bankBranch', regAccount.bankBranch) &&
        await sharedPrefs.setString('bankAccount', regAccount.bankAccount) &&
        await sharedPrefs.setDouble('accountLimit', regAccount.limit) &&
        await sharedPrefs.setDouble(
            'balancesOpenValue', globals.balancesOpenValue) &&
        await sharedPrefs.setDouble(
            'balancesOpenPercent', globals.balancesOpenPercent) &&
        await sharedPrefs.setInt(
            'balancesOpenFlex', globals.balancesOpenFlex) &&
        await sharedPrefs.setDouble(
            'balancesAvailableValue', globals.balancesAvailableValue) &&
        await sharedPrefs.setDouble(
            'balancesAvailablePercent', globals.balancesAvailablePercent) &&
        await sharedPrefs.setInt(
            'balancesAvailableFlex', globals.balancesAvailableFlex));
  }

  /// Routing the user to [Sign Up] page or [Home] page
  Widget firstPage() {
    if (globals.isLoggedIn) {
      return HomePage(presenter: HomePresenter(), title: 'Home');
    }
    return SignupPage(presenter: SignupPresenter(), title: 'Sign Up');
  }
}
