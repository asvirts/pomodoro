// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentModeHash() => r'cbf6f1f7a4cf771c3a70d269f80fa6595a7333c6';

/// See also [currentMode].
@ProviderFor(currentMode)
final currentModeProvider = AutoDisposeProvider<Modes>.internal(
  currentMode,
  name: r'currentModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentModeRef = AutoDisposeProviderRef<Modes>;
String _$timerTextNotifierHash() => r'a6acc02de8668fa21cd845d2b0e30cc0cbcb1602';

/// See also [TimerTextNotifier].
@ProviderFor(TimerTextNotifier)
final timerTextNotifierProvider =
    AutoDisposeNotifierProvider<TimerTextNotifier, Set<String>>.internal(
  TimerTextNotifier.new,
  name: r'timerTextNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timerTextNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimerTextNotifier = AutoDisposeNotifier<Set<String>>;
String _$timerStartedNotifierHash() =>
    r'4eb782d0a902170309061d2b7f980e2fa16eb8b8';

/// See also [TimerStartedNotifier].
@ProviderFor(TimerStartedNotifier)
final timerStartedNotifierProvider =
    AutoDisposeNotifierProvider<TimerStartedNotifier, Set<bool>>.internal(
  TimerStartedNotifier.new,
  name: r'timerStartedNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timerStartedNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimerStartedNotifier = AutoDisposeNotifier<Set<bool>>;
String _$timerNotifierHash() => r'803585a5b28229a34616bdc4bbccc47d07b40516';

/// See also [TimerNotifier].
@ProviderFor(TimerNotifier)
final timerNotifierProvider =
    AutoDisposeNotifierProvider<TimerNotifier, Set<int>>.internal(
  TimerNotifier.new,
  name: r'timerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimerNotifier = AutoDisposeNotifier<Set<int>>;
String _$timerControllerHash() => r'73470153ce529f51bd3e1ddf31b951f3459aae00';

/// See also [TimerController].
@ProviderFor(TimerController)
final timerControllerProvider = AutoDisposeNotifierProvider<TimerController,
    Set<CountDownController>>.internal(
  TimerController.new,
  name: r'timerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimerController = AutoDisposeNotifier<Set<CountDownController>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
