import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

//   Fonts

enum Fonts { sans, serif, mono }

@riverpod
class FontNotifier extends _$FontNotifier {
  @override
  Set<Fonts> build() {
    return {Fonts.sans};
  }

  TextStyle getCurrentFont() {
    TextStyle newFont;

    switch (state.first) {
      case Fonts.sans:
        newFont = GoogleFonts.kumbhSans();
        break;
      case Fonts.serif:
        newFont = GoogleFonts.robotoSlab();
        break;
      case Fonts.mono:
        newFont = GoogleFonts.spaceMono();
        break;
      default:
        newFont = GoogleFonts.kumbhSans();
        break;
    }

    return newFont;
  }

  TextTheme getCurrentFontTheme() {
    TextTheme newFont;

    switch (state.first) {
      case Fonts.sans:
        newFont = GoogleFonts.kumbhSansTextTheme();
        break;
      case Fonts.serif:
        newFont = GoogleFonts.robotoSlabTextTheme();
        break;
      case Fonts.mono:
        newFont = GoogleFonts.spaceMonoTextTheme();
        break;
      default:
        newFont = GoogleFonts.kumbhSansTextTheme();
        break;
    }

    return newFont;
  }

  void updateFonts(int index) {
    Fonts? newFont;

    switch (index) {
      case 0:
        newFont = Fonts.sans;
        break;
      case 1:
        newFont = Fonts.serif;
        break;
      case 2:
        newFont = Fonts.mono;
        break;
      default:
        newFont = Fonts.sans;
    }

    if (state != newFont) {
      state = {newFont};
    }
  }
}

@riverpod
class SelectedFontIndex extends _$SelectedFontIndex {
  @override
  Set<int> build() {
    return {0};
  }

  void updateSelectedFontIndex(int i) {
    state = {i};
  }
}

//   Colors

enum PomodoroColors { red, blue, purple }

@riverpod
class ColorsNotifier extends _$ColorsNotifier {
  @override
  Set<PomodoroColors> build() {
    return const {PomodoroColors.red};
  }

  void updateColor(PomodoroColors newScheme) {
    if (state != newScheme) {
      state = {newScheme};
    }
  }

  Color getCurrentColor() {
    Color? newColor;

    switch (state.first) {
      case PomodoroColors.red:
        newColor = const Color.fromRGBO(248, 112, 112, 1);
        break;
      case PomodoroColors.blue:
        newColor = const Color.fromRGBO(112, 243, 248, 1);
        break;
      case PomodoroColors.purple:
        newColor = const Color.fromRGBO(216, 129, 248, 1);
        break;
      default:
        newColor = const Color.fromRGBO(248, 112, 112, 1);
    }

    return newColor;
  }
}

@riverpod
class SelectedColor extends _$SelectedColor {
  @override
  Set<int> build() {
    return {0};
  }

  void selectColor(int index) {
    switch (index) {
      case 0:
        ref.watch(colorRedSelectedProvider.notifier).select();
        ref.watch(colorBlueSelectedProvider.notifier).deselect();
        ref.watch(colorPurpleSelectedProvider.notifier).deselect();
        break;
      case 1:
        ref.watch(colorRedSelectedProvider.notifier).deselect();
        ref.watch(colorBlueSelectedProvider.notifier).select();
        ref.watch(colorPurpleSelectedProvider.notifier).deselect();
        break;
      case 2:
        ref.watch(colorRedSelectedProvider.notifier).deselect();
        ref.watch(colorBlueSelectedProvider.notifier).deselect();
        ref.watch(colorPurpleSelectedProvider.notifier).select();
        break;
    }
  }

  void updateSelectedColor(int i) {
    state = {i};
  }
}

@riverpod
class ColorRedSelected extends _$ColorRedSelected {
  @override
  Set<bool> build() {
    return {true};
  }

  void select() {
    state = {true};
  }

  void deselect() {
    state = {false};
  }
}

@riverpod
class ColorBlueSelected extends _$ColorRedSelected {
  @override
  Set<bool> build() {
    return {false};
  }

  void select() {
    state = {true};
  }

  void deselect() {
    state = {false};
  }
}

@riverpod
class ColorPurpleSelected extends _$ColorRedSelected {
  @override
  Set<bool> build() {
    return {false};
  }

  void select() {
    state = {true};
  }

  void deselect() {
    state = {false};
  }
}

//   Timers

@riverpod
class PomodoroTimerNotifier extends _$PomodoroTimerNotifier {
  @override
  Set<int> build() {
    return const {25};
  }

  int getValue() {
    return state.first;
  }

  void updateTimerDuration(int newValue) {
    if (state != newValue) {
      state = {newValue};
    }
  }

  void incrementTimer() {
    int newValue = state.first + 1;
    state = {newValue};
  }

  void decrementTimer() {
    int newValue;

    if (state.first <= 1) {
      newValue = 1;
    } else {
      newValue = state.first - 1;
    }

    state = {newValue};
  }
}

@riverpod
class ShortBreakTimerNotifier extends _$ShortBreakTimerNotifier {
  @override
  Set<int> build() {
    return const {5};
  }

  int getValue() {
    return state.first;
  }

  void updateTimerDuration(int newValue) {
    if (state != newValue) {
      state = {newValue};
    }
  }

  void incrementTimer() {
    int newValue = state.first + 1;
    state = {newValue};
  }

  void decrementTimer() {
    int newValue;

    if (state.first <= 1) {
      newValue = 1;
    } else {
      newValue = state.first - 1;
    }

    state = {newValue};
  }
}

@riverpod
class LongBreakTimerNotifier extends _$LongBreakTimerNotifier {
  @override
  Set<int> build() {
    return const {10};
  }

  int getValue() {
    return state.first;
  }

  void updateTimerDuration(int newValue) {
    if (state != newValue) {
      state = {newValue};
    }
  }

  void incrementTimer() {
    int newValue = state.first + 1;
    state = {newValue};
  }

  void decrementTimer() {
    int newValue;

    if (state.first <= 1) {
      newValue = 1;
    } else {
      newValue = state.first - 1;
    }

    state = {newValue};
  }
}
