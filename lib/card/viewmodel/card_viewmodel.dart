/// MVP Design Pattern
/// The `model` is an interface defining the data to be displayed or
/// otherwise acted upon in the user interface.

class CardViewModel {
  // Notifications carousel control
  int initialPageCarousel = 0;
  int currentPageCarousel = 0;

  List<Map<String, dynamic>> cardHistoryItems = [];
}
