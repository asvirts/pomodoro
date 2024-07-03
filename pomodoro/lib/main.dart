import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(30, 33, 63, 1),
        appBar: AppBar(
            title: const Text('pomodoro',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                )),
            titleTextStyle: GoogleFonts.kumbhSans(),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(30, 33, 63, 1),
            foregroundColor: Color.fromRGBO(215, 224, 255, 1)),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This is Google Fonts',
              style: GoogleFonts.kumbhSans(),
            ),
          ],
        ),
      ),
    );
  }
}
