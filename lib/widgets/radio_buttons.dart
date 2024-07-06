import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:pomodoro/providers/settings_provider.dart' as settings;

class FontSelector extends ConsumerStatefulWidget {
  const FontSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FontSelectorState();
}

class _FontSelectorState extends ConsumerState<FontSelector> {
  @override
  Widget build(BuildContext context) {
    final currentFont = ref.watch(settings.fontNotifierProvider);

    TextStyle font =
        ref.watch(settings.fontNotifierProvider.notifier).getCurrentFont();

    return const Row(children: [
      GroupButton(
        options: GroupButtonOptions(
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
    final currentColor = ref.watch(settings.colorsNotifierProvider);
    final currentIndex = ref.watch(settings.colorIndexProvider);

    final _buttons = ["", "", ""];
    final List<bool> selectedButton = <bool>[true, false, false];

    return Row(children: [
      ToggleButtons(
        isSelected: selectedButton,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _buttons.length; i++) {
              selectedButton[i] = i == index;
            }
          });
        },
        renderBorder: false,
        selectedColor: Color.fromRGBO(22, 25, 50, 1),
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Color.fromRGBO(248, 112, 112, 1),
                borderRadius: BorderRadius.circular(99)),
            child: Icon(
              Icons.check,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Color.fromRGBO(112, 243, 248, 1),
                borderRadius: BorderRadius.circular(99)),
            child: Icon(
              Icons.check,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Color.fromRGBO(216, 129, 248, 1),
                borderRadius: BorderRadius.circular(99)),
            child: Icon(
              Icons.check,
            ),
          )
        ],
      )
    ]);
  }
}
