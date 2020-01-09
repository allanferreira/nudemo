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
  double balancesOpenValue = 0.0;
  double balancesOpenPercent = 0.0;
  int balancesOpenFlex = 0;
  double balancesAvailableValue = 0.0;
  double balancesAvailablePercent = 0.0;
  int balancesAvailableFlex = 0;
  // We don't cover balancesFuture and balancesDue in this demo!
  double limitValue = 0.0;
  double limitPercent = 100.0;
  double balancesFutureValue = 0.0;
  double balancesFuturePercent = 0.0;
  int balancesFutureFlex = 0;
  double balancesDueValue = 0.0;
  double balancesDuePercent = 0.0;
  int balancesDueFlex = 0;

  // Last card register
  Map<String, dynamic> lastCardRegister = {
    'icon': 57746,
    'text': 'Aguardando a sua primeira compra com o cartão',
  };
}
