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
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size screenSize = mediaQuery.size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final EdgeInsets screenNotch = mediaQuery.padding;
    final double totalNotch = screenNotch.top + screenNotch.bottom;

    final double topLogoHeight = 100.0;
    final double bottomMenuHeight = 120.0;
    final double mainContainerHeight =
        screenHeight - topLogoHeight - totalNotch;
    final double boxSlideHeight =
        screenHeight - topLogoHeight - bottomMenuHeight - totalNotch;

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
              screenSize: screenSize,
              topLogoHeight: topLogoHeight,
              title: title,
              isLowered: false,
            ),
            // Main menu container
            SectionII(
              screenWidth: screenWidth,
              topLogoHeight: topLogoHeight,
              mainContainerHeight: mainContainerHeight,
              bottomMenuHeight: bottomMenuHeight,
            ),
            // Bottom menu container
            SectionIII(
              bottomMenuHeight: bottomMenuHeight,
            ),
            // Slide box container
            SectionIV(
              screenWidth: screenWidth,
              topLogoHeight: topLogoHeight,
              boxSlideHeight: boxSlideHeight,
            ),
          ],
        ),
      ),
    );
  }
}
