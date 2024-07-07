import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/settings_provider.dart' as settings;
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:pomodoro/widgets/radio_buttons.dart';

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
    final settingsProvider = ref.watch(settings.settingsNotifierProvider);
    final settingsToUpdate = ref.watch(settingsUpdateNotifierProvider);

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
                      Container(
                        child: Row(
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
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "TIME (MINUTES)",
                                style: GoogleFonts.kumbhSans(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4.23,
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("pomodoro"),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 40,
                              width: 140,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(currentShortBreakTime.first.toString()),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.keyboard_arrow_up),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("short break"),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 40,
                              width: 140,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(currentShortBreakTime.first.toString()),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.keyboard_arrow_up),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("long break"),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 40,
                              width: 140,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(currentShortBreakTime.first.toString()),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.keyboard_arrow_up),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("FONT"),
                                FontSelector(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("COLOR"),
                                ColorSelector(),
                              ],
                            )
                          ],
                        ),
                      ),
                      FractionalTranslation(
                        translation: Offset(0, .8),
                        child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FilledButton(
                                  onPressed: () => ref
                                      .watch(settingsNotifierProvider.notifier)
                                      .updateSettings(),
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(ref
                                        .watch(settings
                                            .settingsNotifierProvider.notifier)
                                        .getCurrentColor()),
                                  ),
                                  child: Text("APPLY"),
                                )
                              ]),
                        ),
                      )
                    ]),
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
