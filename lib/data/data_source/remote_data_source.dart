import 'package:dio/dio.dart';
import 'package:weather_app/core/error_message_model.dart';
import 'package:weather_app/core/exception.dart';

import '../model/weather_model.dart';

abstract class BaseWeatherRemoteDataSource{
Future<WeatherModel>getWeatherByCityName();
}

class WeatherRemoteDataSource extends BaseWeatherRemoteDataSource{
  @override
  Future<WeatherModel> getWeatherByCityName()async {
  final reponse =  await Dio().get('https://api.openweathermap.org/data/2.5/weather?q=Alexandria&appid=f770a1a8108a44dcc3664663c578d297');
  if(reponse.statusCode ==200){
    return WeatherModel.fromJson(reponse.data);
  }else{
    throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(reponse.data));
  }
  }
}