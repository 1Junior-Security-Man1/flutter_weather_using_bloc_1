import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherGeolocationEvent extends Equatable {
  const WeatherGeolocationEvent();
}
class WeatherEventRequested extends WeatherGeolocationEvent {
  final double longitude;
  final double latitude;
  const WeatherEventRequested({@required this.longitude, @required this.latitude}) : assert(longitude != null, latitude != null);
  @override
  List<Object> get props => [longitude, latitude];
}
class WeatherEventRefresh extends WeatherGeolocationEvent {
  final double longitude;
  final double latitude;
  const WeatherEventRefresh({@required this.longitude, @required this.latitude}) : assert(longitude != null, latitude != null);
  @override
  List<Object> get props => [longitude, latitude];
}