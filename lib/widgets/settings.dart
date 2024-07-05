import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/settings_provider.dart' as settings;

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPomodoroTime =
        ref.watch(settings.pomodoroTimerNotifierProvider);
    final currentShortBreakTime =
        ref.watch(settings.shortBreakTimerNotifierProvider);
    final currentLongBreakTime =
        ref.watch(settings.longBreakTimerNotifierProvider);

    final currentFont = ref.watch(settings.fontNotifierProvider);
    final currentColor = ref.watch(settings.colorsNotifierProvider);

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
                        const Text("pomodoro"),
                        Text(currentPomodoroTime.first.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("short break"),
                        Text(currentShortBreakTime.first.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("long break"),
                        Text(currentLongBreakTime.first.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text("FONT"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: RadioListTile(
                                    value: settings.Fonts.sans,
                                    groupValue: currentFont.first,
                                    autofocus: true,
                                    onChanged: (value) {
                                      ref
                                          .watch(settings
                                              .fontNotifierProvider.notifier)
                                          .updateFonts(settings.Fonts.sans);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: RadioListTile(
                                    value: settings.Fonts.serif,
                                    groupValue: currentFont.first,
                                    onChanged: (value) {
                                      ref
                                          .watch(settings
                                              .fontNotifierProvider.notifier)
                                          .updateFonts(settings.Fonts.serif);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: RadioListTile(
                                    value: settings.Fonts.mono,
                                    groupValue: currentFont.first,
                                    onChanged: (value) {
                                      ref
                                          .watch(settings
                                              .fontNotifierProvider.notifier)
                                          .updateFonts(settings.Fonts.mono);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text("COLOR"),
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: RadioListTile(
                                    value: settings.ColorScheme.red,
                                    groupValue: currentColor.first,
                                    autofocus: true,
                                    onChanged: (value) {
                                      ref
                                          .watch(settings
                                              .colorsNotifierProvider.notifier)
                                          .updateColor(
                                              settings.ColorScheme.red);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: RadioListTile(
                                    value: settings.ColorScheme.blue,
                                    groupValue: currentColor.first,
                                    onChanged: (value) {
                                      ref
                                          .watch(settings
                                              .colorsNotifierProvider.notifier)
                                          .updateColor(
                                              settings.ColorScheme.blue);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: RadioListTile(
                                    value: settings.ColorScheme.purple,
                                    groupValue: currentColor.first,
                                    onChanged: (value) {
                                      ref
                                          .watch(settings
                                              .colorsNotifierProvider.notifier)
                                          .updateColor(
                                              settings.ColorScheme.purple);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
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
