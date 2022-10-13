import 'package:equatable/equatable.dart';


class Weather extends Equatable{
  final String main;
  final String descriptions;
  final String cityName;
  final String icon;
  final double temperature;

  const Weather({
      required this.main,
      required this.descriptions,
      required this.cityName,
      required this.icon,
      required this.temperature
      });

  @override

  List<Object?> get props =>[main,cityName,icon,temperature,descriptions] ;
}