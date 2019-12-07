import 'package:flutter/material.dart';

/// `Section I` - Logo container
class SectionI extends StatelessWidget {
  final double screenWidth;
  final double topLogoHeight;
  final String title;
  final bool isLowered;

  SectionI({
    this.screenWidth,
    this.topLogoHeight,
    this.title,
    this.isLowered,
  });

  void _handlerIconButton() {
    // _runAnimation(Offset.zero, size);

    // if (_targetAlignment == _endDragAlignment) {
    //   _targetAlignment = _beginDragAlignment;
    // } else {
    //   _targetAlignment = _endDragAlignment;
    // }

    // isLowered = !isLowered;
    print('Icon buttom pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: screenWidth,
        height: topLogoHeight,
        // color: Colors.orangeAccent, // debug UI 🙃
        padding: EdgeInsets.only(top: 18),
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_white.png',
                    key: Key('logo'),
                    width: 45,
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
              Container(
                // color: Colors.black, // debug UI 🙃
                padding: EdgeInsets.only(left: 70, right: 70, bottom: 13),
                child: Icon(
                  isLowered
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  key: Key('icon-drag'),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          onTap: () => _handlerIconButton(),
        ),
      ),
    );
  }
}
