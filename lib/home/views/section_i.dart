import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';

/// `Section I` - Logo container
class SectionI extends StatelessWidget {
  @required
  final Size screenSize;
  @required
  final double topLogoHeight;
  @required
  final bool isLowered;

  SectionI({
    this.screenSize,
    this.topLogoHeight,
    this.isLowered,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      key: Key('section-i'),
      alignment: Alignment.topCenter,
      child: Container(
        width: screenSize.width,
        height: topLogoHeight,
        // color: Colors.orangeAccent, // debug UI 🙃
        child: MaterialButton(
          onPressed: () =>
              Provider.of<AnimatedBoxPresenter>(context, listen: false)
                  .handlerIconButtonPressed(context, screenSize),
          padding: EdgeInsets.only(top: 18),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_white.png',
                    key: Key('logo-main'),
                    width: 45,
                    color: Theme.of(context).textTheme.subhead.color,
                  ),
                  Container(
                    width: 6,
                  ),
                  Text(
                    Provider.of<HomePresenter>(context).getUserNickname(),
                    key: Key('title-text'),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subhead.color,
                      fontSize: Theme.of(context).textTheme.headline.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline.fontWeight,
                    ),
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
                    color: Theme.of(context).textTheme.subhead.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
