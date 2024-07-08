import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:pomodoro/providers/modes_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_provider.g.dart';

@riverpod
Modes currentMode(ref) {
  final mode = ref.watch(modeNotifierProvider);
  return mode;
}

@riverpod
class TimerTextNotifier extends _$TimerTextNotifier {
  @override
  Set<String> build() {
    return const {"START"};
  }

  void swapTimer() {
    switch (state.first) {
      case "START":
        state = {"PAUSE"};
        ref.watch(timerControllerProvider).first.start();
        break;
      case "PAUSE":
        state = {"START"};
        ref.watch(timerControllerProvider).first.pause();
        break;
    }
  }

  void resetTimer() {
    state = {"START"};
  }
}

@riverpod
class TimerStartedNotifier extends _$TimerStartedNotifier {
  @override
  Set<bool> build() {
    return const {false};
  }

  void swapTimer() {
    bool temp = !state.first;
    state = {temp};
  }
}

@riverpod
class TimerNotifier extends _$TimerNotifier {
  @override
  Set<int> build() {
    return const {25};
  }

  Timer getTimer() {
    return Timer(Duration(minutes: state.first), () {});
  }

  void updateTimerDuration(int newValue) {
    if (state != newValue) {
      state = {newValue};
    }
  }
}

@riverpod
class TimerController extends _$TimerController {
  @override
  Set<CountDownController> build() {
    final CountDownController controller = CountDownController();
    return {controller};
  }
}
