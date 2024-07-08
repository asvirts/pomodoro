import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:pomodoro/widgets/radio_buttons.dart';

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPomodoroTime = ref.watch(pomodoroTimerNotifierProvider);
    final currentShortBreakTime = ref.watch(shortBreakTimerNotifierProvider);
    final currentLongBreakTime = ref.watch(longBreakTimerNotifierProvider);
    final settingsProvider = ref.watch(settingsNotifierProvider);
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
                            Text("pomodoro"),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: 140,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(ref
                                      .watch(pomodoroTimerNotifierProvider
                                          .notifier)
                                      .getValue()
                                      .toString()),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () => ref
                                              .watch(
                                                  pomodoroTimerNotifierProvider
                                                      .notifier)
                                              .incrementTimer(),
                                          icon: Icon(Icons.keyboard_arrow_up)),
                                      IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () => ref
                                              .watch(
                                                  pomodoroTimerNotifierProvider
                                                      .notifier)
                                              .decrementTimer(),
                                          icon:
                                              Icon(Icons.keyboard_arrow_down)),
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
                            Text("short break"),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: 140,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(ref
                                      .watch(shortBreakTimerNotifierProvider
                                          .notifier)
                                      .getValue()
                                      .toString()),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () => ref
                                              .watch(
                                                  shortBreakTimerNotifierProvider
                                                      .notifier)
                                              .incrementTimer(),
                                          icon: Icon(Icons.keyboard_arrow_up)),
                                      IconButton(
                                          onPressed: () => ref
                                              .watch(
                                                  shortBreakTimerNotifierProvider
                                                      .notifier)
                                              .decrementTimer(),
                                          icon:
                                              Icon(Icons.keyboard_arrow_down)),
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
                            Text("long break"),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: 140,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(ref
                                      .watch(longBreakTimerNotifierProvider
                                          .notifier)
                                      .getValue()
                                      .toString()),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () => ref
                                              .watch(
                                                  longBreakTimerNotifierProvider
                                                      .notifier)
                                              .incrementTimer(),
                                          icon: Icon(Icons.keyboard_arrow_up)),
                                      IconButton(
                                          onPressed: () => ref
                                              .watch(
                                                  longBreakTimerNotifierProvider
                                                      .notifier)
                                              .decrementTimer(),
                                          icon:
                                              Icon(Icons.keyboard_arrow_down)),
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
                                  onPressed: () => {
                                    Navigator.pop(context),
                                    ref
                                        .watch(
                                            settingsNotifierProvider.notifier)
                                        .updateSettings(),
                                  },
                                  style: ButtonStyle(
                                    elevation: WidgetStatePropertyAll(99),
                                    backgroundColor: WidgetStateProperty.all(ref
                                        .watch(
                                            settingsNotifierProvider.notifier)
                                        .getCurrentColor()),
                                  ),
                                  child: Text("Apply"),
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
