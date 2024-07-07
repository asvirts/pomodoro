import 'package:flutter/material.dart';
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

    Settings stf = Settings(time.first, font.first, mode.first, color.first);

    return {settings};
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
    state = {stg};
  }
}

// Fonts and color scheme

enum Fonts { sans, serif, mono }

@riverpod
class FontNotifier extends _$FontNotifier {
  @override
  Set<Fonts> build() {
    return {Fonts.sans};
  }

  TextStyle getCurrentFont() {
    TextStyle? newFont;

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
    }

    return newTheme;
  }

  void updateFonts(Fonts newFonts) {
    if (state != newFonts) {
      state = {newFonts};
    }
  }
}

enum ColorScheme { red, blue, purple }

@riverpod
class ColorIndex extends _$ColorIndex {
  @override
  int build() => 0;

  void updateIndex(int i) {
    state = i;
  }
}

@riverpod
class ColorsNotifier extends _$ColorsNotifier {
  @override
  Set<ColorScheme> build() {
    return const {ColorScheme.red};
  }

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
    }

    return newColor;
  }

  void updateColor(ColorScheme newScheme) {
    if (state != newScheme) {
      state = {newScheme};
    }
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
}
