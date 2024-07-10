import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/providers/modes_provider.dart';
import 'package:pomodoro/providers/settings_provider.dart';

class ModeSelector extends ConsumerStatefulWidget {
  const ModeSelector({super.key});

  @override
  ConsumerState<ModeSelector> createState() => _ModeSelector();
}

class _ModeSelector extends ConsumerState<ModeSelector> {
  @override
  Widget build(BuildContext context) {
    final mode = ref.watch(modeNotifierProvider.notifier);
    final currentMode = ref.watch(modeNotifierProvider);
    final color = ref.watch(colorsNotifierProvider.notifier);

    TextStyle font = ref.watch(fontNotifierProvider.notifier).getCurrentFont();
    WidgetStatesController controller = WidgetStatesController();

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: const BorderRadius.all(Radius.circular(99))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FilledButton(
              statesController: controller,
              autofocus: true,
              style: FilledButton.styleFrom(
                backgroundColor: currentMode.first == Modes.pomodoro
                    ? color.getCurrentColor()
                    : Theme.of(context).primaryColorDark,
                foregroundColor: currentMode.first == Modes.pomodoro
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).canvasColor.withAlpha(70),
              ),
              onPressed: () {
                mode.updateMode(Modes.pomodoro);
                setState(() {
                  controller.update(WidgetState.selected, true);
                });
              },
              child: Container(
                width: 59,
                child: Text(
                  "pomodoro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: font.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              )),
          FilledButton(
            statesController: controller,
            style: FilledButton.styleFrom(
              backgroundColor: currentMode.first == Modes.shortBreak
                  ? color.getCurrentColor()
                  : Theme.of(context).primaryColorDark,
              foregroundColor: currentMode.first == Modes.shortBreak
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).canvasColor.withAlpha(70),
            ),
            onPressed: () {
              mode.updateMode(Modes.shortBreak);
              setState(() {
                controller.update(WidgetState.selected, true);
              });
            },
            child: Container(
              width: 65,
              child: Text(
                "short break",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: font.fontFamily,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0),
              ),
            ),
          ),
          FilledButton(
              statesController: controller,
              style: FilledButton.styleFrom(
                backgroundColor: currentMode.first == Modes.longBreak
                    ? color.getCurrentColor()
                    : Theme.of(context).primaryColorDark,
                foregroundColor: currentMode.first == Modes.longBreak
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).canvasColor.withAlpha(70),
              ),
              onPressed: () {
                mode.updateMode(Modes.longBreak);
                setState(() {
                  controller.update(WidgetState.selected, true);
                });
              },
              child: Container(
                width: 61,
                child: Text(
                  "long break",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: font.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              )),
        ],
      ),
    );
  }
}
