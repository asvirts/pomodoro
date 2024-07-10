import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:test/test.dart';

class FontSelector extends ConsumerStatefulWidget {
  const FontSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FontSelectorState();
}

class _FontSelectorState extends ConsumerState<FontSelector> {
  @override
  Widget build(BuildContext context) {
    final red = ref.watch(colorRedSelectedProvider);
    final blue = ref.watch(colorBlueSelectedProvider);
    final purple = ref.watch(colorPurpleSelectedProvider);

    final sans = ref.watch(fontSansSelectedProvider);
    final serif = ref.watch(fontSerifSelectedProvider);
    final mono = ref.watch(fontMonoSelectedProvider);

    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        height: 40,
        width: 40,
        child: IconButton(
            style: ButtonStyle(
              backgroundColor: sans.first
                  ? WidgetStateProperty.all(const Color.fromRGBO(22, 25, 50, 1))
                  : WidgetStateProperty.all(
                      const Color.fromRGBO(239, 241, 250, 1)),
            ),
            isSelected: sans.first ? true : false,
            onPressed: () {
              ref.watch(fontNotifierProvider.notifier).updateFonts(0);
              ref.watch(selectedFontProvider.notifier).selectFont(0);
              ref.watch(selectedFontProvider.notifier).updateSelectedFont(0);
            },
            icon: Text(
              "Aa",
              style: TextStyle(
                  color: const Color.fromRGBO(22, 25, 50, 1),
                  fontFamily: GoogleFonts.kumbhSans().fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            selectedIcon: Text(
              "Aa",
              style: TextStyle(
                  color: const Color.fromRGBO(239, 241, 250, 1),
                  fontFamily: GoogleFonts.kumbhSans().fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 40,
        width: 40,
        child: IconButton(
            isSelected: serif.first ? true : false,
            style: ButtonStyle(
              backgroundColor: serif.first
                  ? WidgetStateProperty.all(const Color.fromRGBO(22, 25, 50, 1))
                  : WidgetStateProperty.all(
                      const Color.fromRGBO(239, 241, 250, 1)),
            ),
            onPressed: () {
              ref.watch(fontNotifierProvider.notifier).updateFonts(1);
              ref.watch(selectedFontProvider.notifier).selectFont(1);
              ref.watch(selectedFontProvider.notifier).updateSelectedFont(1);
            },
            icon: Text(
              "Aa",
              style: TextStyle(
                  color: Color.fromRGBO(22, 25, 50, 1),
                  fontFamily: GoogleFonts.robotoSlab().fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            selectedIcon: Text(
              "Aa",
              style: TextStyle(
                  color: Color.fromRGBO(239, 241, 250, 1),
                  fontFamily: GoogleFonts.robotoSlab().fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
      ),
      SizedBox(
        height: 40,
        width: 40,
        child: IconButton(
            isSelected: mono.first ? true : false,
            style: ButtonStyle(
              backgroundColor: mono.first
                  ? WidgetStateProperty.all(const Color.fromRGBO(22, 25, 50, 1))
                  : WidgetStateProperty.all(
                      const Color.fromRGBO(239, 241, 250, 1)),
            ),
            onPressed: () {
              ref.watch(fontNotifierProvider.notifier).updateFonts(2);
              ref.watch(selectedFontProvider.notifier).selectFont(2);
              ref.watch(selectedFontProvider.notifier).updateSelectedFont(2);
            },
            icon: Text(
              "Aa",
              style: TextStyle(
                  color: const Color.fromRGBO(22, 25, 50, 1),
                  fontFamily: GoogleFonts.spaceMono().fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            selectedIcon: Text(
              "Aa",
              style: TextStyle(
                  color: const Color.fromRGBO(239, 241, 250, 1),
                  fontFamily: GoogleFonts.spaceMono().fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
      ),
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
            isSelected: red.first ? true : false,
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
            isSelected: blue.first ? true : false,
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
            isSelected: purple.first ? true : false,
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
