import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/utils/routes.dart';
import 'package:nudemo/home/presenter/basic_animated_box_presenter.dart';

/// `Section IV` - Slide box container
class SectionIV extends StatelessWidget {
  @required
  final Size screenSize;
  @required
  final double topLogoHeight;
  @required
  final double boxSlideHeight;

  SectionIV({
    this.screenSize,
    this.topLogoHeight,
    this.boxSlideHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) =>
          Provider.of<BasicAnimatedBoxPresenter>(context, listen: false)
              .handlerPanStart(details),
      onPanUpdate: (details) =>
          Provider.of<BasicAnimatedBoxPresenter>(context, listen: false)
              .handlerPanUpdate(context, details, screenSize),
      onPanEnd: (details) =>
          Provider.of<BasicAnimatedBoxPresenter>(context, listen: false)
              .handlerPanEnd(context, details, screenSize),
      child: Align(
        /// Get [dragAlignment] from model (by Provider.off)
        alignment:
            Provider.of<BasicAnimatedBoxPresenter>(context).getDragAlignment(),
        key: Key('section-iv'),
        child: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          width: (screenSize.width - 40.0),
          height: boxSlideHeight,
          color: Theme.of(context).accentColor.withOpacity(0.3), // debug UI 🙃
          child: Container(
            color: Theme.of(context).accentColor,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    key: Key('point-drag'),
                    padding: EdgeInsets.all(8),
                    width: 20,
                    color: Colors.black, // debug UI 🙃
                  ),
                ),
                RaisedButton(
                  key: Key('/card/'),
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    Routes(context).navigatorPush(context, '/card/');
                  },
                  child: Text('Cartão de crédito'),
                ),
                RaisedButton(
                  key: Key('/nuconta/'),
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    Routes(context).navigatorPush(context, '/nuconta/');
                  },
                  child: Text('NuConta'),
                ),
                RaisedButton(
                  key: Key('/rewards/'),
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    Routes(context).navigatorPush(context, '/rewards/');
                  },
                  child: Text('Nubank rewards'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
