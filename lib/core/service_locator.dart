import 'package:get_it/get_it.dart';
import 'package:weather_app/data/data_source/remote_data_source.dart';
import 'package:weather_app/data/repository/weather_repo.dart';
import 'package:weather_app/domain/repository/base_repo.dart';
import 'package:weather_app/domain/usecase/get_weather_by_city_usecase.dart';

final sl= GetIt.instance;

class ServiceLocator{
  void init(){
    sl.registerLazySingleton<BaseWeatherRemoteDataSource>(() =>WeatherRemoteDataSource());
    sl.registerLazySingleton<BaseWeatherRepo>(() => WeatherRepo(sl()));
    sl.registerLazySingleton(() => GetWeatherByCityNameUseCase(sl()));
  }
}