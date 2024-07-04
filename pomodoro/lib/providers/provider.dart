// Providers
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
int timer(ref) {
  return 15;
}
