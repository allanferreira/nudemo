import 'package:flutter/material.dart';

/// `Section I` - Logo container
class SectionI extends StatelessWidget {
  final double screenWidth;
  final double topLogoHeight;
  final String title;
  final bool isSlideDown;

  SectionI({
    this.screenWidth,
    this.topLogoHeight,
    this.title,
    this.isSlideDown,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: screenWidth,
        height: topLogoHeight,
        color: Colors.orangeAccent,
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_white.png',
                    key: Key('logo'),
                    width: 50,
                    color: Theme.of(context).accentColor,
                  ),
                  Container(
                    width: 6,
                  ),
                  Text(
                    title,
                    key: Key('title-text'),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Icon(isSlideDown
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
            ],
          ),
          onTap: () => print('Logo tapped!'),
        ),
      ),
    );
  }
}
