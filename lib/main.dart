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
    final selectedFont = ref.watch(fontNotifierProvider);

    return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(248, 112, 112, 1),
          canvasColor: const Color.fromRGBO(215, 224, 255, 1),
          textTheme:
              ref.watch(fontNotifierProvider.notifier).getCurrentFontTheme(),
        ),
        home: const Home());
  }
}
