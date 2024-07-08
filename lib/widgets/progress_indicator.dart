import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/providers/progress_provider.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:pomodoro/widgets/countdown.dart';

class ProgressIndicatorWidget extends ConsumerStatefulWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  ConsumerState<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState
    extends ConsumerState<ProgressIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    final currentDuration = ref.read(timerNotifierProvider);

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: currentDuration.first),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentSettings = ref.watch(settingsNotifierProvider);
    final currentColor = ref.watch(colorsNotifierProvider);
    final currentDuration = ref.watch(timerNotifierProvider);

    controller.duration = Duration(seconds: currentDuration.first);

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
                child: SizedBox(
                  width: 248,
                  height: 248,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                    strokeWidth: 12,
                    strokeCap: StrokeCap.round,
                    value: currentDuration.first.toDouble(),
                    semanticsLabel: 'Time remaining in current pomodoro',
                  ),
                ),
              ),
              Center(child: PomodoroCountdown()),
            ],
          ),
        ),
      ),
    );
  }
}
