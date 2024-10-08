import 'package:pomodoro/providers/progress_provider.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'modes_provider.g.dart';

enum Modes { pomodoro, shortBreak, longBreak }

@riverpod
class ModeNotifier extends _$ModeNotifier {
  @override
  Set<Modes> build() {
    return const {Modes.pomodoro};
  }

  void updateMode(Modes newMode) {
    final pomodoro = ref.watch(pomodoroTimerNotifierProvider);
    final short = ref.watch(shortBreakTimerNotifierProvider);
    final long = ref.watch(longBreakTimerNotifierProvider);

    if (state != newMode) {
      state = {newMode};
    }

    switch (newMode) {
      case Modes.pomodoro:
        ref
            .watch(timerNotifierProvider.notifier)
            .updateTimerDuration(pomodoro.first);
        ref
            .watch(timerControllerProvider)
            .first
            .restart(duration: pomodoro.first * 60);
        break;
      case Modes.shortBreak:
        ref
            .watch(timerNotifierProvider.notifier)
            .updateTimerDuration(short.first);
        ref
            .watch(timerControllerProvider)
            .first
            .restart(duration: short.first * 60);
        break;
      case Modes.longBreak:
        ref
            .watch(timerNotifierProvider.notifier)
            .updateTimerDuration(long.first);
        ref
            .watch(timerControllerProvider)
            .first
            .restart(duration: long.first * 60);
        break;
    }

    ref.watch(timerControllerProvider).first.pause();

    ref.watch(timerTextNotifierProvider.notifier).resetTimer();
  }
}
