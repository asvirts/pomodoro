import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
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
    final getColor = ref.watch(colorsNotifierProvider.notifier);
    final font = ref.watch(fontNotifierProvider);
    final pomo = ref.watch(pomodoroTimerNotifierProvider.notifier);
    final short = ref.watch(shortBreakTimerNotifierProvider.notifier);
    final long = ref.watch(longBreakTimerNotifierProvider.notifier);

    DropdownController pomoController = DropdownController();
    DropdownController shortController = DropdownController();
    DropdownController longController = DropdownController();

    List<CoolDropdownItem> pomoList = [];

    for (var i = 20; i < 31; i++) {
      pomoList.add(
        CoolDropdownItem(label: i.toString(), value: i),
      );
    }

    List<CoolDropdownItem> shortList = [];

    for (var i = 1; i < 11; i++) {
      shortList.add(
        CoolDropdownItem(label: i.toString(), value: i),
      );
    }

    List<CoolDropdownItem> longList = [];

    for (var i = 10; i < 21; i++) {
      longList.add(
        CoolDropdownItem(label: i.toString(), value: i),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (context) => Dialog(
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
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Color.fromRGBO(30, 33, 63, .5),
                                  semanticLabel: 'Close app settings',
                                ),
                                visualDensity: VisualDensity.compact,
                                iconSize: 14,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
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
                              width: 140,
                              height: 40,
                              child: CoolDropdown(
                                  dropdownItemOptions: DropdownItemOptions(
                                      selectedTextStyle: TextStyle(
                                        color: Color.fromRGBO(30, 33, 63, 1),
                                      ),
                                      selectedBoxDecoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(239, 241, 250, .5),
                                      )),
                                  resultOptions: ResultOptions(
                                      openBoxDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                            color: Color.fromRGBO(
                                                239, 241, 250, 1),
                                          )),
                                      icon: Icon(
                                        Icons.unfold_more,
                                        color: Color.fromRGBO(30, 33, 63, .25),
                                      )),
                                  dropdownOptions: const DropdownOptions(
                                      color: Color.fromRGBO(239, 241, 250, 1),
                                      duration: Duration(milliseconds: 100)),
                                  dropdownList: pomoList,
                                  controller: pomoController,
                                  defaultItem: pomoList[5],
                                  onChange: (value) =>
                                      pomo.updateTimerDuration(value)),
                            )
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
                              width: 140,
                              height: 40,
                              child: CoolDropdown(
                                  dropdownItemOptions: DropdownItemOptions(
                                      selectedTextStyle: TextStyle(
                                        color: Color.fromRGBO(30, 33, 63, 1),
                                      ),
                                      selectedBoxDecoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(239, 241, 250, .5),
                                      )),
                                  resultOptions: ResultOptions(
                                      openBoxDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                            color: Color.fromRGBO(
                                                239, 241, 250, 1),
                                          )),
                                      icon: Icon(
                                        Icons.unfold_more,
                                        color: Color.fromRGBO(30, 33, 63, .25),
                                      )),
                                  dropdownOptions: const DropdownOptions(
                                      color: Color.fromRGBO(239, 241, 250, 1),
                                      duration: Duration(milliseconds: 100)),
                                  dropdownList: shortList,
                                  controller: shortController,
                                  defaultItem: shortList[4],
                                  onChange: (value) =>
                                      short.updateTimerDuration(value)),
                            )
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
                              width: 140,
                              height: 40,
                              child: CoolDropdown(
                                  dropdownItemOptions: DropdownItemOptions(
                                      selectedTextStyle: TextStyle(
                                        color: Color.fromRGBO(30, 33, 63, 1),
                                      ),
                                      selectedBoxDecoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(239, 241, 250, .5),
                                      )),
                                  resultOptions: ResultOptions(
                                      openBoxDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                            color: Color.fromRGBO(
                                                239, 241, 250, 1),
                                          )),
                                      icon: Icon(
                                        Icons.unfold_more,
                                        color: Color.fromRGBO(30, 33, 63, .25),
                                      )),
                                  dropdownOptions: const DropdownOptions(
                                      color: Color.fromRGBO(239, 241, 250, 1),
                                      duration: Duration(milliseconds: 100)),
                                  dropdownList: longList,
                                  controller: longController,
                                  defaultItem: longList[5],
                                  onChange: (value) =>
                                      long.updateTimerDuration(value)),
                            )
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Settings applied'),
                                    ));
                                  },
                                  style: ButtonStyle(
                                    elevation: const WidgetStatePropertyAll(99),
                                    backgroundColor: WidgetStateProperty.all(
                                        getColor.getCurrentColor()),
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
