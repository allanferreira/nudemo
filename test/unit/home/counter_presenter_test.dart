import 'package:test/test.dart';

import 'package:nudemo/home/presenter/counter_presenter.dart';

void main() {
  group('BasicCounterPresenter', () {
    BasicCounterPresenter counterPresenter;

    setUp(() {
      counterPresenter = BasicCounterPresenter();
    });

    test('Counter initial value should be 0', () {
      expect(counterPresenter.getValue(), 0);
    });

    test('Counter value should be incremented', () {
      counterPresenter.onfloatingButtonClicked();

      expect(counterPresenter.getValue(), 1);
    });

    test('Counter value should be incremented to 3', () {
      counterPresenter.onfloatingButtonClicked();
      counterPresenter.onfloatingButtonClicked();
      counterPresenter.onfloatingButtonClicked();

      expect(counterPresenter.getValue(), 3);
    });

    test('Counter value should be decremented to 0 when reach 4', () {
      counterPresenter.onfloatingButtonClicked();
      counterPresenter.onfloatingButtonClicked();
      counterPresenter.onfloatingButtonClicked();
      counterPresenter.onfloatingButtonClicked();

      expect(counterPresenter.getValue(), 0);
    });
  });
}
