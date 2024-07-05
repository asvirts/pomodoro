import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/screens/home.dart';
import '../widgets/segmented_button.dart';
import '../widgets/progress_indicator.dart';
import 'package:pomodoro/widgets/settings.dart';

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
    return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(248, 112, 112, 1),
          canvasColor: const Color.fromRGBO(215, 224, 255, 1),
          textTheme: GoogleFonts.kumbhSansTextTheme(),
        ),
        home: const Home());
  }
}
