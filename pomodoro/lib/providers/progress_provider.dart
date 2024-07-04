import 'package:pomodoro/providers/modes_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_provider.g.dart';

@riverpod
Modes currentMode(ref) {
  final mode = ref.watch(modeNotifierProvider);
  return mode;
}

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
