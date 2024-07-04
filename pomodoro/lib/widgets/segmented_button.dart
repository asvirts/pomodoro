import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          selectedBackgroundColor: Color.fromRGBO(248, 112, 112, 1),
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
        selected: <Modes>{modesView},
        onSelectionChanged: (Set<Modes> newSelection) {
          setState(() {
            modesView = newSelection.first;
          });
        },
      ),
    );
  }
}
