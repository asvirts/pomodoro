import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/progress_provider.dart';

class ProgressIndicatorWidget extends ConsumerStatefulWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  ConsumerState<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState
    extends ConsumerState<ProgressIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    final currentDuration = ref.watch(timerNotifierProvider);
    final timerText = ref.watch(timerTextNotifierProvider);
    final timerController = ref.watch(timerControllerProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(14, 17, 42, 1),
                Color.fromRGBO(46, 50, 90, 1),
              ])),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(22, 25, 50, 1),
          borderRadius: BorderRadius.circular(999),
        ),
        child: SizedBox(
          width: 248,
          height: 248,
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(children: [
                  CircularCountDownTimer(
                    controller: timerController.first,
                    autoStart: false,
                    width: 248,
                    height: 248,
                    duration: currentDuration.first * 60,
                    isReverseAnimation: true,
                    isReverse: true,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 8,
                    textFormat: CountdownTextFormat.MM_SS,
                    fillColor: Theme.of(context).primaryColor,
                    ringColor: Colors.transparent,
                    textStyle: GoogleFonts.kumbhSans(
                        fontSize: 80,
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.bold),
                    onComplete: () => timerController.first.reset(),
                  ),
                ]),
              ),
              Positioned(
                top: 165,
                left: 45,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        shadowColor: WidgetStateColor.transparent,
                        backgroundColor: WidgetStateColor.transparent,
                        foregroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(215, 224, 255, 1))),
                    onPressed: () => {
                          if (!timerController.first.isStarted)
                            {timerController.first.start()}
                          else if (timerController.first.isPaused)
                            {timerController.first.resume()}
                          else
                            {timerController.first.pause()},
                          ref
                              .watch(timerTextNotifierProvider.notifier)
                              .swapTimer()
                        },
                    child: Text(timerText.first,
                        style: const TextStyle(
                            fontSize: 14,
                            letterSpacing: 13.13,
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
