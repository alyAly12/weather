part of 'weathers_bloc.dart';

 class WeathersState extends Equatable {
  final Weather? getWeatherByCity;
  final RequestState weatherState;
  final String message;

  const WeathersState(
      {
         this.getWeatherByCity  ,
        this.weatherState = RequestState.loading,
        this.message = ''});

  @override
  List<Object> get props => [ weatherState, message];
}




