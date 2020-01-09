/// MVP Design Pattern
/// The `model` is an interface defining the data to be displayed or
/// otherwise acted upon in the user interface.

enum NuThemeKeys {
  DEFAULT,
  DARK,
  CHRISTMAS,
  CHRISTMAS_DARK,
}

class HomeViewModel {
  // Theme control
  bool darkIsEnable = false;

  // Carousel control
  int initialPageCarousel = 0;
  int currentPageCarousel = 0;

  // Balances control
  static double balancesOpenValue = 5578.79;
  static double balancesOpenPercent = 37.19069364354522;
  static int balancesOpenFlex = 37;
  static double balancesAvailableValue = 9421.71;
  static double balancesAvailablePercent = 62.809306356454776;
  static int balancesAvailableFlex = 63;
  // We don't cover balancesFuture and balancesDue in this demo!
  static double limitValue = 15000.5;
  static double limitPercent = 100.0;
  static double balancesFutureValue = 0.0;
  static double balancesFuturePercent = 0.0;
  static int balancesFutureFlex = 0;
  static double balancesDueValue = 0.0;
  static double balancesDuePercent = 0.0;
  static int balancesDueFlex = 0;

  // Last card register
  Map<String, dynamic> lastCardRegister = {
    'icon': 57746,
    'text': 'Aguardando a sua primeira compra com o cartão',
  };
}
