// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timerHash() => r'419da0e8adc06cb229e46db5355720a8228b4118';

/// See also [timer].
@ProviderFor(timer)
final timerProvider = AutoDisposeProvider<int>.internal(
  timer,
  name: r'timerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$timerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TimerRef = AutoDisposeProviderRef<int>;
String _$pomodoroHash() => r'0f4059ddffab0221c32c5572380a4fd66dab4572';

/// See also [pomodoro].
@ProviderFor(pomodoro)
final pomodoroProvider = AutoDisposeProvider<int>.internal(
  pomodoro,
  name: r'pomodoroProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pomodoroHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PomodoroRef = AutoDisposeProviderRef<int>;
String _$shortHash() => r'fa4ca181fed37cdd41a39d4b289263568843078f';

/// See also [short].
@ProviderFor(short)
final shortProvider = AutoDisposeProvider<int>.internal(
  short,
  name: r'shortProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$shortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ShortRef = AutoDisposeProviderRef<int>;
String _$longHash() => r'68c78e19ace6891d2e42ebbee808ab33c42c0d66';

/// See also [long].
@ProviderFor(long)
final longProvider = AutoDisposeProvider<int>.internal(
  long,
  name: r'longProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$longHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LongRef = AutoDisposeProviderRef<int>;
String _$modeNotifierHash() => r'3cc2a85ed4f7ba6e6642fb517631d7a5d19cd7ea';

/// See also [ModeNotifier].
@ProviderFor(ModeNotifier)
final modeNotifierProvider =
    AutoDisposeNotifierProvider<ModeNotifier, Set<Modes>>.internal(
  ModeNotifier.new,
  name: r'modeNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$modeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ModeNotifier = AutoDisposeNotifier<Set<Modes>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
