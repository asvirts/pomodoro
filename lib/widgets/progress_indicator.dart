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
    controller.repeat();
    controller.reverse(from: 100);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    color: Theme.of(context).colorScheme.primary,
                    strokeWidth: 12,
                    strokeCap: StrokeCap.round,
                    value: controller.value,
                    semanticsLabel: 'Time remaining in current pomodoro',
                  ),
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "17:59",
                        style: GoogleFonts.kumbhSans(
                            fontSize: 80,
                            color: Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text("PAUSE")
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
