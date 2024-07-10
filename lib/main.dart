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
    final font = ref.watch(fontNotifierProvider);
    final getFont = ref.watch(fontNotifierProvider.notifier);
    final color = ref.watch(colorsNotifierProvider);
    final getColor = ref.watch(colorsNotifierProvider.notifier);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: getColor.getCurrentColor(),
          canvasColor: const Color.fromRGBO(215, 224, 255, 1),
          primaryColorDark: const Color.fromRGBO(22, 25, 50, 1),
          unselectedWidgetColor: const Color.fromRGBO(30, 33, 63, 1),
          textTheme: getFont.getCurrentFontTheme(),
        ),
        home: const Home());
  }
}
