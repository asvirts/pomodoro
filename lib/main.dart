import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 63, 1),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 8, top: 32, right: 8, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('pomodoro',
                      style: GoogleFonts.kumbhSans(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SegmentedButtonWidget(),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProgressIndicatorWidget(),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SettingsDialog(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
