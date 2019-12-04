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
                  FlutterLogo(size: 60),
                  // Image.asset(
                  //   'assets/images/logo_white.png',
                  //   key: Key('logo'),
                  //   fit: BoxFit.contain,
                  //   color: Theme.of(context).accentColor,
                  // ),
                  Text(
                    title,
                    key: Key('title-text'),
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

    Widget _buildItemListMenu({
      Widget img,
      String title,
      String subtitle,
      String route,
    }) {
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
    final Widget _mainMenuList = Padding(
      padding: EdgeInsets.only(
        top: topLogoHeight,
      ),
      child: Container(
        height: mainContainerHeight,
        padding: EdgeInsets.only(
          left: 30,
          top: 20,
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
              height: 50,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );

    /// `Section III` - Bottom menu container
    final Widget _bottomMenuList = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: bottomMenuHeight,
        padding: EdgeInsets.all(10.0),
        color: Colors.green,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            FlutterLogo(size: 100),
            FlutterLogo(size: 100),
            FlutterLogo(size: 100),
            FlutterLogo(size: 100),
            FlutterLogo(size: 100),
            FlutterLogo(size: 100),
          ],
        ),
      ),
    );

    /// `Section IV` - Slide box container
    final Widget _slideBoxMiddle = Padding(
      padding: EdgeInsets.only(
        top: topLogoHeight,
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: 20.0,
          top: 60.0,
          right: 20.0,
          bottom: 60.0,
        ),
        height: boxSlideHeight,
        color: Colors.blue.withOpacity(0.3),
        child: Container(
          color: Colors.pinkAccent.withOpacity(0.5),
          child: Column(
            children: <Widget>[
              RaisedButton(
                key: Key('credit-card-button'),
                onPressed: () {
                  Routes(context).navigatorPush(context, '/credit-card/');
                },
                child: Text('Cartão de crédito'),
              ),
              Divider(
                height: 10,
              ),
              RaisedButton(
                key: Key('nuconta-button'),
                onPressed: () {
                  Routes(context).navigatorPush(context, '/nuconta/');
                },
                child: Text('NuConta'),
              ),
              Divider(
                height: 10,
              ),
              RaisedButton(
                key: Key('rewards-button'),
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
