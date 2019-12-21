import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/utils/routes.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';

/// `Section III` - Bottom menu container
class SectionIII extends StatelessWidget {
  @required
  final double bottomMenuHeight;

  SectionIII({this.bottomMenuHeight});

  @override
  Widget build(BuildContext context) {
    /// This list of custom data per customer can come from remote
    /// source (HTTP) or from local persistence 😉 (Section III)
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
        'icon': 58686,
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

    // Builder buttons for ListView (Section III)
    Widget _buildButtonList(int icon, String txt, String onTapRoute) {
      return MaterialButton(
        onPressed: () => Routes(context).navigatorPush(
          context,
          onTapRoute,
        ),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        child: Container(
          key: Key(onTapRoute),
          width: 100.0,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                IconData(icon, fontFamily: 'MaterialIcons'),
                color: Theme.of(context).textTheme.body2.color,
              ),
              Text(
                txt,
                style: Theme.of(context).textTheme.body2,
              ),
            ],
          ),
        ),
      );
    }

    return Align(
      alignment: Alignment.bottomCenter,
      key: Key('section-iii'),
      child: Container(
        height: bottomMenuHeight,
        padding: EdgeInsets.only(
          left: 0,
          right: 0,
          bottom: 20,
        ),
        // color: Colors.green.withOpacity(0.6), // debug UI 🙃
        child: Consumer<FadeButtonsPresenter>(
          builder: (context, fadeBox, child) => FadeTransition(
            opacity: fadeBox.getCurvedAnimation(),
            child: ListView(
              key: Key('button-list'),
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
        ),
      ),
    );
  }
}
