import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
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

  /// Build carousel slider containers
  CarouselSlider _containerCarroselSlider(BuildContext context) {
    /// [CarouselBoxes] The widgets to be shown in the carousel.
    List<Widget> _carouselBoxes = ItensCarousel.itensList(context)
        .map((widget) => Builder(builder: (BuildContext context) {
              return Container(
                width: (screenSize.width - 40.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: widget,
              );
            }))
        .toList();

    return CarouselSlider(
      items: _carouselBoxes,
      initialPage: HomePresenter().getInitialPageCarousel(),
      height: boxSlideHeight,
      viewportFraction: 1.0,
      enableInfiniteScroll: false,
      onPageChanged: (index) => HomePresenter.onTheViewport(context, index),
    );
  }

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
        child: _containerCarroselSlider(context),
      ),
    );
  }
}
