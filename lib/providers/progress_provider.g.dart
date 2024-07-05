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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
