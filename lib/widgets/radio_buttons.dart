import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                  .watch(settings.fontNotifierProvider.notifier)
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
                  .watch(settings.fontNotifierProvider.notifier)
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
                  .watch(settings.fontNotifierProvider.notifier)
                  .updateFonts(settings.Fonts.mono);
            },
          ),
        ),
      ],
    );
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

    return Row(
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
                  .watch(settings.colorsNotifierProvider.notifier)
                  .updateColor(settings.ColorScheme.red);
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
                  .watch(settings.colorsNotifierProvider.notifier)
                  .updateColor(settings.ColorScheme.blue);
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
                  .watch(settings.colorsNotifierProvider.notifier)
                  .updateColor(settings.ColorScheme.purple);
            },
          ),
        ),
      ],
    );
  }
}
