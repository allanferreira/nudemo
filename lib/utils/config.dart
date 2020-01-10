import 'package:nudemo/home/viewmodel/home_viewmodel.dart';
import 'package:nudemo/utils/globals.dart' as globals;

class Config {
  static String version = "1.0.1";
  static DateTime _now = DateTime.now();

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
  List<Map<String, dynamic>> cardHistoryItems = [
    {
      'type': 'income',
      'icon': null,
      'title': 'Pagamento recebido',
      'text': null,
      'money': 3195.96,
      'division': null,
      'date': DateTime(_now.year, _now.month, _now.day, _now.hour, _now.minute)
          .toString(),
      'tags': null,
    },
    {
      'type': 'expense',
      'icon': 59497, // Icons.build
      'title': 'Serviços',
      'text': 'Pag*Marcus',
      'money': 20.00,
      'division': null,
      'date': DateTime(
              _now.year, _now.month, _now.day, _now.hour - 8, _now.minute - 29)
          .toString(),
      'tags': '#Roupas👚 #Tag1🎅',
    },
    {
      'type': 'system',
      'icon': null,
      'title': 'Fatura fechada',
      'text': 'Vence em 22/12, e hoje é o melhor dia para compras.',
      'money': 3195.96,
      'division': null,
      'date': DateTime(_now.year, _now.month, _now.day - 1).toString(),
      'tags': null,
    },
    {
      'type': 'expense',
      'icon': 58672, // Icons.directions_bus
      'title': 'Transporte',
      'text': 'Belcar Veiculos',
      'money': 48.00,
      'division': null,
      'date': DateTime(_now.year, _now.month, _now.day - 3).toString(),
      'tags': '#Manutenção Carro🔧 #Tag1🎅 #Tag2🎄',
    },
    {
      'type': 'expense',
      'icon': 59596, // Icons.shopping_cart
      'title': 'Supermercado',
      'text': 'Distribuidora Souza',
      'money': 13.50,
      'division': null,
      'date': DateTime(_now.year, _now.month, _now.day - 5).toString(),
      'tags': '#Bebidas🍹 #Tag2🎄',
    },
    {
      'type': 'expense',
      'icon': 58732, // Icons.restaurant
      'title': 'Restaurante',
      'text': 'D Salgados e Doces',
      'money': 5.50,
      'division': null,
      'date': DateTime(_now.year, _now.month, _now.day - 7).toString(),
      'tags': '#Bebidas🍹',
    },
    {
      'type': 'expense',
      'icon': 58672, // Icons.directions_bus
      'title': 'Transporte',
      'text': 'Scp Estacionamento Goi',
      'money': 5.00,
      'division': null,
      'date': DateTime(_now.year, _now.month, _now.day - 13).toString(),
      'tags': '#Parking🚏 #Tag2🎄',
    },
    {
      'type': 'income',
      'icon': null,
      'title': 'Pagamento recebido',
      'text': null,
      'money': null,
      'division': null,
      'date': DateTime(_now.year, _now.month - 1, _now.day - 2).toString(),
      'tags': null,
    },
    {
      'type': 'expense',
      'icon': 59495, // Icons.bookmark_border
      'title': 'Outros',
      'text': 'Parcelamento de Fatura (22/Novembro)',
      'money': 516.39,
      'division': 'Em 3x',
      'date': DateTime(_now.year, _now.month - 1, _now.day - 3).toString(),
      'tags': '#Parcelamento Cartão💸',
    },
    {
      'type': 'expense',
      'icon': 57824, // Icons.usb
      'title': 'Eletrônicos',
      'text': 'Pag*Visa',
      'money': 10.00,
      'division': null,
      'date': DateTime(_now.year - 1, _now.month - 3, _now.day - 17).toString(),
      'tags': '#Brinquedos🎁',
    },
    {
      'type': 'expense',
      'icon': 58355, // Icons.healing
      'title': 'Saúde',
      'text': '2519drogasil',
      'money': 52.43,
      'division': null,
      'date': DateTime(_now.year - 2, _now.month - 1, _now.day - 23).toString(),
      'tags': '#Remédios💊',
    },
  ];

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

  /// homeViewModel Mock Initial Values
  HomeViewModel homeViewModelMock(
    HomeViewModel homeViewModelMock, [
    bool darkIsEnable = false,
  ]) {
    homeViewModelMock.darkIsEnable = darkIsEnable;
    homeViewModelMock.initialPageCarousel = 0;
    homeViewModelMock.currentPageCarousel = 0;
    homeViewModelMock.balancesOpenValue = Config().balancesOpenValue;
    homeViewModelMock.balancesOpenPercent = Config().balancesOpenPercent;
    homeViewModelMock.balancesOpenFlex = Config().balancesOpenFlex;
    homeViewModelMock.balancesAvailableValue = Config().balancesAvailableValue;
    homeViewModelMock.balancesAvailablePercent =
        Config().balancesAvailablePercent;
    homeViewModelMock.balancesAvailableFlex = Config().balancesAvailableFlex;
    return homeViewModelMock;
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
