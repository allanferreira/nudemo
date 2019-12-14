import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:nudemo/utils/routes.dart';
import 'package:nudemo/home/presenter/basic_fade_box_presenter.dart';

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
  @required
  final String qrCodeData;

  SectionII({
    this.screenWidth,
    this.topLogoHeight,
    this.mainContainerHeight,
    this.bottomMenuHeight,
    this.qrCodeData,
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
            fontSize: 13.0,
            color: Theme.of(context).accentColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: txtBold,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      );
    }

    // QR-Code rendering container (Section II)
    final Widget _qrCodeRendering = QrImage(
      data: qrCodeData,
      version: QrVersions.auto,
      size: 105.0,
      padding: EdgeInsets.all(9.0),
      foregroundColor: Theme.of(context).backgroundColor,
      backgroundColor: Theme.of(context).accentColor,
      errorCorrectionLevel: QrErrorCorrectLevel.M,

      /// Not good with this image in center 🤷‍♀️
      // embeddedImage: AssetImage(
      //   'assets/images/logo_white.png',
      // ),
      // embeddedImageStyle: QrEmbeddedImageStyle(
      //   size: Size(40, 40),
      //   color: Theme.of(context).backgroundColor,
      // ),
      // embeddedImageEmitsError: true,
      errorStateBuilder: (cxt, err) {
        // print('QrImage error: $err');
        return Container(
          child: Center(
            child: Text(
              "Uh oh! Something went wrong with QR Code...",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        );
      },
    );

    // Top container (Section II)
    final Widget _topContainer = Container(
      // color: Colors.black38, // debug UI 🙃
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Center(child: _qrCodeRendering),
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
        // color: Colors.indigo, // debug UI 🙃
        child: Consumer<BasicFadeBoxPresenter>(
          builder: (context, fadeBox, child) => FadeTransition(
            opacity: fadeBox.getCurvedAnimation(),
            child: ListView(
              children: <Widget>[
                _topContainer,
                dividerList,
                _buildItemListMenu(
                  img: Icon(Icons.help_outline),
                  title: 'Me ajuda',
                  subtitle: null,
                  route: '/helpme/',
                ),
                dividerList,
                _buildItemListMenu(
                  img: Icon(Icons.account_circle),
                  title: 'Perfil',
                  subtitle: 'Nome de preferência, telefone, e-mail',
                  route: '/profile/',
                ),
                dividerList,
                _buildItemListMenu(
                  img: Icon(Icons.account_balance),
                  title: 'Configurar NuConta',
                  subtitle: null,
                  route: '/nuconta-configs/',
                ),
                dividerList,
                _buildItemListMenu(
                  img: Icon(Icons.credit_card),
                  title: 'Configurar cartão',
                  subtitle: null,
                  route: '/card-configs/',
                ),
                dividerList,
                _buildItemListMenu(
                  img: Icon(Icons.fingerprint),
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
                  child: Text(
                    'Sair da conta'.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: null,
                ),
                Divider(
                  height: bottomMenuHeight,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
