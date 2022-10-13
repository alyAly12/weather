part of 'weathers_bloc.dart';

abstract class WeathersEvent extends Equatable {
  const WeathersEvent();
}
class GetWeatherEvent extends WeathersEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}