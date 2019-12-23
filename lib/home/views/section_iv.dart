import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/utils/routes.dart';
import 'package:nudemo/utils/utils.dart';

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

  final Utils utils = Utils();

  SectionIV({
    this.screenSize,
    this.topLogoHeight,
    this.boxSlideHeight,
    this.presenter,
  });

  /// Build the information summary widget
  Widget _summaryInfoBox(BuildContext context) {
    List<String> _formattedCurrency = presenter.getFormattedCurrency(
      currencyBRL: presenter.getOpenCurrency(),
    );

    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            /// Necessary for automated [integration test], because
            /// the drag point target the center of widget, therefore,
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
                                      .display1
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

  /// Build widget item for carousel slider
  Widget _itemCarousel(BuildContext context) => MaterialButton(
        onPressed: () =>
            Provider.of<AnimatedBoxPresenter>(context, listen: false)
                    .getIsLowered()
                ? null
                : Routes(context).navigatorPush(context, '/card/'),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
        ),
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
                    utils.verticalChartBar(
                      context: context,
                      width: 8.0,
                      flexFuture: presenter.getFutureFlex(),
                      flexOpen: presenter.getOpenFlex(),
                      flexDue: presenter.getDueFlex(),
                      flexAvailable: presenter.getAvailableFlex(),
                    ),
                  ],
                ),
              ),
              // Last record display
              utils.showLastRegister(
                context: context,
                lastRegister: presenter.getLastCardRegister(),
              ),
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
