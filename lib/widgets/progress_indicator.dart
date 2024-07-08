import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/progress_provider.dart';
import 'package:pomodoro/providers/settings_provider.dart';

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
    final currentSettings = ref.watch(settingsNotifierProvider);
    final currentColor = ref.watch(colorsNotifierProvider);
    final currentDuration = ref.watch(timerNotifierProvider);
    final timerStarted = ref.watch(timerStartedNotifierProvider);
    final timerText = ref.watch(timerTextNotifierProvider);

    final CountDownController controller = CountDownController();

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
                    controller: controller,
                    width: 248,
                    height: 248,
                    duration: currentDuration.first * 60,
                    isReverseAnimation: true,
                    isReverse: true,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 8,
                    fillColor: Theme.of(context).primaryColor,
                    ringColor: Colors.transparent,
                    textStyle: GoogleFonts.kumbhSans(
                        fontSize: 80,
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              Positioned(
                top: 165,
                left: 75,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStateColor.transparent,
                    ),
                    onPressed: () => {
                          if (controller.isPaused)
                            {controller.resume()}
                          else
                            {controller.pause()},
                          ref
                              .watch(timerTextNotifierProvider.notifier)
                              .swapTimer()
                        },
                    child: Text(timerText.first)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
