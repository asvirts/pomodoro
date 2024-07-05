import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@riverpod
class PomodoroTimerNotifier extends _$PomodoroTimerNotifier {
  @override
  Set<int> build() {
    return const {25};
  }

  int getValue() {
    return state.first;
  }

  void updateTimerDuration(int newValue) {
    if (state != newValue) {
      state = {newValue};
    }
  }
}

@riverpod
class ShortBreakTimerNotifier extends _$ShortBreakTimerNotifier {
  @override
  Set<int> build() {
    return const {5};
  }

  int getValue() {
    return state.first;
  }

  void updateTimerDuration(int newValue) {
    if (state != newValue) {
      state = {newValue};
    }
  }
}

@riverpod
class LongBreakTimerNotifier extends _$LongBreakTimerNotifier {
  @override
  Set<int> build() {
    return const {10};
  }

  int getValue() {
    return state.first;
  }

  void updateTimerDuration(int newValue) {
    if (state != newValue) {
      state = {newValue};
    }
  }
}
