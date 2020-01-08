import 'package:flutter/material.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/views/home_view.dart';
import 'package:nudemo/construction/presenter/construction_presenter.dart';
import 'package:nudemo/construction/views/construction_view.dart';
import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/card/views/card_view.dart';
import 'package:nudemo/nuconta/presenter/nuconta_presenter.dart';
import 'package:nudemo/nuconta/views/nuconta_view.dart';
import 'package:nudemo/rewards/presenter/rewards_presenter.dart';
import 'package:nudemo/rewards/views/rewards_view.dart';
import 'package:nudemo/signup/presenter/signup_presenter.dart';
import 'package:nudemo/signup/views/signup_view.dart';
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
        title: 'Home',
      ),
    ),
    // - First access (we don't cover that in this demo!)
    // '/register/': RegisterPage(),
    '/signup/': SlideTopRoute(
      page: SignupPage(
        presenter: SignupPresenter(),
        title: 'Sign Up',
      ),
    ),
    // - Carousel slider main blocks
    '/card/': ScaleRoute(
      page: CardPage(
        presenter: CardPresenter(),
        title: 'Cartão de crédito',
      ),
    ),
    '/nuconta/': ScaleRoute(
      page: NucontaPage(
        presenter: NucontaPresenter(),
        title: 'NuConta',
      ),
    ),
    '/rewards/': ScaleRoute(
      page: RewardsPage(
        presenter: RewardsPresenter(),
        title: 'Nubank rewards',
      ),
    ),
    // - All other pages
    '/helpme/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Me ajuda',
      ),
    ),
    '/profile/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Perfil',
      ),
    ),
    '/nuconta-configs/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Configurar NuConta',
      ),
    ),
    '/card-configs/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Configurar cartão',
      ),
    ),
    '/app-configs/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Configurações do app',
      ),
    ),
    '/transfer/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Transferir',
      ),
    ),
    '/virtual-card/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Cartão virtual',
      ),
    ),
    '/pay/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Pagar',
      ),
    ),
    '/blocking-card/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Bloquear cartão',
      ),
    ),
    '/deposit/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Depositar',
      ),
    ),
    '/charge/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Cobrar',
      ),
    ),
    '/mobile-recharge/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Recarga de celular',
      ),
    ),
    '/refer-friends/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Indicar amigos',
      ),
    ),
    '/adjust-limit/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Ajustar limite',
      ),
    ),
    '/organize-shortcuts/': SlideTopRoute(
      page: ConstructionPage(
        presenter: ConstructionPresenter(),
        title: 'Organizar atalhos',
      ),
    ),
  };
}
