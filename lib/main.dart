import 'package:flutter/material.dart';
import 'package:weather_app/core/service_locator.dart';
import 'package:weather_app/presentation/screens/onbaorging_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
