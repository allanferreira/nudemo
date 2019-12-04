import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group('[Driver -> App]', () {
    // First, define the Finders and use them to locate widgets
    // from the test suite.
    final titleText = find.byValueKey('title-text');
    final creditCardButton = find.byValueKey('credit-card-button');
    final nuContaButton = find.byValueKey('nuconta-button');
    final rewardsButton = find.byValueKey('rewards-button');
    final counterText = find.byValueKey('counter-text');
    final incrementButton = find.byValueKey('increment-button');
    final goBackButton = find.byValueKey('go-back-button');
    final filterButton = find.byValueKey('filter-button');

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
      expect(await driver.getText(titleText), "Chinnon");
    });

    test('go to `/credit-card/`, then increments/reset the counter and go back',
        () async {
      /// Go to route `/credit-card/`.
      await driver.tap(creditCardButton);

      /// Verify the app got to `Cartão de crédito`.
      expect(await driver.getText(titleText), "Cartão de crédito");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(goBackButton);
    });

    test('go to `/nuconta/`, then increments/reset the counter and go back',
        () async {
      /// Go to route `/nuconta/`.
      await driver.tap(nuContaButton);

      /// Verify the app got to `NuConta`.
      expect(await driver.getText(titleText), "NuConta");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(goBackButton);
    });

    test('go to `/rewards/`, then increments/reset the counter and go back',
        () async {
      /// Go to route `/rewards/`.
      await driver.tap(rewardsButton);

      /// Verify the app got to `Nubank rewards`.
      expect(await driver.getText(titleText), "Nubank rewards");

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(counterText), "0");

      /// First, tap the `➕` icon button.
      await driver.tap(incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(counterText), "1");

      /// tap the `➕` icon button more 3 times.
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(counterText), "0");

      /// tap the `🔍` search icon and trigger a frame.
      await driver.tap(filterButton);

      /// tap the `⬅️` arrow_back icon and trigger a frame.
      await driver.tap(goBackButton);
    });
  });
}
