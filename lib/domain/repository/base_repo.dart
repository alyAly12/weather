import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failures.dart';

import '../entities/weather.dart';

abstract class BaseWeatherRepo{
  Future<Either<Failure, Weather>>getWeatherByCityName();
}