import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:pomodoro/screens/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSettings = ref.watch(settingsNotifierProvider);

    return MaterialApp(
        theme: ThemeData(
          primaryColor:
              ref.watch(settingsNotifierProvider.notifier).getCurrentColor(),
          canvasColor: const Color.fromRGBO(215, 224, 255, 1),
          textTheme: ref
              .watch(settingsNotifierProvider.notifier)
              .getCurrentFontTheme(),
        ),
        home: Home());
  }
}
