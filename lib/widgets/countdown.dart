import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/progress_provider.dart';
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

    String _timerText = started.first ? "PAUSE" : "START";
    started.first ? _controller.start() : _controller.pause();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Countdown(
          controller: _controller,
          seconds: timer.first,
          build: (BuildContext context, double time) => Text(
            time.floor().toString(),
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
