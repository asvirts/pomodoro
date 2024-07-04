// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timerHash() => r'ded716a8be1b42d990b8643132b1396a5b193fc2';

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
String _$modeNotifierHash() => r'817b7010069b9af9423fbbf60b5521a9001b6395';

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
