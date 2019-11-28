import 'package:test/test.dart';

import 'package:nudemo/home/viewmodel/counter_viewmodel.dart';

void main() {
  group('CounterViewModel', () {
    CounterViewModel counterViewModel;

    setUp(() {
      counterViewModel = CounterViewModel(0);
    });

    test('Counter initial value should be 0', () {
      expect(counterViewModel.value, 0);
    });
  });
}
