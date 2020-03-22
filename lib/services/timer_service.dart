import 'dart:core';
import 'dart:async';
import 'package:flutter/widgets.dart';

enum TimerSymbol {
  Zero,
  Over15,
  Over30,
  Over45,
  Over60,
}

class TimerService extends ChangeNotifier {
  Stopwatch _stopwatch;
  Timer _timer;
  bool overOneMinute;

  Duration _currentDuration = Duration.zero;
  Duration get currentDuration => _currentDuration;

  int _minutes = 10;

  int get minutes => _minutes;
  void setMinutes(int newMinutes) {
    _minutes = newMinutes;
    notifyListeners();
  }

  bool get isRunning => _timer != null;

  TimerService() {
    _stopwatch = Stopwatch();
  }

  void start() {
    if (_timer != null) return;
    _timer = Timer.periodic(Duration(seconds: 1), _onTick);
    _stopwatch.start();
    notifyListeners();
  }

  void _onTick(Timer timer) {
    _currentDuration = _stopwatch.elapsed;
    checkOneMinute();
    notifyListeners();
  }

  void reset() {
    stop();
    _stopwatch.reset();
    _currentDuration = Duration.zero;
    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _stopwatch.stop();
    _currentDuration = _stopwatch.elapsed;
    notifyListeners();
  }

  void checkOneMinute() {
    if (currentDuration.inSeconds >= 60) {
      overOneMinute = true;
    }
  }
}
