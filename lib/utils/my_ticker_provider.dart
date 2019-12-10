import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

class MyTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(onTick) =>
      Ticker(onTick, debugLabel: kDebugMode ? 'created by $this' : null);
}
