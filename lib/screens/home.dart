import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/providers/settings_provider.dart';
import 'package:pomodoro/widgets/progress_indicator.dart';
import 'package:pomodoro/widgets/segmented_button.dart';
import 'package:pomodoro/widgets/settings.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle textStyle =
        ref.watch(fontNotifierProvider.notifier).getCurrentFont();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 63, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, top: 32, right: 8, bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('pomodoro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontStyle: textStyle.fontStyle,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SegmentedButtonWidget(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressIndicatorWidget(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SettingsDialog(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
