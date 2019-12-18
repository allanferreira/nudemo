import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/utils/routes.dart';

/// `Section IV` - Slide box container
class SectionIV extends StatelessWidget {
  @required
  final Size screenSize;
  @required
  final double topLogoHeight;
  @required
  final double boxSlideHeight;
  @required
  final HomePresenter presenter;

  SectionIV({
    this.screenSize,
    this.topLogoHeight,
    this.boxSlideHeight,
    this.presenter,
  });

  /// Build the summary info box widget
  Widget _summaryInfoBox(BuildContext context) {
    List<String> _formattedCurrency = presenter.getFormattedCurrency(
      presenter.getOpenCurrency(),
    );

    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            /// Necessary for automated widget test, because the
            /// drag point target the center of widget, therefore,
            /// when the box is lowered the center of animated
            /// box widget is lost.
            /// This `drag point` is always displayed. 😉
            key: Key('point-drag'),
            // color: Colors.black, // debug UI 🙃
            height: 1.0,
          ),
          Expanded(
            child: Container(
              // color: Colors.green, // debug UI 🙃
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 25.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.credit_card,
                        color: Theme.of(context).textTheme.caption.color,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Cartão de crédito',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Fatura atual'.toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).textTheme.display3.color,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '${_formattedCurrency[0]} ',
                            style: Theme.of(context).textTheme.display3,
                            children: <TextSpan>[
                              TextSpan(
                                text: _formattedCurrency[1],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: ',${_formattedCurrency[2]}'),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Limite disponível ',
                            style: TextStyle(
                              color: Theme.of(context).textTheme.body1.color,
                              fontSize: 14,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: presenter.getAvailableCurrency(),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .display2
                                      .color,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build the vertical chart bar widget
  Widget _verticalChartBar(BuildContext context) => Container(
        width: 8.0,
        decoration: BoxDecoration(
          // color: Colors.grey, // debug UI 🙃
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: Column(
          children: <Widget>[
            /// Balances future [orange]
            Expanded(
              flex: presenter.getFutureFlex(),
              child: Container(
                color: Theme.of(context).textTheme.display4.color,
              ),
            ),

            /// Balances open [blue]
            Expanded(
              flex: presenter.getOpenFlex(),
              child: Container(
                color: Theme.of(context).textTheme.display3.color,
              ),
            ),

            /// Balances available [green]
            Expanded(
              flex: presenter.getAvailableFlex(),
              child: Container(
                color: Theme.of(context).textTheme.display2.color,
              ),
            ),

            /// Balances prepaid ❔❔❔ I don't know the color...
            /// Is there❔ Is it green too❔
            /// Balances due [red]
            Expanded(
              flex: presenter.getDueFlex(),
              child: Container(
                color: Theme.of(context).textTheme.display1.color,
              ),
            ),
          ],
        ),
      );

  /// Build the show last register widget
  Widget _showLastRegister(BuildContext context) {
    Map<String, dynamic> _lastRegister = presenter.getLastCardRegister();

    return Container(
      color: Colors.black.withOpacity(0.05),
      constraints: BoxConstraints(
        minHeight: 90.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 16.0),
            child: Icon(
              IconData(
                _lastRegister['icon'],
                fontFamily: 'MaterialIcons',
              ),
              color: Theme.of(context).textTheme.caption.color,
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                _lastRegister['text'],
                style: Theme.of(context).textTheme.caption,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).textTheme.caption.color,
            ),
          ),
        ],
      ),
    );
  }

  /// Build widget item for carousel slider
  Widget _itemCarousel(BuildContext context) => GestureDetector(
        onTap: () => Routes(context).navigatorPush(context, '/card/'),
        onDoubleTap: () => Routes(context).navigatorPush(context, '/card/'),
        onLongPress: () => Routes(context).navigatorPush(context, '/card/'),
        child: Container(
          key: Key('/card/'),
          // color: Colors.blue, // debug UI 🙃
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    // Summary info box
                    _summaryInfoBox(context),
                    // Vertical chart bar
                    _verticalChartBar(context),
                  ],
                ),
              ),
              // Show last register
              _showLastRegister(context),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) =>
          Provider.of<AnimatedBoxPresenter>(context, listen: false)
              .handlerPanStart(details),
      onPanUpdate: (details) =>
          Provider.of<AnimatedBoxPresenter>(context, listen: false)
              .handlerPanUpdate(context, details, screenSize),
      onPanEnd: (details) =>
          Provider.of<AnimatedBoxPresenter>(context, listen: false)
              .handlerPanEnd(context, details, screenSize),
      child: Align(
        /// Get [dragAlignment] from model (by Provider.off)
        alignment:
            Provider.of<AnimatedBoxPresenter>(context).getDragAlignment(),
        key: Key('section-iv'),
        child: Container(
          width: (screenSize.width - 40.0),
          height: boxSlideHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(2.5),
          ),
          child: _itemCarousel(context),
        ),
      ),
    );
  }
}
