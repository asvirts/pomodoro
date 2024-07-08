import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/modes_provider.dart';
import 'package:pomodoro/providers/progress_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

class Settings {
  int? time = 25;
  Modes? mode = Modes.pomodoro;
  Fonts? font = Fonts.sans;
  ColorScheme? colors = ColorScheme.red;

  Settings(this.time, this.font, this.mode, this.colors);
}

@riverpod
class SettingsUpdateNotifier extends _$SettingsUpdateNotifier {
  Settings settings = Settings(25, Fonts.sans, Modes.pomodoro, ColorScheme.red);

  @override
  Set<Settings> build() {
    final time = ref.watch(timerNotifierProvider);
    final font = ref.watch(fontNotifierProvider);
    final mode = ref.watch(modeNotifierProvider);
    final color = ref.watch(colorsNotifierProvider);

    Settings stg = Settings(time.first, font.first, mode.first, color.first);

    return {settings};
  }

  // Fonts

  void updateFonts(int index) {
    final time = ref.watch(timerNotifierProvider);
    final mode = ref.watch(modeNotifierProvider);
    final colors = ref.watch(colorsNotifierProvider);

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

    Settings stg = Settings(time.first, newFont, mode.first, colors.first);

    if (stg.font != newFont) {
      state = {stg};
    }
  }

  // Colors

  void updateColor(ColorScheme newScheme) {
    final time = ref.watch(timerNotifierProvider);
    final font = ref.watch(fontNotifierProvider);
    final mode = ref.watch(modeNotifierProvider);

    Settings stg = Settings(time.first, Fonts.sans, mode.first, newScheme);

    if (stg.colors != newScheme) {
      state = {stg};
    }
  }
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  Settings settings = Settings(25, Fonts.sans, Modes.pomodoro, ColorScheme.red);

  @override
  Set<Settings> build() {
    return {settings};
  }

  void updateSettings() {
    final fetch = ref.watch(settingsUpdateNotifierProvider);
    Settings stg = Settings(fetch.first.time, fetch.first.font,
        fetch.first.mode, fetch.first.colors);

    
    settings = stg;
    state = {stg};
  }

  // Fonts

  TextStyle getCurrentFont() {
    TextStyle? newFont;

    switch (state.first.font) {
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
    }

    return newFont;
  }

  TextTheme getCurrentFontTheme() {
    TextTheme? newTheme;

    switch (state.first) {
      case Fonts.sans:
        newTheme = GoogleFonts.kumbhSansTextTheme();
        break;
      case Fonts.serif:
        newTheme = GoogleFonts.robotoSlabTextTheme();
        break;
      case Fonts.mono:
        newTheme = GoogleFonts.spaceMonoTextTheme();
        break;
      default:
        newTheme = GoogleFonts.kumbhSansTextTheme();
    }

    return newTheme;
  }

  // Colors

  Color getCurrentColor() {
    Color? newColor;

    switch (state.first) {
      case ColorScheme.red:
        newColor = const Color.fromRGBO(248, 112, 112, 1);
        break;
      case ColorScheme.blue:
        newColor = const Color.fromRGBO(112, 243, 248, 1);
        break;
      case ColorScheme.purple:
        newColor = const Color.fromRGBO(216, 129, 248, 1);
        break;
      default:
        newColor = const Color.fromRGBO(248, 112, 112, 1);
    }

    return newColor;
  }
}

// Fonts

enum Fonts { sans, serif, mono }

@riverpod
class FontNotifier extends _$FontNotifier {
  @override
  Set<Fonts> build() {
    return {Fonts.sans};
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

enum ColorScheme { red, blue, purple }

@riverpod
class ColorsNotifier extends _$ColorsNotifier {
  @override
  Set<ColorScheme> build() {
    return const {ColorScheme.red};
  }

  void updateColor(ColorScheme newScheme) {
    if (state != newScheme) {
      state = {newScheme};
    }
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

// Timers

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
