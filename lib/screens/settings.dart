import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:pomodoro/widgets/radio_buttons.dart';

class SettingsDialog extends ConsumerStatefulWidget {
  const SettingsDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends ConsumerState<SettingsDialog> {
  @override
  Widget build(BuildContext context) {
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
                      const Divider(
                        thickness: 1,
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
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
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("pomodoro"),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: 140,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                          icon: const Icon(
                                            Icons.unfold_more,
                                            color:
                                                Color.fromRGBO(30, 33, 63, .25),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("short break"),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: 140,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                          icon: const Icon(
                                            Icons.unfold_more,
                                            color:
                                                Color.fromRGBO(30, 33, 63, .25),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("long break"),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(239, 241, 250, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 50,
                              width: 140,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                          icon: const Icon(
                                            Icons.unfold_more,
                                            color:
                                                Color.fromRGBO(30, 33, 63, .25),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18),
                                  child: Text(
                                    "FONT",
                                    style: GoogleFonts.kumbhSans(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 4.23,
                                    ),
                                  ),
                                ),
                                const FontSelector(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18),
                                  child: Text(
                                    "COLOR",
                                    style: GoogleFonts.kumbhSans(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 4.23,
                                    ),
                                  ),
                                ),
                                const ColorSelector(),
                              ],
                            )
                          ],
                        ),
                      ),
                      FractionalTranslation(
                        translation: const Offset(0, .8),
                        child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FilledButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: ButtonStyle(
                                    elevation: const WidgetStatePropertyAll(99),
                                    backgroundColor: WidgetStateProperty.all(ref
                                        .watch(colorsNotifierProvider.notifier)
                                        .getCurrentColor()),
                                  ),
                                  child: const Text("Apply"),
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
