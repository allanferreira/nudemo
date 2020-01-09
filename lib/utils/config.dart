import 'package:nudemo/utils/globals.dart' as globals;

class Config {
  static String version = "1.0.1";

  /// Default data used to register new Customer 👤
  String userUuid;
  String userName = "Chinnon Santos";
  String userNickname = "Chinnon";
  String userEmail = "chinnonsantos@gmail.com";
  String userPhone = "11987654321";

  /// Default data used to register new Account 🏦
  String accountUuid;
  String bankBranch = "0001";
  String bankAccount = "1234567-8";
  double accountLimit = 15000.5;

  /// Data used by Mock tests (Mock Purchases 🛒)
  double balancesOpenValue = 5578.79;
  double balancesOpenPercent = 37.19069364354522;
  int balancesOpenFlex = 37;
  double balancesAvailableValue = 9421.71;
  double balancesAvailablePercent = 62.809306356454776;
  int balancesAvailableFlex = 63;

  /// SharedPreferences Mock Initial Values
  Map<String, dynamic> fullDataMock(Config config) => {
        "userUuid": config.userUuid,
        "userName": config.userName,
        "userNickname": config.userNickname,
        "userEmail": config.userEmail,
        "userPhone": config.userPhone,
        "accountUuid": config.accountUuid,
        "bankBranch": config.bankBranch,
        "bankAccount": config.bankAccount,
        "accountLimit": config.accountLimit,
        "balancesOpenValue": config.balancesOpenValue,
        "balancesOpenPercent": config.balancesOpenPercent,
        "balancesOpenFlex": config.balancesOpenFlex,
        "balancesAvailableValue": config.balancesAvailableValue,
        "balancesAvailablePercent": config.balancesAvailablePercent,
        "balancesAvailableFlex": config.balancesAvailableFlex,
      };

  /// Global Variables Mock Initial Values
  void globalVariablesMock({
    bool isLoggedIn = true,
    Config config,
  }) {
    globals.isLoggedIn = isLoggedIn;
    globals.userUuid = config.userUuid;
    globals.userName = config.userName;
    globals.userNickname = config.userNickname;
    globals.userEmail = config.userEmail;
    globals.userPhone = config.userPhone;
    globals.accountUuid = config.accountUuid;
    globals.bankBranch = config.bankBranch;
    globals.bankAccount = config.bankAccount;
    globals.accountLimit = config.accountLimit;
    globals.balancesOpenValue = config.balancesOpenValue;
    globals.balancesOpenPercent = config.balancesOpenPercent;
    globals.balancesOpenFlex = config.balancesOpenFlex;
    globals.balancesAvailableValue = config.balancesAvailableValue;
    globals.balancesAvailablePercent = config.balancesAvailablePercent;
    globals.balancesAvailableFlex = config.balancesAvailableFlex;
  }

  /// [Customer] EndPoints
  static int _customerPort = 9000;
  static String _customerIpDns = "http://192.168.0.104";
  // Check health
  static String get customerEndPoint => _customerIpDns + ":$_customerPort/";
  // Get customers list
  static String get customerListEndPoint => customerEndPoint + "customer/";
  // Get customer info (customer details)
  static String customerInfoEndPoint({String customerId = ':customer-id'}) =>
      customerEndPoint + "customer/$customerId/";
  // Create a customer
  static String get customerRegisterEndPoint => customerEndPoint + "customer/";

  /// [Account] EndPoints
  static int _accountPort = 9001;
  static String _accountIpDns = "http://192.168.0.104";
  // Check health
  static String get accountEndPoint => _accountIpDns + ":$_accountPort/";
  // Get accounts list
  static String get accountListEndPoint => accountEndPoint + "account/";
  // Get account info (account details)
  static String accountInfoEndPoint({String accountId = ':account-id'}) =>
      accountEndPoint + "account/$accountId/";
  // Get account info by customer ID (account details)
  static String accountInfoByCustomer({String customerId = ':customer-id'}) =>
      accountEndPoint + "account/from-customer/$customerId/";
  // Create an account
  static String get accountRegisterEndPoint => accountEndPoint + "account/";

  /// [Purchase] EndPoints
  static int _purchasePort = 9002;
  static String _purchaseIpDns = "http://192.168.0.104";
  // Check health
  static String get purchaseEndPoint => _purchaseIpDns + ":$_purchasePort/";
  // Get balance
  static String purchaseBalanceEndPoint({String accountId = ':account-id'}) =>
      purchaseEndPoint + "balance/$accountId/";
  // Get purchase list (from account ID)
  static String purchaseListEndPoint({
    String accountId = ':account-id',
    List<String> tags = const [],
  }) {
    String filters = "";
    if (tags.isNotEmpty) {
      filters = "?" + tags.map((name) => "tag=$name").join("&");
    }
    return purchaseEndPoint + "purchase/from-account/$accountId/$filters";
  }

  // Get purchase info (purchase details)
  static String purchaseInfoEndPoint({String purchaseId = ':purchase-id'}) =>
      purchaseEndPoint + "purchase/$purchaseId/";
  // Create a purchase
  static String get purchaseRegisterEndPoint => purchaseEndPoint + "purchase/";
}
