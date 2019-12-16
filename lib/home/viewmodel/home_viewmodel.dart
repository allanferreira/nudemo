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
  bool darkIsEnable = false;
  int initialPageCarousel = 0;
  int currentPageCarousel = 0;
}
