import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/animated_box_presenter.dart';

/// `Section I` - Logo container
class SectionI extends StatelessWidget {
  @required
  final Size screenSize;
  @required
  final double topLogoHeight;
  @required
  final String title;
  @required
  final bool isLowered;

  SectionI({
    this.screenSize,
    this.topLogoHeight,
    this.title,
    this.isLowered,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: screenSize.width,
        height: topLogoHeight,
        // color: Colors.orangeAccent, // debug UI 🙃
        padding: EdgeInsets.only(top: 18),
        key: Key('section-i'),
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_white.png',
                    key: Key('logo-main'),
                    width: 45,
                    color: Theme.of(context).accentColor,
                  ),
                  Container(
                    width: 6,
                  ),
                  Text(
                    title,
                    key: Key('title-text'),
                    style: Theme.of(context).textTheme.headline,
                  ),
                ],
              ),
              Container(
                // color: Colors.black, // debug UI 🙃
                padding: EdgeInsets.only(left: 70, right: 70, bottom: 13),
                child: Consumer<AnimatedBoxPresenter>(
                  builder: (context, animatedBox, child) => Icon(
                    /// Get [isLowered] from model (by Consumer)
                    animatedBox.getIsLowered()
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    key: Key('icon-drag'),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          onTap: () => Provider.of<AnimatedBoxPresenter>(context, listen: false)
              .handlerIconButtonPressed(context, screenSize),
        ),
      ),
    );
  }
}
