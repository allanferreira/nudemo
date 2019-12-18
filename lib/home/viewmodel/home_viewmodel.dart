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
  double limitValue = 15000.00;
  double limitPercent = 100.00;
  double balancesFutureValue = 1529.98;
  double balancesFuturePercent;
  int balancesFutureFlex;
  double balancesOpenValue = 5578.79;
  double balancesOpenPercent;
  int balancesOpenFlex;
  double balancesAvailableValue = 7891.23;
  double balancesAvailablePercent;
  int balancesAvailableFlex;
  // We don't cover dues in this demo!
  double balancesDueValue = 0;
  double balancesDuePercent = 0;
  int balancesDueFlex = 0;

  // Last card register
  Map<String, dynamic> lastCardRegister = {
    'icon': 57746,
    'text': 'Aguardando a sua primeira compra com o cartão',
  };
}
