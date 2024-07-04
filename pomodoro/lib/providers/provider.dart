// Providers
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

// Progress indicator
@riverpod
class TimerNotifier extends _$TimerNotifier {
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

// Segmented buttons
enum Modes { pomodoro, shortBreak, longBreak }

@riverpod
class ModeNotifier extends _$ModeNotifier {
  @override
  Set<Modes> build() {
    return const {Modes.pomodoro};
  }

  void updateMode(Modes newMode) {
    if (state != newMode) {
      state = {newMode};
    }
  }
}
