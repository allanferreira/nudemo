import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group('[Driver -> App]', () {
    // First, define the Finders and use them to locate widgets
    // from the test suite.
    final homeText = find.byValueKey('home-text');
    final creditCardButton = find.byValueKey('credit-card-button');
    final counterText = find.byValueKey('counter-text');
    final incrementButton = find.byValueKey('increment-button');

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
      expect(await driver.getText(homeText), "Backbone");
    });

    test('go to route `/credit-card`, then increments and reset the counter',
        () async {
      /// Go to route `/credit-card`.
      await driver.tap(creditCardButton);

      /// Use the `driver.getText` method to verify the counter starts at `0`.
      expect(await driver.getText(counterText), "0");

      /// First, tap the button.
      await driver.tap(incrementButton);

      /// Then, verify the `counter` text is incremented by `1`.
      expect(await driver.getText(counterText), "1");

      /// tap the button more 3 times.
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);
      await driver.tap(incrementButton);

      /// Then, verify the `counter` text is decremented to `0`.
      expect(await driver.getText(counterText), "0");
    });
  });
}
