import 'package:flutter/material.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/construction/views/construction_view.dart';
import 'package:nudemo/utils/transitions/scale.dart';
import 'package:nudemo/utils/transitions/slide_top.dart';

class Routes {
  Routes(this.context);

  BuildContext context;

  navigatorPush(
    BuildContext context,
    String routeName,
  ) {
    // Widget page = routes[routeName];
    return Navigator.push(
      context,
      routes[routeName],
    );
  }

  final Map<String, Route> routes = {
    // - Backbone (Home page)
    '/': ScaleRoute(
      page: HomePage(
        HomePresenter(),
        title: 'NU {customer}',
      ),
    ),
    // - First access (we don't cover that in this demo!)
    // '/register/': RegisterPage(),
    // '/signup/': SignUpPage(),
    // - Carousel slider main blocks
    '/credit-card/': ScaleRoute(
      page: ConstructionPage(
        BasicConstructionPresenter(),
        title: 'Cartão de crédito',
      ),
    ),
    '/nuconta/': ScaleRoute(
      page: ConstructionPage(
        BasicConstructionPresenter(),
        title: 'NuConta',
      ),
    ),
    '/rewards/': ScaleRoute(
      page: ConstructionPage(
        BasicConstructionPresenter(),
        title: 'Nubank rewards',
      ),
    ),
    // - All other pages
    '/helpme/': SlideTopRoute(
      page: ConstructionPage(
        BasicConstructionPresenter(),
        title: 'Me ajuda',
      ),
    ),
    // '/account/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Perfil',
    //   ),
    // ),
    // '/nuconta-configs/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Configurar NuConta',
    //   ),
    // ),
    // '/credit-card-configs/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Configurar cartão',
    //   ),
    // ),
    // '/app-configs/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Configurações do app',
    //   ),
    // ),
    // '/transfer/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Transferir',
    //   ),
    // ),
    // '/virtual-credit-card/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Cartão virtual',
    //   ),
    // ),
    // '/pay/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Pagar',
    //   ),
    // ),
    // '/blocking-credit-card/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Bloquear cartão',
    //   ),
    // ),
    // '/deposit/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Depositar',
    //   ),
    // ),
    // '/charge/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Cobrar',
    //   ),
    // ),
    // '/mobile-recharge/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Recarga de celular',
    //   ),
    // ),
    // '/refer-friends/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Indicar amigos',
    //   ),
    // ),
    // '/adjust-limit/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Ajustar limite',
    //   ),
    // ),
    // '/organize-shortcuts/': SlideTopRoute(
    //   page: ConstructionPage(
    //     BasicConstructionPresenter(),
    //     title: 'Organizar atalhos',
    //   ),
    // ),
  };
}
