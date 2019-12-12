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
    final SerializableFinder _animatedBox = find.byValueKey('section-iv');
    final SerializableFinder _animatedBoxPointDrag =
        find.byValueKey('point-drag');
    final SerializableFinder _buttonDownUp = find.byValueKey('icon-drag');
    final SerializableFinder _buttonList = find.byValueKey('button-list');
    final SerializableFinder _titleText = find.byValueKey('title-text');

    final SerializableFinder _counterText = find.byValueKey('counter-text');
    final SerializableFinder _incrementButton =
        find.byValueKey('increment-button');
    final SerializableFinder _goBackButton = find.byValueKey('go-back-button');
    final SerializableFinder _filterButton = find.byValueKey('filter-button');

    final SerializableFinder _cardButton = find.byValueKey('/card/');
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
    double _sizeScreenWidth;
    double _sizeScreenHeight;
    double _minDragHeight;

    final Duration fastTime = Duration(milliseconds: 50);
    final Duration normalTime = Duration(milliseconds: 150);
    final Duration slowTime = Duration(milliseconds: 300);

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      _driver = await FlutterDriver.connect();

      // Awaiting full application loading (including animations)
      await _driver.waitFor(_myApp);

      // Get size screen (device absolute pixels)
      dynamic _sizeScreen = (await _driver.getBottomRight(_myApp));
      // _sizeScreenWidth = _sizeScreen.dx;
      _sizeScreenHeight = _sizeScreen.dy;
      _minDragHeight = (_sizeScreenHeight / 2) * 0.20;
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

    test('Tap `down` test', () async {
      /// [Gesture 👆] Tap the `IconButton` Widget to drag `Down 🔽`
      await _driver.tap(_buttonDownUp);
      await _driver.waitFor(_animatedBox);
    });

    test('Tap `up` test', () async {
      /// [Gesture 👆] Tap the `IconButton` Widget to drag `Up 🔼`...
      await _driver.tap(_buttonDownUp);
      await _driver.waitFor(_animatedBox);
    });

    test('go to `/card/`, then inc/dec the counter and go back', () async {
      /// Go to route `/card/`.
      await _driver.tap(_cardButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Cartão de crédito`.
      expect(await _driver.getText(_titleText), "Cartão de crédito");

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

    test('go to `/nuconta/`, then inc/dec the counter and go back', () async {
      /// Go to route `/nuconta/`.
      await _driver.tap(_nuContaButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `NuConta`.
      expect(await _driver.getText(_titleText), "NuConta");

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

    test('go to `/rewards/`, then inc/dec the counter and go back', () async {
      /// Go to route `/rewards/`.
      await _driver.tap(_rewardsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Nubank rewards`.
      expect(await _driver.getText(_titleText), "Nubank rewards");

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

    test('Drag `down` test', () async {
      /// [Gesture 👉↔️👉] Drag `Down` the `FlutterLogo` Widget LESS (➖)
      /// than minimum height to start the animation down...
      /// In this case, the animation should be played to BACK previous
      /// position!!!
      await _driver.scroll(_animatedBox, 0, _minDragHeight, slowTime);
      await _driver.waitFor(_animatedBox);

      await _driver.scroll(_animatedBox, 0, _minDragHeight, normalTime);
      await _driver.waitFor(_animatedBox);

      await _driver.scroll(_animatedBox, 0, _minDragHeight, fastTime);
      await _driver.waitFor(_animatedBox);

      /// [Gesture 👉↔️👉] Drag `Down` the `FlutterLogo` Widget MORE (➕)
      /// than minimum height to start the animation down...
      await _driver.scroll(_animatedBox, 0, _minDragHeight + 100, normalTime);
      await _driver.waitFor(_animatedBox);
    });

    test('go to `/helpme/`, then inc/dec the counter and go back', () async {
      /// Go to route `/helpme/`.
      await _driver.tap(_helpMeButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Me ajuda`.
      expect(await _driver.getText(_titleText), "Me ajuda");

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
      expect(await _driver.getText(_titleText), "Perfil");

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

    test('go to `/nuconta-configs/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/nuconta-configs/`.
      await _driver.tap(_nuContaConfigsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Configurar NuConta`.
      expect(await _driver.getText(_titleText), "Configurar NuConta");

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
      expect(await _driver.getText(_titleText), "Configurar cartão");

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

    test('go to `/app-configs/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/app-configs/`.
      await _driver.tap(_appConfigsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Configurações do app`.
      expect(await _driver.getText(_titleText), "Configurações do app");

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

    test('Drag `up` test', () async {
      /// [Gesture 👉↔️👉] Drag `UP` the `FlutterLogo` Widget LESS (➖)
      /// than minimum height to start the animation up...
      /// In this case, the animation should be played to BACK previous
      /// position!!!
      await _driver.scroll(
          _animatedBoxPointDrag, 0, -(_minDragHeight), slowTime);
      await _driver.waitFor(_animatedBox);

      await _driver.scroll(
          _animatedBoxPointDrag, 0, -(_minDragHeight), normalTime);
      await _driver.waitFor(_animatedBox);

      await _driver.scroll(
          _animatedBoxPointDrag, 0, -(_minDragHeight), fastTime);
      await _driver.waitFor(_animatedBox);

      /// [Gesture 👉↔️👉] Drag `UP` the `FlutterLogo` Widget MORE (➕)
      /// than minimum height to start the animation up...
      await _driver.scroll(
          _animatedBoxPointDrag, 0, -(_minDragHeight + 100), normalTime);
      await _driver.waitFor(_animatedBox);
    });

    test('go to `/transfer/`, then inc/dec the counter and go back', () async {
      /// Go to route `/transfer/`.
      await _driver.tap(_transferButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Transferir`.
      expect(await _driver.getText(_titleText), "Transferir");

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
      expect(await _driver.getText(_titleText), "Cartão virtual");

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

    test('go to `/pay/`, then inc/dec the counter and go back', () async {
      await _driver.scroll(
          _payButton, -(_sizeScreenWidth / 2), 0, normalTime);
      await _driver.waitFor(_buttonList);

      /// Go to route `/pay/`.
      await _driver.tap(_payButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Pagar`.
      expect(await _driver.getText(_titleText), "Pagar");

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
    }, skip: "Fail on drag the listView!");

    test('go to `/blocking-card/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/blocking-card/`.
      await _driver.tap(_blockingCardButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Bloquear cartão`.
      expect(await _driver.getText(_titleText), "Bloquear cartão");

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
    }, skip: "Fail on drag the listView!");

    test('go to `/deposit/`, then inc/dec the counter and go back', () async {
      await _driver.scroll(
          _depositButton, -(_sizeScreenWidth / 2), 0, normalTime);
      await _driver.waitFor(_buttonList);

      /// Go to route `/deposit/`.
      await _driver.tap(_depositButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Depositar`.
      expect(await _driver.getText(_titleText), "Depositar");

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
    }, skip: "Fail on drag the listView!");

    test('go to `/charge/`, then inc/dec the counter and go back', () async {
      /// Go to route `/charge/`.
      await _driver.tap(_chargeButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Cobrar`.
      expect(await _driver.getText(_titleText), "Cobrar");

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
    }, skip: "Fail on drag the listView!");

    test('go to `/mobile-recharge/`, then inc/dec the counter and go back',
        () async {
      await _driver.scroll(
          _mobileRechargeButton, -(_sizeScreenWidth / 2), 0, normalTime);
      await _driver.waitFor(_buttonList);

      /// Go to route `/mobile-recharge/`.
      await _driver.tap(_mobileRechargeButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Recarga de celular`.
      expect(await _driver.getText(_titleText), "Recarga de celular");

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
    }, skip: "Fail on drag the listView!");

    test('go to `/refer-friends/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/refer-friends/`.
      await _driver.tap(_referFriendsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Indicar amigos`.
      expect(await _driver.getText(_titleText), "Indicar amigos");

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
    }, skip: "Fail on drag the listView!");

    test('go to `/adjust-limit/`, then inc/dec the counter and go back',
        () async {
      await _driver.scroll(
          _adjustLimitButton, -(_sizeScreenWidth / 2), 0, normalTime);
      await _driver.waitFor(_buttonList);

      /// Go to route `/adjust-limit/`.
      await _driver.tap(_adjustLimitButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Ajustar limite`.
      expect(await _driver.getText(_titleText), "Ajustar limite");

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
    }, skip: "Fail on drag the listView!");

    test('go to `/organize-shortcuts/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/organize-shortcuts/`.
      await _driver.tap(_organizeShortcutsButton);
      await _driver.waitFor(_constructionPage);

      /// Verify the app got to `Organizar atalhos`.
      expect(await _driver.getText(_titleText), "Organizar atalhos");

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
    }, skip: "Fail on drag the listView!");
  });
}
