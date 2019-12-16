import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/home/views/itens_carousel.dart';

/// `Section V` - Dotted carousel indicator
class SectionV extends StatelessWidget {
  @required
  final double dottedIndicatorPosition;
  @required
  final double dottedIndicatorHeight;

  SectionV({
    this.dottedIndicatorPosition,
    this.dottedIndicatorHeight,
  });

  Widget _containerDotted(Color color, int index) => Container(
        key: Key('dotted-$index'),
        width: 4.0,
        height: 4.0,
        margin: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 2.5,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: dottedIndicatorPosition,
      left: 0.0,
      right: 0.0,
      key: Key('section-v'),
      child: Consumer<FadeButtonsPresenter>(
        builder: (context, fadeBox, child) => FadeTransition(
          opacity: fadeBox.getCurvedAnimation(),
          child: Container(
            // color: Colors.red, // debug UI 🙃
            height: dottedIndicatorHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: HomePresenter.mapCustom<Widget>(
                ItensCarousel.itensList(context),
                (index, widget) => Consumer<HomePresenter>(
                  builder: (context, homePresenter, child) => _containerDotted(
                    homePresenter.getDottedIndicatorColor(
                      context,
                      index,
                    ),
                    index,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
