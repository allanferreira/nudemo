/// MVP Design Pattern
/// The view is a passive interface that displays data (the `model`) and routes
/// user commands (events) to the presenter to act upon that data.
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

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      key: Key('snackBar'),
      content: Text(
        'Filtering not supported yet!',
        style: Theme.of(context).textTheme.body2,
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(
      //     color: Theme.of(context).textTheme.caption.color,
      //   ),
      //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
      // ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
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
  Widget listViewItemBuilder(context, index) => Container(
        key: Key('item-$index'),
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: index == 0
              ? Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Theme.of(context)
                        .textTheme
                        .body1
                        .color
                        .withOpacity(0.25),
                  ),
                )
              : null,
        ),
        child: Text('${presenter.getGeneratedItems()[index]}'),
      );

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
                    onPressed: () {
                      _showSnackBar(context);
                    },
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
            //   backgroundColor: Theme.of(context).primaryColorDark,
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
