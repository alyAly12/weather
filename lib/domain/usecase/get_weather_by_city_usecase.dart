import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failures.dart';
import 'package:weather_app/domain/repository/base_repo.dart';

import '../entities/weather.dart';

class GetWeatherByCityNameUseCase
{
 final BaseWeatherRepo baseWeatherRepo;

  GetWeatherByCityNameUseCase(this.baseWeatherRepo);
  Future<Either<Failure,Weather>>excute()async{
    return await baseWeatherRepo.getWeatherByCityName( );
  }
}