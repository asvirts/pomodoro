import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/modes_provider.dart';
import 'package:pomodoro/providers/progress_provider.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class PomodoroCountdown extends ConsumerStatefulWidget {
  const PomodoroCountdown({super.key});

  @override
  _PomodoroCountdownState createState() => _PomodoroCountdownState();
}

class _PomodoroCountdownState extends ConsumerState<PomodoroCountdown> {
  final CountdownController _controller = CountdownController(autoStart: false);

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(timerNotifierProvider);
    final started = ref.watch(timerStartedNotifierProvider);
    final modeSwitched = ref.watch(modeNotifierProvider);

    int _timer = timer.first;

    String _timerText = started.first ? "PAUSE" : "START";
    started.first ? _controller.start() : _controller.pause();

    switch (modeSwitched.first) {
      case Modes.pomodoro:
        _timer = ref.watch(pomodoroTimerNotifierProvider.notifier).getValue();
        break;
      case Modes.shortBreak:
        _timer = ref.watch(shortBreakTimerNotifierProvider.notifier).getValue();
        break;
      case Modes.longBreak:
        _timer = ref.watch(longBreakTimerNotifierProvider.notifier).getValue();
        break;
    }

    formattedTime({required int timeInSecond}) {
      int sec = timeInSecond % 60;
      int min = (timeInSecond / 60).floor();
      String minute = min.toString().length <= 1 ? "0$min" : "$min";
      String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
      return "$minute:$second";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Countdown(
          controller: _controller,
          seconds: _timer * 60,
          build: (BuildContext context, double time) => Text(
            formattedTime(timeInSecond: time.round()),
            style: GoogleFonts.kumbhSans(
                fontSize: 80,
                color: Theme.of(context).canvasColor,
                fontWeight: FontWeight.bold),
          ),
          interval: const Duration(seconds: 1),
        ),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStateColor.transparent,
                foregroundColor: WidgetStateColor.transparent,
                shadowColor: WidgetStateColor.transparent),
            onPressed: () =>
                ref.watch(timerStartedNotifierProvider.notifier).swapTimer(),
            child: Text(
              _timerText,
              style: const TextStyle(
                color: Color.fromRGBO(215, 224, 255, 1),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 13.13,
              ),
            )),
      ],
    );
  }
}
