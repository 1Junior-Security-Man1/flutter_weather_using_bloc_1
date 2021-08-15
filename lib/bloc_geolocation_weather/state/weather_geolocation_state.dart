import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_using_bloc_1/models/weather_geolocation.dart';

abstract class WeatherGeolocationState extends Equatable {
  const WeatherGeolocationState();
  @override
  List<Object> get props => [];
}
class WeatherStateInitial extends WeatherGeolocationState {}
class WeatherStateLoading extends WeatherGeolocationState {}
class WeatherStateSuccess extends WeatherGeolocationState {
  final WeatherGeolocation weatherGeolocation;
  const WeatherStateSuccess({@required this.weatherGeolocation}) : assert(weatherGeolocation != null);
  @override
  List<Object> get props => [weatherGeolocation];
}
class WeatherStateFailure extends WeatherGeolocationState {}