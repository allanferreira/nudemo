import 'dart:io';

import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group('[Driver -> App]', () {
    // First, define the Finders and use them to locate widgets
    // from the test suite.
    final SerializableFinder _myApp = find.byValueKey('app-root');
    final SerializableFinder _homePage = find.byValueKey('home-page');
    final SerializableFinder _constructionPage =
        find.byValueKey('construction-page');
    final SerializableFinder _cardPage = find.byValueKey('card-page');
    final SerializableFinder _nucontaPage = find.byValueKey('nuconta-page');
    final SerializableFinder _rewardsPage = find.byValueKey('rewards-page');
    final SerializableFinder _animatedBox = find.byValueKey('section-iv');
    final SerializableFinder _animatedBoxPointDrag =
        find.byValueKey('point-drag');
    final SerializableFinder _buttonDownUp = find.byValueKey('icon-drag');
    final SerializableFinder _titleText = find.byValueKey('title-text');

    final SerializableFinder _counterText = find.byValueKey('counter-text');
    final SerializableFinder _incrementButton =
        find.byValueKey('increment-button');
    final SerializableFinder _goBackButton = find.byValueKey('go-back-button');
    final SerializableFinder _filterButton = find.byValueKey('filter-button');

    final SerializableFinder _cardButton = find.byValueKey('/card/');
    final SerializableFinder _unlockButton = find.byValueKey('/unlock/');
    final SerializableFinder _nuContaButton = find.byValueKey('/nuconta/');
    final SerializableFinder _rewardsButton = find.byValueKey('/rewards/');

    final SerializableFinder _helpMeButton = find.byValueKey('/helpme/');
    final SerializableFinder _profileButton = find.byValueKey('/profile/');
    final SerializableFinder _nuContaConfigsButton =
        find.byValueKey('/nuconta-configs/');
    final SerializableFinder _cardConfigsButton =
        find.byValueKey('/card-configs/');
    final SerializableFinder _appConfigsButton =
        find.byValueKey('/app-configs/');
    final SerializableFinder _exitButton = find.byValueKey('/exit/');

    final SerializableFinder _transferButton = find.byValueKey('/transfer/');
    final SerializableFinder _virtualCardButton =
        find.byValueKey('/virtual-card/');
    final SerializableFinder _payButton = find.byValueKey('/pay/');
    final SerializableFinder _blockingCardButton =
        find.byValueKey('/blocking-card/');
    final SerializableFinder _depositButton = find.byValueKey('/deposit/');
    final SerializableFinder _chargeButton = find.byValueKey('/charge/');
    final SerializableFinder _mobileRechargeButton =
        find.byValueKey('/mobile-recharge/');
    final SerializableFinder _referFriendsButton =
        find.byValueKey('/refer-friends/');
    final SerializableFinder _adjustLimitButton =
        find.byValueKey('/adjust-limit/');
    final SerializableFinder _organizeShortcutsButton =
        find.byValueKey('/organize-shortcuts/');

    FlutterDriver _driver;
    // double _sizeScreenWidth;
    double _sizeScreenHeight;
    double _halfScreenHeight;
    double _minDragHeight;
    double _sliverAppBarHeight;

    final Duration fastTime = Duration(milliseconds: 50);
    final Duration normalTime = Duration(milliseconds: 150);
    final Duration slowTime = Duration(milliseconds: 300);
    final Duration verySlowTime = Duration(milliseconds: 800);

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      _driver = await FlutterDriver.connect();

      await sleep(Duration(seconds: 5));

      // Awaiting full application loading (including animations)
      await _driver.waitFor(_myApp);

      // Get size screen (device absolute pixels)
      dynamic _sizeScreen = (await _driver.getBottomRight(_myApp));
      // _sizeScreenWidth = _sizeScreen.dx;
      _sizeScreenHeight = _sizeScreen.dy;
      _halfScreenHeight = _sizeScreenHeight / 2;
      _minDragHeight = (_sizeScreenHeight / 2) * 0.20;
      _sliverAppBarHeight = _sizeScreenHeight * 0.285;
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (_driver != null) {
        await _driver.close();
      }
    });

    test('starts at `Home page`', () async {
      /// Use the `_driver.getText` method to verify the app starts at `Home`.
      expect(await _driver.getText(_titleText), "Chinnon");
    });

    test('tap `down` animated box', () async {
      /// [Gesture 👆] Tap the `IconButton` Widget to drag `Down 🔽`
      await _driver.tap(_buttonDownUp);
    });

    test('tap `up` animated box', () async {
      /// [Gesture 👆] Tap the `IconButton` Widget to drag `Up 🔼`...
      await _driver.tap(_buttonDownUp);
    });

    test('go to `/card/`, scroll list and go back', () async {
      /// Go to route `/card/`.
      await _driver.tap(_cardButton);
      await _driver.waitFor(_cardPage);

      /// verify if have a `Text` widget with
      /// `Cartão virtual bloqueado` text.
      expect(
        await _driver.getText(find.byValueKey('slider-1')),
        'Cartão virtual bloqueado',
      );

      /// verify if have a `FlatButton` widget with `/unlock/` key.
      expect(
        await _driver.getText(_unlockButton),
        'Desbloquear'.toUpperCase(),
      );

      /// Go to route `/unlock/`.
      await _driver.tap(_unlockButton);

      /// Go to route `/item-0/`, item details.
      await _driver.tap(find.byValueKey('item-0'));

      /// [Gesture 👆↕️👆] Drag to `Down` the items of `FlexibleSpaceBar`
      /// Widget, to activating RefreshIndicator
      await _driver.scroll(find.byValueKey('collapsing-toolbar'), 0,
          _halfScreenHeight, verySlowTime);

      // /// [Gesture 👇↕️👇] Drag to `UP` the all items of `SliverList`
      // ///  Widget, until the widget is completely visible.
      // await _driver.scrollIntoView(find.byType('SliverList'));

      /// [Gesture 👇↕️👇] Drag to `UP` the items of `SliverList` Widget,
      /// to recall SliverAppBar
      await _driver.scroll(
          find.byValueKey('item-0'), 0, -_sliverAppBarHeight, slowTime);

      /// [Gesture 👇↕️👇] Drag to `UP` the items of `SliverList` Widget,
      /// 5º list item to the top of screen
      await _driver.scroll(
          find.byValueKey('item-4'), 0, -_sizeScreenHeight, verySlowTime);

      /// [Gesture 👇↕️👇] Drag to `UP` the items of `SliverList` Widget,
      /// 5º list item to the top of screen
      await _driver.scroll(
          find.byValueKey('item-8'), 0, -_sizeScreenHeight, verySlowTime);

      /// [Gesture 👆↕️👆] Drag to `Down` the items of `SliverList` Widget,
      /// 9º list item to the bottom of screen
      await _driver.scroll(
          find.byValueKey('item-8'), 0, _sizeScreenHeight, verySlowTime);

      /// [Gesture 👆↕️👆] Drag to `Down` the items of `SliverList` Widget,
      /// 5º list item to the bottom of screen
      await _driver.scroll(
          find.byValueKey('item-4'), 0, _sizeScreenHeight, verySlowTime);

      /// [Gesture 👆↕️👆] Drag to `Down` the items of `SliverList` Widget,
      /// to activating RefreshIndicator
      await _driver.scroll(
          find.byValueKey('item-0'), 0, _halfScreenHeight, verySlowTime);

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/nuconta/`, then inc/dec the counter and go back', () async {
      /// Go to route `/nuconta/`.
      await _driver.tap(_nuContaButton);
      await _driver.waitFor(_nucontaPage);

      /// Verify the app got to `NuConta`.
      expect(
        await _driver.getText(_titleText),
        "NuConta".toUpperCase(),
      );

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    }, skip: 'Slider item not implemented yet!');

    test('go to `/rewards/`, then inc/dec the counter and go back', () async {
      /// Go to route `/rewards/`.
      await _driver.tap(_rewardsButton);
      await _driver.waitFor(_rewardsPage);

      /// Verify the app got to `Nubank rewards`.
      expect(
        await _driver.getText(_titleText),
        "Nubank rewards".toUpperCase(),
      );

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    }, skip: 'Slider item not implemented yet!');

    test('drag to`down` animated box', () async {
      /// [Gesture 👆↕️👆] Drag to `Down` the `Container` Widget
      /// LESS (➖) than minimum height to start the animation down...
      /// In this case, the animation should be played to BACK previous
      /// position!!!
      await _driver.scroll(_animatedBox, 0, _minDragHeight, slowTime);

      await _driver.scroll(_animatedBox, 0, _minDragHeight, normalTime);

      await _driver.scroll(_animatedBox, 0, _minDragHeight, fastTime);

      /// [Gesture 👆↕️👆] Drag to `Down` the `Container` Widget MORE (➕)
      /// than minimum height to start the animation down...
      await _driver.scroll(_animatedBox, 0, _minDragHeight + 150, normalTime);
    });

    test('go to `/helpme/`, then inc/dec the counter and go back', () async {
      /// Go to route `/helpme/`.
      await _driver.tap(_helpMeButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Me ajuda`.
      expect(
        await _driver.getText(_titleText),
        "Me ajuda".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/profile/`, then inc/dec the counter and go back', () async {
      /// Go to route `/profile/`.
      await _driver.tap(_profileButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Perfil`.
      expect(
        await _driver.getText(_titleText),
        "Perfil".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('drag to `up` the `/profile/` item of list', () async {
      /// [Gesture 👇↕️👇] Drag to `UP` the `ListView` Widget
      /// list, until the widget is completely visible.
      await _driver.scrollIntoView(_profileButton);
    });

    test('go to `/nuconta-configs/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/nuconta-configs/`.
      await _driver.tap(_nuContaConfigsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Configurar NuConta`.
      expect(
        await _driver.getText(_titleText),
        "Configurar NuConta".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/card-configs/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/card-configs/`.
      await _driver.tap(_cardConfigsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Configurar cartão`.
      expect(
        await _driver.getText(_titleText),
        "Configurar cartão".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('drag to `up` the `/card-configs/` item of list', () async {
      /// [Gesture 👇↕️👇] Drag to `UP` the `ListView` Widget
      /// list, until the widget is completely visible.
      await _driver.scrollIntoView(_cardConfigsButton);
    });

    test('go to `/app-configs/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/app-configs/`.
      await _driver.tap(_appConfigsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Configurações do app`.
      expect(
        await _driver.getText(_titleText),
        "Configurações do app".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/exit/` (This route exit the app!!! ❎)', () async {
      /// Go to route `/exit/`.
      await _driver.tap(_exitButton);
    }, skip: 'This route exit the app!!! ❎');

    test('drag to `down` the `/exit/` item of list', () async {
      /// [Gesture 👆↕️👆] Drag to `DOWN` the `ListView` Widget
      /// list, until the widget is completely visible.
      await _driver.scroll(_exitButton, 0, 200, slowTime);
    });

    test('drag to`up` animated box', () async {
      /// [Gesture 👇↕️👇] Drag to `UP` the `Container` Widget
      /// LESS (➖) than minimum height to start the animation up...
      /// In this case, the animation should be played to BACK previous
      /// position!!!
      await _driver.scroll(
          _animatedBoxPointDrag, 0, -(_minDragHeight), slowTime);

      await _driver.scroll(
          _animatedBoxPointDrag, 0, -(_minDragHeight), normalTime);

      await _driver.scroll(
          _animatedBoxPointDrag, 0, -(_minDragHeight), fastTime);

      /// [Gesture 👇↕️👇] Drag to `UP` the `Container` Widget MORE (➕)
      /// than minimum height to start the animation up...
      await _driver.scroll(
          _animatedBoxPointDrag, 0, -(_minDragHeight + 150), normalTime);
    });

    test('go to `/transfer/`, then inc/dec the counter and go back', () async {
      /// Go to route `/transfer/`.
      await _driver.tap(_transferButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Transferir`.
      expect(
        await _driver.getText(_titleText),
        "Transferir".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/virtual-card/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/virtual-card/`.
      await _driver.tap(_virtualCardButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Cartão virtual`.
      expect(
        await _driver.getText(_titleText),
        "Cartão virtual".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('drag to `left` the `/pay/` button of bottom button list', () async {
      /// [Gesture 👉↔️👉] Drag to `LEFT` the `ListView` Widget
      /// buttons, until the widget is completely visible.
      await _driver.scrollIntoView(_payButton);
    });

    test('go to `/pay/`, then inc/dec the counter and go back', () async {
      /// Go to route `/pay/`.
      await _driver.tap(_payButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Pagar`.
      expect(
        await _driver.getText(_titleText),
        "Pagar".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/blocking-card/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/blocking-card/`.
      await _driver.tap(_blockingCardButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Bloquear cartão`.
      expect(
        await _driver.getText(_titleText),
        "Bloquear cartão".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/deposit/`, then inc/dec the counter and go back', () async {
      /// Go to route `/deposit/`.
      await _driver.tap(_depositButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Depositar`.
      expect(
        await _driver.getText(_titleText),
        "Depositar".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('drag to `left` the `/charge/` button of bottom button list',
        () async {
      /// [Gesture 👉↔️👉] Drag to `LEFT` the `ListView` Widget
      /// buttons, until the widget is completely visible.
      await _driver.scrollIntoView(_chargeButton);
    });

    test('go to `/charge/`, then inc/dec the counter and go back', () async {
      /// Go to route `/charge/`.
      await _driver.tap(_chargeButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Cobrar`.
      expect(
        await _driver.getText(_titleText),
        "Cobrar".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/mobile-recharge/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/mobile-recharge/`.
      await _driver.tap(_mobileRechargeButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Recarga de celular`.
      expect(
        await _driver.getText(_titleText),
        "Recarga de celular".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('drag to `/refer-friends/` the `change` button of bottom button list',
        () async {
      /// [Gesture 👉↔️👉] Drag to `LEFT` the `ListView` Widget
      /// buttons, until the widget is completely visible.
      await _driver.scrollIntoView(_referFriendsButton);
    });

    test('go to `/refer-friends/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/refer-friends/`.
      await _driver.tap(_referFriendsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Indicar amigos`.
      expect(
        await _driver.getText(_titleText),
        "Indicar amigos".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/adjust-limit/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/adjust-limit/`.
      await _driver.tap(_adjustLimitButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Ajustar limite`.
      expect(
        await _driver.getText(_titleText),
        "Ajustar limite".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('go to `/organize-shortcuts/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/organize-shortcuts/`.
      await _driver.tap(_organizeShortcutsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Organizar atalhos`.
      expect(
        await _driver.getText(_titleText),
        "Organizar atalhos".toUpperCase(),
      );

      /// Use the `_driver.getText` method to verify the counter starts at `0`.
      expect(await _driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await _driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);
      await _driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await _driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await _driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await _driver.tap(_goBackButton);
      await _driver.waitFor(_homePage);
    });

    test('drag to `/refer-friends/` the `change` button of bottom button list',
        () async {
      /// [Gesture 👈↔️👈] Drag to `RIGHT` the `ListView` Widget buttons.
      await _driver.scroll(_referFriendsButton, 260, 0, slowTime);
    });

    test('drag to `left` the `/charge/` button of bottom button list',
        () async {
      /// [Gesture 👈↔️👈] Drag to `RIGHT` the `ListView` Widget buttons.
      await _driver.scroll(_chargeButton, 260, 0, slowTime);
    });

    test('drag to `left` the `/pay/` button of bottom button list', () async {
      /// [Gesture 👈↔️👈] Drag to `RIGHT` the `ListView` Widget buttons.
      await _driver.scroll(_payButton, 260, 0, slowTime);
    });

    test('drag to `left` the `/transfer/` button of bottom button list',
        () async {
      /// [Gesture 👈↔️👈] Drag to `RIGHT` the `ListView` Widget buttons.
      await _driver.scroll(_transferButton, 260, 0, slowTime);
    });
  });
}
