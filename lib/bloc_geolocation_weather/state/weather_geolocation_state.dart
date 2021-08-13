import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_using_bloc_1/models/weather.dart';

abstract class WeatherGeolocationState extends Equatable {
  const WeatherGeolocationState();
  @override
  List<Object> get props => [];
}
class WeatherStateInitial extends WeatherGeolocationState {}
class WeatherStateLoading extends WeatherGeolocationState {}
class WeatherStateSuccess extends WeatherGeolocationState {
  final Weather weather;
  const WeatherStateSuccess({@required this.weather}) : assert(weather != null);
  @override
  List<Object> get props => [weather];
}
class WeatherStateFailure extends WeatherGeolocationState {}