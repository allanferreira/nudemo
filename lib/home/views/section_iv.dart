import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/animated_box_presenter.dart';
import 'package:nudemo/home/views/itens_carousel.dart';

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
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: ItensCarousel.itensList(context)[0],
        ),
      ),
    );
  }
}
