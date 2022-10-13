import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/utils/request_state.dart';
import 'package:weather_app/domain/entities/weather.dart';
import '../../domain/usecase/get_weather_by_city_usecase.dart';
part 'weathers_event.dart';
part 'weathers_state.dart';

class WeathersBloc extends Bloc<WeathersEvent, WeathersState> {
final GetWeatherByCityNameUseCase getWeatherByCityNameUseCase;
  WeathersBloc(this.getWeatherByCityNameUseCase) : super(  const WeathersState()) {
    on<WeathersEvent>(_getWeatherByCity);
  }


  FutureOr<void> _getWeatherByCity(WeathersEvent event, Emitter<WeathersState> emit) async{
   final result= await getWeatherByCityNameUseCase.excute();
   result.fold((l) => emit(
     WeathersState(
       message: l.message,
       weatherState: RequestState.error,

     )
   ) ,
           (r) => emit(
             WeathersState(
              getWeatherByCity: r,
               weatherState: RequestState.loaded
             )
           ));
  }
}
