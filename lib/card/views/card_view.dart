/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nudemo/card/presenter/card_presenter.dart';
import 'package:nudemo/home/presenter/home_presenter.dart';
import 'package:nudemo/utils/utils.dart';

class CardPage extends StatelessWidget {
  @required
  final CardPresenter presenter;
  @required
  final String title;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final HomePresenter homePresenter = HomePresenter();
  final Utils utils = Utils();

  CardPage({Key key, this.presenter, this.title}) : super(key: key) {
    /// Calculate percentage balances
    homePresenter.calculatePercentBalances();
  }

  /// SliderBox dotted indicator container
  Widget _dottedContainerSliderBox({
    @required List<int> listItens,
  }) =>
      Container(
        key: Key('slider-dotted'),
        // color: Colors.red, // debug UI 🙃
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Utils.mapCustom<Widget>(
            listItens,
            (index, widget) => Consumer<CardPresenter>(
              builder: (context, cardPresenter, child) {
                Color dottedColor = Theme.of(context).textTheme.caption.color;
                Map<String, dynamic> style =
                    cardPresenter.getDottedIndicatorColor(
                        index: index,
                        widthHeight: 5.0,
                        activeColor: dottedColor,
                        unactiveColor: dottedColor.withOpacity(0.4));

                return _dottedItem(
                  color: style['color'],
                  index: index,
                  widthHeight: style['widthHeight'],
                );
              },
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

  /// Builder Delegate of [SliverList]
  Widget listViewItemBuilder(context, index) {
    Map<String, dynamic> _itemData = presenter.getCardHistoryItems()[index];

    String _type = _itemData['type'];
    String _title = _itemData['title'];
    String _itemText = _itemData['text'];
    double _money = _itemData['money'];
    String _divisionText = _itemData['division'];
    List<String> _allTags =
        _itemData['tags'] != null ? _itemData['tags'].split(',') : [];
    String _dateRegister = _itemData['date'];

    TextTheme _theme = Theme.of(context).textTheme;
    double _weekTextWidth = 60.0;
    double _marginTop = 24.0;

    /// Default properties is [expense]
    Color _color = _theme.body1.color.withOpacity(0.7);
    Color _bgColor = Theme.of(context).splashColor;
    IconData _iconData = _itemData['icon'] != null
        ? IconData(_itemData['icon'], fontFamily: 'MaterialIcons')
        : Icons.credit_card;
    double _iconSize = 25.0;
    double _iconWidth = 28.0;
    double _iconHeight = 29.0;
    double _iconMargin = 33.0;
    double _fontSize = 16.0;

    // First item timeline
    double _topTimeline = index == 0 ? 47.0 : 0;
    double _heightTimeline = 48.0;
    Widget _timeline;

    Widget _tags = Container();
    if (_allTags.isNotEmpty) {
      _tags = Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Text(
          _allTags.join(' '),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: _color,
            fontSize: 13.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }

    /// [income] and [system] properties
    if (_type != 'expense') {
      /// between [income] and [system] change the color
      _color =
          _type == 'income' ? _theme.display1.color : _theme.display2.color;

      /// Other properties are the same for [income] and [system].
      _bgColor = null;
      _iconData = Icons.fiber_manual_record;
      _iconSize = 18.0;
      _iconHeight = 18.0;
      _iconMargin = _marginTop;
      _fontSize = 13.0;
      _tags = Container();

      // First item timeline
      _topTimeline = index == 0 ? 33.0 : _topTimeline;

      // Last item timeline
      _heightTimeline =
          index == (presenter.getItemsLength() - 1) ? 33.0 : _heightTimeline;
    }

    // Last item timeline widget
    if (index == (presenter.getItemsLength() - 1)) {
      _timeline = Positioned(
        top: _topTimeline,
        height: _heightTimeline,
        width: 1.0,
        left: (_iconWidth - 1.0) / 2,
        child: Container(
          color: Theme.of(context).textTheme.body1.color.withOpacity(0.21),
        ),
      );
    } else {
      _timeline = Positioned(
        top: _topTimeline,
        bottom: 0,
        width: 1.0,
        left: (_iconWidth - 1.0) / 2,
        child: Container(
          color: Theme.of(context).textTheme.body1.color.withOpacity(0.21),
        ),
      );
    }

    Widget _text = Container();
    if (_itemText != null) {
      _text = Padding(
        padding: EdgeInsets.only(top: 3.0),
        child: Text(
          _itemText,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: _color,
            fontSize: _fontSize,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }

    Widget _division = Container();
    if (_divisionText != null) {
      _division = Padding(
        padding: EdgeInsets.only(top: 2.0),
        child: Text(
          _divisionText,
          style: TextStyle(
            color: _color,
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }

    Widget _value = Container();
    if (_money != null && _money.isFinite) {
      _value = Padding(
        padding: EdgeInsets.only(top: 3.0),
        child: Text(
          utils.getValueCurrency(_money),
          style: TextStyle(
            color: _color,
            fontSize: _fontSize,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }

    return MaterialButton(
      key: Key('item-$index'),
      onPressed: () => print('item-$index pressed!'),
      padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 0),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      child: Stack(
        children: <Widget>[
          // Line of timeline
          _timeline,
          // Icon of item
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: _iconWidth,
              height: _iconHeight,
              color: _bgColor,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: _iconMargin),
              child: Icon(
                _iconData,
                color: _color,
                size: _iconSize,
              ),
            ),
          ),
          // Data of item
          Align(
            alignment: Alignment.topRight,
            child: Container(
              // color: Colors.lime, // debug UI 🙃
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: _marginTop),
              constraints: BoxConstraints(maxWidth: _weekTextWidth),
              child: Text(
                utils.getCalculatedFormattedDate(_dateRegister),
                style: TextStyle(
                  fontSize: 11.0,
                  color: Theme.of(context).textTheme.caption.color,
                ),
              ),
            ),
          ),
          // Text of item
          Container(
            // color: Colors.teal, // debug UI 🙃
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              left: 45.0,
              top: _marginTop,
              right: _weekTextWidth,
              bottom: 26.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _title,
                  style: TextStyle(
                    color: _color,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _text,
                _division,
                _value,
                _tags,
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// [CustomScrollView] with collapsing toolbar from [Sliver] and
  /// swipe to refresh from [RefreshIndicator]
  Widget _customScrollView({
    BuildContext context,
    double sliverAppBarHeight,
    double titlePaddingTop,
    double titlePaddingBottom,
  }) =>
      RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: presenter.refreshCustomScrollView,
        color: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          key: Key('card-scroll-view'),
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SliverAppBar(
                expandedHeight: sliverAppBarHeight,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                floating: false,
                pinned: true,
                snap: false,
                shape: Border(
                  bottom: BorderSide(
                    color: Theme.of(context)
                        .textTheme
                        .body1
                        .color
                        .withOpacity(0.10),
                  ),
                ),
                leading: MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.only(left: 6.0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  child: Row(
                    key: Key('go-back-button'),
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                      Icon(
                        Icons.credit_card,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                    ],
                  ),
                ),

                /// On [flexibleSpace] is a good place to implement
                /// carousel slider 👉↔️👉
                flexibleSpace: FlexibleSpaceBar(
                  title: Icon(
                    Icons.lock,
                    size: 16,
                    color: Theme.of(context).textTheme.display2.color,
                  ),
                  // Text('FilledStacks'),
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(
                    top: titlePaddingTop,
                    bottom: titlePaddingBottom,
                  ),
                  background: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 90.0,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Cartão virtual bloqueado',
                              key: Key('slider-1'),
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.display2.color,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 22.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .color,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                                child: Text(
                                  'Desbloquear'.toUpperCase(),
                                  key: Key('/unlock/'),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .color,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                  ),
                                ),
                                onPressed: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 8.0,
                        left: 0,
                        right: 0,
                        child: _dottedContainerSliderBox(
                          listItens: [1, 2, 3, 4, 5],
                        ),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    key: Key('filter-button'),
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).textTheme.title.color,
                    ),
                    tooltip: 'Filter',
                    onPressed: () => utils.showSnackBar(
                      scaffoldKey: _scaffoldKey,
                      context: context,
                      text: 'Filtering not supported yet!',
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => listViewItemBuilder(context, index),
                childCount: presenter.getItemsLength(),
                addAutomaticKeepAlives: false,
                semanticIndexCallback: presenter.semanticIndexCallback,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final Size _screenSize = _mediaQuery.size;
    // final double _screenWidth = _screenSize.width;
    // final double _screenHeight = _screenSize.height;
    final EdgeInsets _screenNotch = _mediaQuery.padding;
    final double _topSpace = _screenNotch.top;
    final double _widthVerticalChartBar = 12.0;

    final double _sliverAppBarHeight = _screenSize.height * 0.285;
    final double _titlePaddingTop = _sliverAppBarHeight * 0.1;
    final double _titlePaddingBottom = _sliverAppBarHeight * 0.625;

    return Stack(
      key: Key('card-page'),
      children: <Widget>[
        // Main list
        Positioned(
          top: _topSpace,
          bottom: 0,
          left: 0,
          right: _widthVerticalChartBar,
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Theme.of(context).splashColor,
            body: _customScrollView(
              context: context,
              sliverAppBarHeight: _sliverAppBarHeight,
              titlePaddingTop: _titlePaddingTop,
              titlePaddingBottom: _titlePaddingBottom,
            ),
            // // Navigator test of dotted indicator
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () =>
            //       Provider.of<CardPresenter>(context, listen: false)
            //           .setCurrentPageCarousel(1),
            //   tooltip: 'Carousel navigator',
            //   backgroundColor: Theme.of(context).primaryColorLight,
            //   key: Key('carousel-navigator'),
            //   child: Icon(
            //     Icons.view_carousel,
            //     color: Theme.of(context).textTheme.body2.color,
            //   ),
            // ),
          ),
        ),
        // Vertical chart bar
        Positioned(
          top: _topSpace,
          width: _widthVerticalChartBar,
          right: 0,
          bottom: 0,
          child: utils.verticalChartBar(
            context: context,
            width: 8.0,
            borderRadius: 0,
            flexFuture: homePresenter.getFutureFlex(),
            flexOpen: homePresenter.getOpenFlex(),
            flexDue: homePresenter.getDueFlex(),
            flexAvailable: homePresenter.getAvailableFlex(),
          ),
        ),
      ],
    );
  }
}
