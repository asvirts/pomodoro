import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:pomodoro/providers/settings_provider.dart';

class FontSelector extends ConsumerStatefulWidget {
  const FontSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FontSelectorState();
}

class _FontSelectorState extends ConsumerState<FontSelector> {
  @override
  Widget build(BuildContext context) {
    final currentFont = ref.watch(fontNotifierProvider);
    final currentFontIndex = ref.watch(selectedFontIndexProvider);

    GroupButtonController controller = GroupButtonController();

    controller.selectIndex(currentFontIndex.first);

    return Row(children: [
      GroupButton(
          controller: controller,
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
          buttons: const ["Aa", "Aa", "Aa"],
          onSelected: (value, index, isSelected) => {
                ref.watch(fontNotifierProvider.notifier).updateFonts(index),
                ref
                    .watch(selectedFontIndexProvider.notifier)
                    .updateSelectedFontIndex(index)
              })
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
    final red = ref.watch(colorRedSelectedProvider);
    final blue = ref.watch(colorBlueSelectedProvider);
    final purple = ref.watch(colorPurpleSelectedProvider);

    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        height: 40,
        width: 40,
        child: IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(248, 112, 112, 1)),
            ),
            isSelected: red.first,
            onPressed: () {
              ref.watch(selectedColorProvider.notifier).selectColor(0);
              ref.watch(selectedColorProvider.notifier).updateSelectedColor(0);
              ref
                  .watch(colorsNotifierProvider.notifier)
                  .updateColor(PomodoroColors.red);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.transparent,
            ),
            selectedIcon: const Icon(
              Icons.check,
              color: Color.fromRGBO(22, 25, 50, 1),
            )),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 40,
        width: 40,
        child: IconButton(
            isSelected: blue.first,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(112, 243, 248, 1)),
            ),
            onPressed: () {
              ref.watch(selectedColorProvider.notifier).selectColor(1);
              ref.watch(selectedColorProvider.notifier).updateSelectedColor(1);
              ref
                  .watch(colorsNotifierProvider.notifier)
                  .updateColor(PomodoroColors.blue);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.transparent,
            ),
            selectedIcon: const Icon(
              Icons.check,
              color: Color.fromRGBO(22, 25, 50, 1),
            )),
      ),
      SizedBox(
        height: 40,
        width: 40,
        child: IconButton(
            isSelected: purple.first,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(216, 129, 248, 1)),
            ),
            onPressed: () {
              ref
                  .watch(colorsNotifierProvider.notifier)
                  .updateColor(PomodoroColors.purple);
              ref.watch(selectedColorProvider.notifier).selectColor(2);
              ref.watch(selectedColorProvider.notifier).updateSelectedColor(2);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.transparent,
            ),
            selectedIcon: const Icon(
              Icons.check,
              color: Color.fromRGBO(22, 25, 50, 1),
            )),
      ),
    ]);
  }
}
