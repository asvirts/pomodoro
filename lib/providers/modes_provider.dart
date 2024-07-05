import 'package:pomodoro/providers/progress_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pomodoro/providers/settings_provider.dart';

part 'modes_provider.g.dart';

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
