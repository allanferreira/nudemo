/// MVP Design Pattern
/// The `model` is an interface defining the data to be displayed or
/// otherwise acted upon in the user interface.

class CardViewModel {
  // Carousel control
  int initialPageCarousel = 0;
  int currentPageCarousel = 0;

  // final List<Map<String, dynamic>> testItens = [
  //   {
  //     'type': 'income',
  //     'icon': null,
  //     'title': 'Pagamento recebido',
  //     'text': null,
  //     'value': r'R$ 1.179,90',
  //     'division': null,
  //     'tags': null,
  //   },
  //   {
  //     'type': 'expense',
  //     'icon': 60233, // Icons.build
  //     'title': 'Serviços',
  //     'text': 'Pag*Marcus',
  //     'value': r'R$ 20,00',
  //     'division': null,
  //     'tags': '#Roupas👚',
  //   },
  //   {
  //     'type': 'system',
  //     'icon': null,
  //     'title': 'Fatura fechada',
  //     'text': 'Vence em 22/12, e hoje é o melhor dia para compras.',
  //     'value': r'R$ 1.179,90',
  //     'division': null,
  //     'tags': null,
  //   },
  //   {
  //     'type': 'expense',
  //     'icon': 58672, // Icons.directions_bus
  //     'title': 'Transporte',
  //     'text': 'Belcar Veiculos',
  //     'value': r'R$ 48,00',
  //     'division': null,
  //     'tags': '#Manutenção Carro🔧',
  //   },
  //   {
  //     'type': 'expense',
  //     'icon': 59596, // Icons.shopping_cart
  //     'title': 'Supermercado',
  //     'text': 'Distribuidora Souza',
  //     'value': r'R$ 13,50',
  //     'division': null,
  //     'tags': '#Bebidas🍹',
  //   },
  //   {
  //     'type': 'expense',
  //     'icon': 58732, // Icons.restaurant
  //     'title': 'Restaurante',
  //     'text': 'D Salgados e Doces',
  //     'value': r'R$ 5,50',
  //     'division': null,
  //     'tags': '#Bebidas🍹',
  //   },
  //   {
  //     'type': 'expense',
  //     'icon': 58672, // Icons.directions_bus
  //     'title': 'Transporte',
  //     'text': 'Scp Estacionamento Goi',
  //     'value': r'R$ 5,00',
  //     'division': null,
  //     'tags': '#Parking🚏',
  //   },
  //   {
  //     'type': 'income',
  //     'icon': null,
  //     'title': 'Pagamento recebido',
  //     'text': null,
  //     'value': null,
  //     'division': null,
  //     'tags': null,
  //   },
  //   {
  //     'type': 'expense',
  //     'icon': 59101, // Icons.bookmark_border
  //     'title': 'Outros',
  //     'text': 'Parcelamento de Fatura (22/Novembro)',
  //     'value': r'R$ 516,39',
  //     'division': 'Em 3x',
  //     'tags': '#Parcelamento Cartão💸',
  //   },
  //   {
  //     'type': 'expense',
  //     'icon': 57824, // Icons.usb
  //     'title': 'Eletrônicos',
  //     'text': 'Pag*Visa',
  //     'value': r'R$ 10,00',
  //     'division': null,
  //     'tags': '#Brinquedos🎁',
  //   },
  //   {
  //     'type': 'expense',
  //     'icon': 58355, // Icons.healing
  //     'title': 'Saúde',
  //     'text': '2519drogasil',
  //     'value': r'R$ 52,43',
  //     'division': null,
  //     'tags': '#Remédios💊',
  //   },
  // ];

  final List<String> generateItems =
      List<String>.generate(10, (index) => "Item $index");
}
