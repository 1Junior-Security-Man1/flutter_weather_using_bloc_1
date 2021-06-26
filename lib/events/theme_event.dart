import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_using_bloc_1/models/weather.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}
class ThemeEventWeatherChanged extends ThemeEvent {
  final WeatherCondition weatherCondition;
  const ThemeEventWeatherChanged({@required this.weatherCondition}): assert(weatherCondition != null);
  @override
  List<Object> get props => [weatherCondition];
}