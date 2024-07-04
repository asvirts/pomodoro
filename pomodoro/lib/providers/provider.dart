// Providers
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

// Progress indicator
@riverpod
int timer(ref) {
  return 1;
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
