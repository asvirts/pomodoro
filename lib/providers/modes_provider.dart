import 'package:pomodoro/providers/progress_provider.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'modes_provider.g.dart';

@riverpod
int timer(ref) => ref.watch(timerNotifierProvider);

@riverpod
int pomodoro(ref) => ref.watch(pomodoroTimerNotifierProvider);

@riverpod
int short(ref) => ref.watch(shortBreakTimerNotifierProvider);

@riverpod
int long(ref) => ref.watch(longBreakTimerNotifierProvider);

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

    switch (newMode) {
      case Modes.pomodoro:
        ref
            .watch(timerNotifierProvider.notifier)
            .updateTimerDuration(pomodoro(ref));
        break;
      case Modes.shortBreak:
        ref
            .watch(timerNotifierProvider.notifier)
            .updateTimerDuration(short(ref));
        break;
      case Modes.longBreak:
        ref
            .watch(timerNotifierProvider.notifier)
            .updateTimerDuration(long(ref));
        break;
    }
  }
}
