import 'package:flutter/material.dart';

class SegmentedButtonWidget extends StatefulWidget {
  const SegmentedButtonWidget({super.key});

  @override
  State<SegmentedButtonWidget> createState() => _SegmentedButtonWidgetState();
}

enum Modes { pomodoro, shortBreak, longBreak }

class _SegmentedButtonWidgetState extends State<SegmentedButtonWidget> {
  Modes modesView = Modes.pomodoro;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Modes>(
      showSelectedIcon: false,
      style: SegmentedButton.styleFrom(
        backgroundColor: Color.fromRGBO(22, 25, 50, 1),
        foregroundColor: Color.fromRGBO(215, 224, 255, 1),
        selectedForegroundColor: Color.fromRGBO(30, 33, 63, 1),
        selectedBackgroundColor: Color.fromRGBO(248, 112, 112, 1),
      ),
      segments: const <ButtonSegment<Modes>>[
        ButtonSegment<Modes>(value: Modes.pomodoro, label: Text('pomodoro')),
        ButtonSegment<Modes>(
            value: Modes.shortBreak, label: Text('short break')),
        ButtonSegment<Modes>(value: Modes.longBreak, label: Text('long break')),
      ],
      selected: <Modes>{modesView},
      onSelectionChanged: (Set<Modes> newSelection) {
        setState(() {
          modesView = newSelection.first;
        });
      },
    );
  }
}
