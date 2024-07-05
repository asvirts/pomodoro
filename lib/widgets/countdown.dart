import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/progress_provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class PomodoroCountdown extends ConsumerWidget {
  const PomodoroCountdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerNotifierProvider);

    return Countdown(
      seconds: timer.first,
      build: (BuildContext context, double time) => Text(
        time.floor().toString(),
        style: GoogleFonts.kumbhSans(
            fontSize: 80,
            color: Theme.of(context).canvasColor,
            fontWeight: FontWeight.bold),
      ),
      interval: const Duration(seconds: 1),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }
}
