import 'package:flutter/material.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/construction/views/construction_view.dart';

class Routes {
  Routes(this.context);

  BuildContext context;

  Future<Navigator> navigatorPush(
    BuildContext context,
    String routeName,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: routes[routeName],
      ),
    );
  }

  final Map<String, Widget Function(BuildContext)> routes = {
    // - Backbone (Home page)
    '/': (BuildContext context) => HomePage(
          HomePresenter(),
          title: 'NU {customer}',
        ),
    // - First access (we don't cover that in this demo!)
    // '/register': (BuildContext context) => RegisterPage(),
    // '/signup': (BuildContext context) => SignUpPage(),
    // - Carousel slider main blocks
    '/credit-card': (BuildContext context) => ConstructionPage(
          BasicConstructionPresenter(),
          title: 'Cartão de crédito',
        ),
    '/nuconta': (BuildContext context) => ConstructionPage(
          BasicConstructionPresenter(),
          title: 'NuConta',
        ),
    '/rewards': (BuildContext context) => ConstructionPage(
          BasicConstructionPresenter(),
          title: 'Nubank rewards',
        ),
    // - All other pages
    // '/helpme': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Me ajuda',
    //     ),
    // '/account': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Perfil',
    //     ),
    // '/nuconta-configs': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Configurar NuConta',
    //     ),
    // '/credit-card-configs': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Configurar cartão',
    //     ),
    // '/app-configs': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Configurações do app',
    //     ),
    // '/transfer': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Transferir',
    //     ),
    // '/virtual-credit-card': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Cartão virtual',
    //     ),
    // '/pay': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Pagar',
    //     ),
    // '/blocking-credit-card': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Bloquear cartão',
    //     ),
    // '/deposit': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Depositar',
    //     ),
    // '/charge': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Cobrar',
    //     ),
    // '/mobile-recharge': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Recarga de celular',
    //     ),
    // '/refer-friends': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Indicar amigos',
    //     ),
    // '/adjust-limit': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Ajustar limite',
    //     ),
    // '/organize-shortcuts': (BuildContext context) => ConstructionPage(
    //       BasicConstructionPresenter(),
    //       title: 'Organizar atalhos',
    //     ),
  };
}
