/// MVP Design Pattern
/// The `model` is an interface defining the data to be displayed or
/// otherwise acted upon in the user interface.

class CardViewModel {
  // Carousel control
  int initialPageCarousel = 0;
  int currentPageCarousel = 0;

  static DateTime now = DateTime.now();
  final List<Map<String, dynamic>> cardHistoryItems = [
    {
      'type': 'income',
      'icon': null,
      'title': 'Pagamento recebido',
      'text': null,
      'money': 3195.96,
      'division': null,
      'date': DateTime(now.year, now.month, now.day, now.hour, now.minute)
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
      'date':
          DateTime(now.year, now.month, now.day, now.hour - 8, now.minute - 29)
              .toString(),
      'tags': '#Roupas👚,#Tag1🎅',
    },
    {
      'type': 'system',
      'icon': null,
      'title': 'Fatura fechada',
      'text': 'Vence em 22/12, e hoje é o melhor dia para compras.',
      'money': 3195.96,
      'division': null,
      'date': DateTime(now.year, now.month, now.day - 1).toString(),
      'tags': null,
    },
    {
      'type': 'expense',
      'icon': 58672, // Icons.directions_bus
      'title': 'Transporte',
      'text': 'Belcar Veiculos',
      'money': 48.00,
      'division': null,
      'date': DateTime(now.year, now.month, now.day - 3).toString(),
      'tags': '#Manutenção Carro🔧,#Tag1🎅,#Tag2🎄',
    },
    {
      'type': 'expense',
      'icon': 59596, // Icons.shopping_cart
      'title': 'Supermercado',
      'text': 'Distribuidora Souza',
      'money': 13.50,
      'division': null,
      'date': DateTime(now.year, now.month, now.day - 5).toString(),
      'tags': '#Bebidas🍹,#Tag2🎄',
    },
    {
      'type': 'expense',
      'icon': 58732, // Icons.restaurant
      'title': 'Restaurante',
      'text': 'D Salgados e Doces',
      'money': 5.50,
      'division': null,
      'date': DateTime(now.year, now.month, now.day - 7).toString(),
      'tags': '#Bebidas🍹',
    },
    {
      'type': 'expense',
      'icon': 58672, // Icons.directions_bus
      'title': 'Transporte',
      'text': 'Scp Estacionamento Goi',
      'money': 5.00,
      'division': null,
      'date': DateTime(now.year, now.month, now.day - 13).toString(),
      'tags': '#Parking🚏,#Tag2🎄',
    },
    {
      'type': 'income',
      'icon': null,
      'title': 'Pagamento recebido',
      'text': null,
      'money': null,
      'division': null,
      'date': DateTime(now.year, now.month - 1, now.day - 2).toString(),
      'tags': null,
    },
    {
      'type': 'expense',
      'icon': 59495, // Icons.bookmark_border
      'title': 'Outros',
      'text': 'Parcelamento de Fatura (22/Novembro)',
      'money': 516.39,
      'division': 'Em 3x',
      'date': DateTime(now.year, now.month - 1, now.day - 3).toString(),
      'tags': '#Parcelamento Cartão💸',
    },
    {
      'type': 'expense',
      'icon': 57824, // Icons.usb
      'title': 'Eletrônicos',
      'text': 'Pag*Visa',
      'money': 10.00,
      'division': null,
      'date': DateTime(now.year - 1, now.month - 3, now.day - 17).toString(),
      'tags': '#Brinquedos🎁',
    },
    {
      'type': 'expense',
      'icon': 58355, // Icons.healing
      'title': 'Saúde',
      'text': '2519drogasil',
      'money': 52.43,
      'division': null,
      'date': DateTime(now.year - 2, now.month - 1, now.day - 23).toString(),
      'tags': '#Remédios💊',
    },
  ];
}
