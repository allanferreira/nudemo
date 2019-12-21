import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/presenter/fade_buttons_presenter.dart';
import 'package:nudemo/utils/utils.dart';

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

  /// SliderBox dotted indicator container
  Widget _dottedContainerSliderBox({
    @required List<int> listItens,
  }) =>
      Consumer<FadeButtonsPresenter>(
        builder: (context, fadeBox, child) => FadeTransition(
          opacity: fadeBox.getCurvedAnimation(),
          child: Container(
            key: Key('slider-dotted'),
            // color: Colors.red, // debug UI 🙃
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Utils.mapCustom<Widget>(
                listItens,
                (index, widget) => Consumer<HomePresenter>(
                  builder: (context, homePresenter, child) {
                    Color dottedColor = Theme.of(context).iconTheme.color;
                    Color currentColor = homePresenter.getDottedIndicatorColor(
                        index: index,
                        activeColor: dottedColor,
                        unactiveColor: dottedColor.withOpacity(0.4));

                    return _dottedItem(color: currentColor, index: index);
                  },
                ),
              ),
            ),
          ),
        ),
      );

  /// Build dotted item
  Widget _dottedItem({
    @required Color color,
    int index = 0,
    double widthHeight = 4.0,
  }) =>
      Container(
        key: Key('dotted-$index'),
        width: widthHeight,
        height: widthHeight,
        margin: EdgeInsets.symmetric(
          vertical: widthHeight / 2,
          horizontal: (widthHeight / 2) + 0.5,
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
      child: _dottedContainerSliderBox(
        listItens: [1, 2, 3],
      ),
    );
  }
}
