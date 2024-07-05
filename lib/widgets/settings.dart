import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/settings_provider.dart';

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPomodoroTime = ref.watch(pomodoroTimerNotifierProvider);
    final currentShortBreakTime = ref.watch(shortBreakTimerNotifierProvider);
    final currentLongBreakTime = ref.watch(longBreakTimerNotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Settings",
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color.fromRGBO(30, 33, 63, .5),
                              size: 14.0,
                              semanticLabel: 'Close app settings',
                            ),
                          ),
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "TIME (MINUTES)",
                        style: GoogleFonts.kumbhSans(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.23,
                        ),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("pomodoro"),
                        Text(currentPomodoroTime.first.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("short break"),
                        Text(currentShortBreakTime.first.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("long break"),
                        Text(currentLongBreakTime.first.toString())
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: const Icon(
            Icons.settings,
            color: Color.fromRGBO(215, 224, 255, 1),
            size: 28.0,
            semanticLabel: 'App settings',
          ),
        ),
      ],
    );
  }
}
