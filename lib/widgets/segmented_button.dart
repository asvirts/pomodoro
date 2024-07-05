import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/modes_provider.dart';
import 'package:pomodoro/providers/progress_provider.dart';

class SegmentedButtonWidget extends ConsumerStatefulWidget {
  const SegmentedButtonWidget({super.key});

  @override
  ConsumerState<SegmentedButtonWidget> createState() =>
      _SegmentedButtonWidgetState();
}

class _SegmentedButtonWidgetState extends ConsumerState<SegmentedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final currentMode = ref.watch(modeNotifierProvider);

    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(22, 25, 50, 1),
          borderRadius: BorderRadius.circular(999)),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: SegmentedButton<Modes>(
        showSelectedIcon: false,
        style: SegmentedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          backgroundColor: Color.fromRGBO(22, 25, 50, 1),
          foregroundColor: Color.fromRGBO(215, 224, 255, .4),
          selectedForegroundColor: Color.fromRGBO(30, 33, 63, 1),
          selectedBackgroundColor: Theme.of(context).colorScheme.primary,
          side: const BorderSide(width: 0, style: BorderStyle.none),
          textStyle: GoogleFonts.kumbhSans(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        segments: const <ButtonSegment<Modes>>[
          ButtonSegment<Modes>(value: Modes.pomodoro, label: Text('pomodoro')),
          ButtonSegment<Modes>(
              value: Modes.shortBreak, label: Text('short break')),
          ButtonSegment<Modes>(
              value: Modes.longBreak, label: Text('long break')),
        ],
        selected: currentMode,
        onSelectionChanged: (Set<Modes> newSelection) {
          ref
              .read(modeNotifierProvider.notifier)
              .updateMode(newSelection.first);
          ref.read(timerNotifierProvider);
        },
      ),
    );
  }
}
