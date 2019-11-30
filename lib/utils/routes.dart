import 'package:flutter/widgets.dart';

import 'package:nudemo/home/presenter/counter_presenter.dart';
import 'package:nudemo/home/views/counter_view.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  // - Backbone (Home page)
  '/': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'NU {customer}',
      ),
  // - First access (we don't cover that in this demo!)
  // '/register': (BuildContext context) => RegisterPage(),
  // '/signup': (BuildContext context) => SignUpPage(),
  // - Carousel slider main blocks
  '/credit-card': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Cartão de crédito',
      ),
  '/nuconta': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'NuConta',
      ),
  '/rewards': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Nubank rewards',
      ),
  // - All other pages
  '/helpme': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Me ajuda',
      ),
  '/account': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Perfil',
      ),
  '/nuconta-configs': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Configurar NuConta',
      ),
  '/credit-card-configs': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Configurar cartão',
      ),
  '/app-configs': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Configurações do app',
      ),
  '/transfer': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Transferir',
      ),
  '/virtual-credit-card': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Cartão virtual',
      ),
  '/pay': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Pagar',
      ),
  '/blocking-credit-card': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Bloquear cartão',
      ),
  '/deposit': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Depositar',
      ),
  '/charge': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Cobrar',
      ),
  '/mobile-recharge': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Recarga de celular',
      ),
  '/refer-friends': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Indicar amigos',
      ),
  '/adjust-limit': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Ajustar limite',
      ),
  '/organize-shortcuts': (BuildContext context) => MyHomePage(
        BasicCounterPresenter(),
        title: 'Organizar atalhos',
      ),
};
