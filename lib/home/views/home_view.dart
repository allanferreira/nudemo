/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.

import 'package:flutter/material.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/home/views/section_i.dart';
import 'package:nudemo/home/views/section_ii.dart';
import 'package:nudemo/home/views/section_iii.dart';
import 'package:nudemo/home/views/section_iv.dart';

class HomePage extends StatelessWidget {
  @required
  final HomePresenter presenter;
  @required
  final String title;

  HomePage({Key key, this.presenter, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final Size _screenSize = _mediaQuery.size;
    final double _screenWidth = _screenSize.width;
    final double _screenHeight = _screenSize.height;
    final EdgeInsets _screenNotch = _mediaQuery.padding;
    final double _totalNotch = _screenNotch.top + _screenNotch.bottom;

    final double _topLogoHeight = 100.0;
    final double _bottomMenuHeight = 120.0;
    final double _mainContainerHeight =
        _screenHeight - _topLogoHeight - _totalNotch;
    final double _boxSlideMargin = 120.0;
    final double _boxSlideHeight = _screenHeight -
        _topLogoHeight -
        _bottomMenuHeight -
        _totalNotch -
        _boxSlideMargin;

    return Scaffold(
      /// The parts of the display that are partially obscured by system UI,
      /// typically by the hardware display "notches" or the system status bar.
      /// The `SafeArea` widget help us get around this problem.
      body: SafeArea(
        child: Stack(
          overflow: Overflow.clip,
          children: [
            // Logo container
            SectionI(
              screenSize: _screenSize,
              topLogoHeight: _topLogoHeight,
              title: title,
              isLowered: false,
            ),
            // Main menu container
            SectionII(
              screenWidth: _screenWidth,
              topLogoHeight: _topLogoHeight,
              mainContainerHeight: _mainContainerHeight,
              bottomMenuHeight: _bottomMenuHeight,
            ),
            // Bottom menu container
            SectionIII(
              bottomMenuHeight: _bottomMenuHeight,
            ),
            // Slide box container
            SectionIV(
              screenSize: _screenSize,
              topLogoHeight: _topLogoHeight,
              boxSlideHeight: _boxSlideHeight,
            ),
          ],
        ),
      ),
    );
  }
}
