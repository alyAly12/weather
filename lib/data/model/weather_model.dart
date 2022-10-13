import 'package:weather_app/domain/entities/weather.dart';

class WeatherModel extends Weather{
  const WeatherModel({
    required super.main,
    required super.descriptions,
    required super.cityName,
    required super.icon,
    required super.temperature
  });
  factory WeatherModel.fromJson(Map<String ,dynamic>json)=>
      WeatherModel(
          main:json['weather'][0]['main'],
          descriptions: json['weather'][0]['description'],
          cityName: json['name'],
          icon: json['weather'][0]['icon'],
          temperature: json['main']['temp']
      );
}