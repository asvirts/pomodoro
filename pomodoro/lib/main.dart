import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/segmented_button.dart';
import '../widgets/progress_indicator.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(),
        scaffoldBackgroundColor: Color.fromRGBO(30, 33, 63, 1),
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(30, 33, 63, 1),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('pomodoro',
                  style: GoogleFonts.kumbhSans(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  )),
              SegmentedButtonWidget(),
              ProgressIndicatorWidget(),
              const Icon(
                Icons.settings,
                color: Color.fromRGBO(215, 224, 255, 1),
                size: 28.0,
                semanticLabel: 'App settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
