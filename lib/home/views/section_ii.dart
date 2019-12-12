import 'package:flutter/material.dart';

import 'package:nudemo/utils/routes.dart';

/// `Section II` - Main menu container
class SectionII extends StatelessWidget {
  @required
  final double screenWidth;
  @required
  final double topLogoHeight;
  @required
  final double mainContainerHeight;
  @required
  final double bottomMenuHeight;

  SectionII({
    this.screenWidth,
    this.topLogoHeight,
    this.mainContainerHeight,
    this.bottomMenuHeight,
  });

  @override
  Widget build(BuildContext context) {
    final Widget dividerList = Divider(
      height: 2,
      color: Theme.of(context).primaryColorLight,
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

    // Build item list menu (Section II)
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

    return Positioned(
      left: 0,
      top: topLogoHeight,
      width: screenWidth,
      height: mainContainerHeight,
      key: Key('section-ii'),
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
  }
}
