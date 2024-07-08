import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/modes_provider.dart';
import 'package:pomodoro/providers/progress_provider.dart';
import 'package:pomodoro/providers/settings_provider.dart';

class SegmentedButtonWidget extends ConsumerStatefulWidget {
  const SegmentedButtonWidget({super.key});

  @override
  ConsumerState<SegmentedButtonWidget> createState() =>
      _SegmentedButtonWidgetState();
}

class _SegmentedButtonWidgetState extends ConsumerState<SegmentedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final currentSettings = ref.watch(settingsNotifierProvider);
    final settingsToUpdate = ref.watch(settingsUpdateNotifierProvider);
    final currentMode = ref.watch(modeNotifierProvider);

    TextStyle font =
        ref.watch(settingsNotifierProvider.notifier).getCurrentFont();

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(22, 25, 50, 1),
              borderRadius: BorderRadius.circular(999)),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: SegmentedButton<Modes>(
            showSelectedIcon: false,
            style: SegmentedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              backgroundColor: const Color.fromRGBO(22, 25, 50, 1),
              foregroundColor: const Color.fromRGBO(215, 224, 255, .4),
              selectedForegroundColor: const Color.fromRGBO(30, 33, 63, 1),
              selectedBackgroundColor: ref
                  .watch(settingsNotifierProvider.notifier)
                  .getCurrentColor(),
              side: const BorderSide(width: 0, style: BorderStyle.none),
              textStyle: font,
            ),
            segments: <ButtonSegment<Modes>>[
              ButtonSegment<Modes>(
                  value: Modes.pomodoro, label: Text('pomodoro', style: font)),
              ButtonSegment<Modes>(
                  value: Modes.shortBreak,
                  label: Text('short break', style: font)),
              ButtonSegment<Modes>(
                  value: Modes.longBreak,
                  label: Text('long break', style: font)),
            ],
            selected: currentMode,
            onSelectionChanged: (Set<Modes> newSelection) => [
              ref
                  .watch(modeNotifierProvider.notifier)
                  .updateMode(newSelection.first)
            ],
          ),
        ),
      ],
    );
  }
}
