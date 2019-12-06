import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group('[Driver -> App]', () {
    // First, define the Finders and use them to locate widgets
    // from the test suite.
    SerializableFinder _titleText = find.byValueKey('title-text');

    SerializableFinder _counterText = find.byValueKey('counter-text');
    SerializableFinder _incrementButton = find.byValueKey('increment-button');
    SerializableFinder _goBackButton = find.byValueKey('go-back-button');
    SerializableFinder _filterButton = find.byValueKey('filter-button');

    SerializableFinder _cardButton = find.byValueKey('/card/');
    SerializableFinder _nuContaButton = find.byValueKey('/nuconta/');
    SerializableFinder _rewardsButton = find.byValueKey('/rewards/');

    SerializableFinder _helpMeButton = find.byValueKey('/helpme/');
    SerializableFinder _profileButton = find.byValueKey('/profile/');
    SerializableFinder _nuContaConfigsButton =
        find.byValueKey('/nuconta-configs/');
    SerializableFinder _cardConfigsButton = find.byValueKey('/card-configs/');
    SerializableFinder _appConfigsButton = find.byValueKey('/app-configs/');

    SerializableFinder _transferButton = find.byValueKey('/transfer/');
    SerializableFinder _virtualCardButton = find.byValueKey('/virtual-card/');
    SerializableFinder _payButton = find.byValueKey('/pay/');
    SerializableFinder _blockingCardButton = find.byValueKey('/blocking-card/');
    SerializableFinder _depositButton = find.byValueKey('/deposit/');
    SerializableFinder _chargeButton = find.byValueKey('/charge/');
    SerializableFinder _mobileRechargeButton =
        find.byValueKey('/mobile-recharge/');
    SerializableFinder _referFriendsButton = find.byValueKey('/refer-friends/');
    SerializableFinder _adjustLimitButton = find.byValueKey('/adjust-limit/');
    SerializableFinder _organizeShortcutsButton =
        find.byValueKey('/organize-shortcuts/');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('starts at `Home page`', () async {
      /// Use the `driver.getText` method to verify the app starts at `Home`.
      expect(await driver.getText(_titleText), "Chinnon");
    });

    test('go to `/card/`, then inc/dec the counter and go back', () async {
      /// Go to route `/card/`.
      await driver.tap(_cardButton);

      /// Verify the app got to `Cartão de crédito`.
      expect(await driver.getText(_titleText), "Cartão de crédito");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    });

    test('go to `/nuconta/`, then inc/dec the counter and go back', () async {
      /// Go to route `/nuconta/`.
      await driver.tap(_nuContaButton);

      /// Verify the app got to `NuConta`.
      expect(await driver.getText(_titleText), "NuConta");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    });

    test('go to `/rewards/`, then inc/dec the counter and go back', () async {
      /// Go to route `/rewards/`.
      await driver.tap(_rewardsButton);

      /// Verify the app got to `Nubank rewards`.
      expect(await driver.getText(_titleText), "Nubank rewards");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    });

    test('go to `/helpme/`, then inc/dec the counter and go back', () async {
      /// Go to route `/helpme/`.
      await driver.tap(_helpMeButton);

      /// Verify the app got to `Me ajuda`.
      expect(await driver.getText(_titleText), "Me ajuda");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Slider box container to down!");

    test('go to `/profile/`, then inc/dec the counter and go back', () async {
      /// Go to route `/profile/`.
      await driver.tap(_profileButton);

      /// Verify the app got to `Perfil`.
      expect(await driver.getText(_titleText), "Perfil");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Slider box container to down!");

    test('go to `/nuconta-configs/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/nuconta-configs/`.
      await driver.tap(_nuContaConfigsButton);

      /// Verify the app got to `Configurar NuConta`.
      expect(await driver.getText(_titleText), "Configurar NuConta");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Slider box container to down!");

    test('go to `/card-configs/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/card-configs/`.
      await driver.tap(_cardConfigsButton);

      /// Verify the app got to `Configurar cartão`.
      expect(await driver.getText(_titleText), "Configurar cartão");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Slider box container to down!");

    test('go to `/app-configs/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/app-configs/`.
      await driver.tap(_appConfigsButton);

      /// Verify the app got to `Configurações do app`.
      expect(await driver.getText(_titleText), "Configurações do app");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Slider box container to down!");

    test('go to `/transfer/`, then inc/dec the counter and go back', () async {
      /// Go to route `/transfer/`.
      await driver.tap(_transferButton);

      /// Verify the app got to `Transferir`.
      expect(await driver.getText(_titleText), "Transferir");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    });

    test('go to `/virtual-card/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/virtual-card/`.
      await driver.tap(_virtualCardButton);

      /// Verify the app got to `Cartão virtual`.
      expect(await driver.getText(_titleText), "Cartão virtual");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    });

    test('go to `/pay/`, then inc/dec the counter and go back', () async {
      /// Go to route `/pay/`.
      await driver.tap(_payButton);

      /// Verify the app got to `Pagar`.
      expect(await driver.getText(_titleText), "Pagar");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    });

    test('go to `/blocking-card/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/blocking-card/`.
      await driver.tap(_blockingCardButton);

      /// Verify the app got to `Bloquear cartão`.
      expect(await driver.getText(_titleText), "Bloquear cartão");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    });

    test('go to `/deposit/`, then inc/dec the counter and go back', () async {
      /// Go to route `/deposit/`.
      await driver.tap(_depositButton);

      /// Verify the app got to `Depositar`.
      expect(await driver.getText(_titleText), "Depositar");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Bottom menu list to left!");

    test('go to `/charge/`, then inc/dec the counter and go back', () async {
      /// Go to route `/charge/`.
      await driver.tap(_chargeButton);

      /// Verify the app got to `Cobrar`.
      expect(await driver.getText(_titleText), "Cobrar");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Bottom menu list to left!");

    test('go to `/mobile-recharge/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/mobile-recharge/`.
      await driver.tap(_mobileRechargeButton);

      /// Verify the app got to `Recarga de celular`.
      expect(await driver.getText(_titleText), "Recarga de celular");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Bottom menu list to left!");

    test('go to `/refer-friends/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/refer-friends/`.
      await driver.tap(_referFriendsButton);

      /// Verify the app got to `Indicar amigos`.
      expect(await driver.getText(_titleText), "Indicar amigos");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Bottom menu list to left!");

    test('go to `/adjust-limit/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/adjust-limit/`.
      await driver.tap(_adjustLimitButton);

      /// Verify the app got to `Ajustar limite`.
      expect(await driver.getText(_titleText), "Ajustar limite");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Bottom menu list to left!");

    test('go to `/organize-shortcuts/`, then inc/dec the counter and go back',
        () async {
      /// Go to route `/organize-shortcuts/`.
      await driver.tap(_organizeShortcutsButton);

      /// Verify the app got to `Organizar atalhos`.
      expect(await driver.getText(_titleText), "Organizar atalhos");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(_counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(_counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);
      await driver.tap(_incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(_counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(_filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(_goBackButton);
    }, skip: "TODO: Needs slip the Bottom menu list to left!");
  });
}
