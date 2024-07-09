import 'package:golden_toolkit/golden_toolkit.dart';

testGoldens('Weather types should look correct', (tester) async {
  final builder = GoldenBuilder.grid(columns:2, widthToHeightRatio: 1)
          ..addScenario('Sunny', WeatherCard(Weather.sunny))
          ..addScenario('Cloudy', WeatherCard(Weather.cloudy))
          ..addScenario('Raining', WeatherCard(Weather.rain))
          ..addScenario('Cold', WeatherCard(Weather.cold));
  await tester.pumpWidgetBuilder(builder.build());
  await screenMatchesGolden(tester, 'weather_types_grid');
});