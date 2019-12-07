/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';

import 'package:nudemo/utils/routes.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  final String title;

  HomePage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final EdgeInsets screenNotch = MediaQuery.of(context).padding;
    final double totalNotch = screenNotch.top + screenNotch.bottom;

    final double topLogoHeight = 100.0;
    final double bottomMenuHeight = 120.0;
    final double mainContainerHeight =
        screenHeight - topLogoHeight - totalNotch;
    final double boxSlideHeight =
        screenHeight - topLogoHeight - bottomMenuHeight - totalNotch;

    final Widget dividerList = Divider(
      height: 2,
      color: Theme.of(context).primaryColorLight,
    );

    bool _isSlideDown = false;

    /// `Section I` - Logo container
    final Widget _logoContainer = Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: screenWidth,
        height: topLogoHeight,
        color: Colors.orangeAccent,
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_white.png',
                    key: Key('logo'),
                    width: 50,
                    color: Theme.of(context).accentColor,
                  ),
                  Container(
                    width: 6,
                  ),
                  Text(
                    title,
                    key: Key('title-text'),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Icon(_isSlideDown
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
            ],
          ),
          onTap: () => print('Logo tapped!'),
        ),
      ),
    );

    // Text builder for QR-Code container (Section II)
    Widget _buildRichText({String txtNormal, String txtBold}) {
      return RichText(
        text: TextSpan(
          text: txtNormal,
          style: TextStyle(
            fontSize: 12,
          ),
          children: <TextSpan>[
            TextSpan(
              text: txtBold,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    // QR-Code container (Section II)
    final Widget _qrCodeContainer = Container(
      color: Colors.black38,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          Center(
            child: FlutterLogo(size: 120),
          ),
          _buildRichText(
            txtNormal: 'Banco ',
            txtBold: '260 - Nu Pagamentos S.A.',
          ),
          _buildRichText(
            txtNormal: 'Agência ',
            txtBold: '0001',
          ),
          _buildRichText(
            txtNormal: 'Conta ',
            txtBold: '4587XXX-2',
          ),
        ],
      ),
    );

    Widget _buildItemListMenu(
        {Widget img, String title, String subtitle, String route}) {
      if (subtitle != null) {
        return ListTile(
          key: Key(route),
          leading: img,
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.keyboard_arrow_right),
          dense: true,
          contentPadding: EdgeInsets.all(0),
          onTap: () => Routes(context).navigatorPush(context, route),
        );
      }
      return ListTile(
        key: Key(route),
        leading: img,
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right),
        dense: true,
        contentPadding: EdgeInsets.all(0),
        onTap: () => Routes(context).navigatorPush(context, route),
      );
    }

    /// `Section II` - Main menu container
    final Widget _mainMenuList = Positioned(
      left: 0,
      top: topLogoHeight,
      width: screenWidth,
      height: mainContainerHeight,
      child: Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 0,
        ),
        color: Colors.indigo,
        child: ListView(
          children: <Widget>[
            _qrCodeContainer,
            dividerList,
            _buildItemListMenu(
              img: FlutterLogo(),
              title: 'Me ajuda',
              subtitle: null,
              route: '/helpme/',
            ),
            dividerList,
            _buildItemListMenu(
              img: FlutterLogo(),
              title: 'Perfil',
              subtitle: 'Nome de preferência, telefone, e-mail',
              route: '/profile/',
            ),
            dividerList,
            _buildItemListMenu(
              img: FlutterLogo(),
              title: 'Configurar NuConta',
              subtitle: null,
              route: '/nuconta-configs/',
            ),
            dividerList,
            _buildItemListMenu(
              img: FlutterLogo(),
              title: 'Configurar cartão',
              subtitle: null,
              route: '/card-configs/',
            ),
            dividerList,
            _buildItemListMenu(
              img: FlutterLogo(),
              title: 'Configurações do app',
              subtitle: null,
              route: '/app-configs/',
            ),
            dividerList,
            Divider(
              height: 15,
              color: Colors.transparent,
            ),
            RaisedButton(
              key: Key('/exit/'),
              padding: EdgeInsets.all(12),
              onPressed: null,
              child: Text('Sair da conta'.toUpperCase()),
            ),
            Divider(
              height: bottomMenuHeight,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );

    /// This list of custom data per customer can come from remote
    /// source (HTTP) or from local persistence 😉
    List<Map<String, dynamic>> _userButtonList = [
      {
        'icon': 57895,
        'txt': 'Transferir',
        'onTapRoute': '/transfer/',
      },
      {
        'icon': 59504,
        'txt': 'Cartão virtual',
        'onTapRoute': '/virtual-card/',
      },
      {
        'icon': 58344,
        'txt': 'Pagar',
        'onTapRoute': '/pay/',
      },
      {
        'icon': 59544,
        'txt': 'Bloquear cartão',
        'onTapRoute': '/blocking-card/',
      },
      {
        'icon': 59471,
        'txt': 'Depositar',
        'onTapRoute': '/deposit/',
      },
      {
        'icon': 59472,
        'txt': 'Cobrar',
        'onTapRoute': '/charge/',
      },
      {
        'icon': 58149,
        'txt': 'Recarga de celular',
        'onTapRoute': '/mobile-recharge/',
      },
      {
        'icon': 59390,
        'txt': 'Indicar amigos',
        'onTapRoute': '/refer-friends/',
      },
      {
        'icon': 59584,
        'txt': 'Ajustar limite',
        'onTapRoute': '/adjust-limit/',
      },
      {
        'icon': 57922,
        'txt': 'Organizar atalhos',
        'onTapRoute': '/organize-shortcuts/',
      },
    ];

    // Builder buttons for ListView
    Widget _buildButtonList(int icon, String txt, String onTapRoute) {
      return GestureDetector(
        child: Container(
          key: Key(onTapRoute),
          width: 100.0,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red[700],
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(IconData(icon, fontFamily: 'MaterialIcons')),
              Text(
                txt,
                style: Theme.of(context).textTheme.body2,
              ),
            ],
          ),
        ),
        onTap: () => Routes(context).navigatorPush(
          context,
          onTapRoute,
        ),
      );
    }

    /// `Section III` - Bottom menu container
    final Widget _bottomMenuList = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: bottomMenuHeight,
        padding: EdgeInsets.only(
          left: 0,
          right: 0,
          bottom: 20,
        ),
        color: Colors.green.withOpacity(0.6),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            Container(width: 20),
            _buildButtonList(
              _userButtonList[0]['icon'],
              _userButtonList[0]['txt'],
              _userButtonList[0]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[1]['icon'],
              _userButtonList[1]['txt'],
              _userButtonList[1]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[2]['icon'],
              _userButtonList[2]['txt'],
              _userButtonList[2]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[3]['icon'],
              _userButtonList[3]['txt'],
              _userButtonList[3]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[4]['icon'],
              _userButtonList[4]['txt'],
              _userButtonList[4]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[5]['icon'],
              _userButtonList[5]['txt'],
              _userButtonList[5]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[6]['icon'],
              _userButtonList[6]['txt'],
              _userButtonList[6]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[7]['icon'],
              _userButtonList[7]['txt'],
              _userButtonList[7]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[8]['icon'],
              _userButtonList[8]['txt'],
              _userButtonList[8]['onTapRoute'],
            ),
            Container(width: 10),
            _buildButtonList(
              _userButtonList[9]['icon'],
              _userButtonList[9]['txt'],
              _userButtonList[9]['onTapRoute'],
            ),
            Container(width: 20),
          ],
        ),
      ),
    );

    /// `Section IV` - Slide box container
    final Widget _slideBoxMiddle = Positioned(
      left: 0,
      top: topLogoHeight,
      width: screenWidth,
      height: boxSlideHeight,
      child: Container(
        padding: EdgeInsets.only(
          left: 20.0,
          top: 60.0,
          right: 20.0,
          bottom: 60.0,
        ),
        color: Colors.blue.withOpacity(0.3),
        child: Container(
          color: Colors.pinkAccent.withOpacity(0.5),
          child: Column(
            children: <Widget>[
              RaisedButton(
                key: Key('/card/'),
                onPressed: () {
                  Routes(context).navigatorPush(context, '/card/');
                },
                child: Text('Cartão de crédito'),
              ),
              Divider(
                height: 10,
              ),
              RaisedButton(
                key: Key('/nuconta/'),
                onPressed: () {
                  Routes(context).navigatorPush(context, '/nuconta/');
                },
                child: Text('NuConta'),
              ),
              Divider(
                height: 10,
              ),
              RaisedButton(
                key: Key('/rewards/'),
                onPressed: () {
                  Routes(context).navigatorPush(context, '/rewards/');
                },
                child: Text('Nubank rewards'),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      /// The parts of the display that are partially obscured by system UI,
      /// typically by the hardware display "notches" or the system status bar.
      /// The `SafeArea` widget help us get around this problem.
      body: SafeArea(
        child: Stack(
          overflow: Overflow.clip,
          children: [
            _logoContainer, // Logo container
            _mainMenuList, // Main menu container
            _bottomMenuList, // Bottom menu container
            _slideBoxMiddle, // Slide box container
          ],
        ),
      ),
    );
  }
}
