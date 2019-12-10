import 'package:flutter/material.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/construction/views/construction_view.dart';
import 'package:nudemo/utils/transitions/scale.dart';
import 'package:nudemo/utils/transitions/slide_top.dart';

class Routes {
  BuildContext context;
  Map<String, Widget Function(BuildContext)> namedRoutesMap = {};

  Routes(this.context);

  navigatorPush(
    BuildContext context,
    String routeName,
  ) {
    return Navigator.push(
      context,
      routePages[routeName],
    );
  }

  final Map<String, Route> routePages = {
    // - Backbone (Home page)
    '/': ScaleRoute(
      page: HomePage(
        presenter: HomePresenter(),
        title: '{Customer name}',
      ),
    ),
    // - First access (we don't cover that in this demo!)
    // '/register/': RegisterPage(),
    // '/signup/': SignUpPage(),
    // - Carousel slider main blocks
    '/card/': ScaleRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Cartão de crédito',
      ),
    ),
    '/nuconta/': ScaleRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'NuConta',
      ),
    ),
    '/rewards/': ScaleRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Nubank rewards',
      ),
    ),
    // - All other pages
    '/helpme/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Me ajuda',
      ),
    ),
    '/profile/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Perfil',
      ),
    ),
    '/nuconta-configs/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Configurar NuConta',
      ),
    ),
    '/card-configs/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Configurar cartão',
      ),
    ),
    '/app-configs/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Configurações do app',
      ),
    ),
    '/transfer/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Transferir',
      ),
    ),
    '/virtual-card/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Cartão virtual',
      ),
    ),
    '/pay/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Pagar',
      ),
    ),
    '/blocking-card/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Bloquear cartão',
      ),
    ),
    '/deposit/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Depositar',
      ),
    ),
    '/charge/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Cobrar',
      ),
    ),
    '/mobile-recharge/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Recarga de celular',
      ),
    ),
    '/refer-friends/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Indicar amigos',
      ),
    ),
    '/adjust-limit/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Ajustar limite',
      ),
    ),
    '/organize-shortcuts/': SlideTopRoute(
      page: ConstructionPage(
        presenter: BasicConstructionPresenter(),
        title: 'Organizar atalhos',
      ),
    ),
  };
}
