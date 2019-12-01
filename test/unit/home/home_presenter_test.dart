import 'package:test/test.dart';

import 'package:nudemo/home/presenter/home_presenter.dart';

void main() {
  group('[Unit -> HomePresenter]', () {
    HomePresenter homePresenter;

    setUp(() {
      homePresenter = HomePresenter();
    });

    test('initial value should be 0', () {
      expect(homePresenter.getValue(), 0);
    });
  });
}
