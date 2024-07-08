import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:pomodoro/providers/settings_provider.dart' as settings;
import 'package:pomodoro/providers/settings_provider.dart';

class FontSelector extends ConsumerStatefulWidget {
  const FontSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FontSelectorState();
}

class _FontSelectorState extends ConsumerState<FontSelector> {
  @override
  Widget build(BuildContext context) {
    final currentFont = ref.watch(settings.fontNotifierProvider);
    final currentSettings = ref.watch(settings.settingsNotifierProvider);
    final settingsToUpdate = ref.watch(settingsUpdateNotifierProvider);

    TextStyle font =
        ref.watch(settings.settingsNotifierProvider.notifier).getCurrentFont();

    return Row(children: [
      GroupButton(
        options: const GroupButtonOptions(
            buttonHeight: 40,
            buttonWidth: 40,
            spacing: 16,
            selectedColor: Color.fromRGBO(22, 25, 50, 1),
            selectedTextStyle: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold),
            unselectedColor: Color.fromRGBO(239, 241, 250, 1),
            unselectedTextStyle: TextStyle(
                color: Color.fromRGBO(30, 33, 63, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold),
            borderRadius: BorderRadius.all(Radius.circular(999))),
        isRadio: true,
        buttons: ["Aa", "Aa", "Aa"],
        onSelected: (value, index, isSelected) => () => ref
            .watch(settings.fontNotifierProvider.notifier)
            .updateFonts(index),
      )
    ]);
  }
}

class ColorSelector extends ConsumerStatefulWidget {
  const ColorSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends ConsumerState<ColorSelector> {
  @override
  Widget build(BuildContext context) {
    final currentSettings = ref.watch(settings.settingsNotifierProvider);
    final settingsToUpdate = ref.watch(settings.settingsUpdateNotifierProvider);

    bool redSelected = true;
    bool blueSelected = false;
    bool purpleSelected = false;

    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        height: 40,
        width: 40,
        child: IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(248, 112, 112, 1)),
            ),
            isSelected: redSelected,
            autofocus: true,
            onPressed: () => {
                  ref
                      .watch(settings.colorsNotifierProvider.notifier)
                      .updateColor(settings.ColorScheme.blue),
                  redSelected = true,
                  blueSelected = false,
                  purpleSelected = false,
                },
            icon: Icon(
              Icons.check,
              color: Colors.transparent,
            ),
            selectedIcon: Icon(
              Icons.check,
              color: Color.fromRGBO(22, 25, 50, 1),
            )),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 40,
        width: 40,
        child: IconButton(
            isSelected: blueSelected,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(112, 243, 248, 1)),
            ),
            onPressed: () => {
                  ref
                      .watch(settings.colorsNotifierProvider.notifier)
                      .updateColor(settings.ColorScheme.blue),
                  redSelected = false,
                  blueSelected = true,
                  purpleSelected = false,
                },
            icon: Icon(
              Icons.check,
              color: Colors.transparent,
            ),
            selectedIcon: Icon(
              Icons.check,
              color: Color.fromRGBO(22, 25, 50, 1),
            )),
      ),
      Container(
        height: 40,
        width: 40,
        child: IconButton(
            isSelected: purpleSelected,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(216, 129, 248, 1)),
            ),
            onPressed: () => {
                  ref
                      .watch(settings.colorsNotifierProvider.notifier)
                      .updateColor(settings.ColorScheme.purple),
                  redSelected = false,
                  blueSelected = false,
                  purpleSelected = true,
                },
            icon: Icon(
              Icons.check,
              color: Colors.transparent,
            ),
            selectedIcon: Icon(
              Icons.check,
              color: Color.fromRGBO(22, 25, 50, 1),
            )),
      ),
    ]);
  }
}
