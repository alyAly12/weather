import 'package:dartz/dartz.dart';
import 'package:weather_app/core/exception.dart';
import 'package:weather_app/core/failures.dart';
import 'package:weather_app/data/data_source/remote_data_source.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repository/base_repo.dart';

class WeatherRepo extends BaseWeatherRepo{
  final BaseWeatherRemoteDataSource baseWeatherRemoteDataSource;

  WeatherRepo(this.baseWeatherRemoteDataSource);

  @override
  Future<Either<Failure ,Weather>> getWeatherByCityName()async {
  final result =  await baseWeatherRemoteDataSource.getWeatherByCityName();
  try{
    return right(result);
  }on ServerExceptions catch(failure){
    return left(
      ServerFailure(message: failure.errorMessageModel.message)
    );
  }
  }
}