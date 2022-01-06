import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// coord : {"lon":-122.084,"lat":37.422}
/// weather : [{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}]
/// base : "stations"
/// main : {"temp":14.36,"feels_like":14.1,"temp_min":12.2,"temp_max":15.62,"pressure":1014,"humidity":86}
/// visibility : 10000
/// wind : {"speed":0.45,"deg":117,"gust":1.79}
/// clouds : {"all":90}
/// dt : 1629896360
/// sys : {"type":2,"id":2010364,"country":"US","sunrise":1629898403,"sunset":1629946060}
/// timezone : -25200
/// id : 5375480
/// name : "Mountain View"
/// cod : 200

class Main {
  Coord _coord;
  MainObject _main;
  String _name;
  WeatherIcon _weatherIcon;

  Coord get coord => _coord;

  WeatherIcon get weatherIcon => _weatherIcon;

  MainObject get main => _main;

  String get name => _name;

  Main({
    Coord coord,
    MainObject main,
    String name,
    WeatherIcon weatherIcon,
  }) {
    _coord = coord;
    _main = main;
    _name = name;
    _weatherIcon = weatherIcon;
  }

  ///Работает!
  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      main: json['main'] != null ? MainObject.fromJson(json['main']) : null,
      name: json['name'],
      weatherIcon: WeatherIcon.fromJson(json['weather'][0]),
    );
  }
}

class MainObject {
  double _temp;
  double _tempMin;
  double _tempMax;

  double get temp => _temp;

  double get tempMin => _tempMin;

  double get tempMax => _tempMax;

  MainObject({
    double temp,
    double tempMin,
    double tempMax,
  }) {
    _temp = temp;
    _tempMin = tempMin;
    _tempMax = tempMax;
  }

  MainObject.fromJson(dynamic json) {
    _temp = json['temp'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
  }
}

/// icon : "04n"

enum WeatherIcons {
  clearSkyD,
  clearSkyN,
  fewCloudsD,
  fewCloudsN,
  scatteredClouds,
  brokenClouds,
  showerRain,
  rainD,
  rainN,
  thunderstorm,
  snow,
  mist,
}

class WeatherIcon {
  WeatherIcons _weatherIcons;

  WeatherIcons get weatherIcons => _weatherIcons;

  WeatherIcon({
    WeatherIcons weatherIcons,
  }) {
    _weatherIcons = weatherIcons;
  }

  factory WeatherIcon.fromJson(Map<String, dynamic> json) {
    return WeatherIcon(
      weatherIcons: _mapStringToWeatherCondition(json['icon']) ?? '',
    );
  }

  static WeatherIcons _mapStringToWeatherCondition(String inputString) {
    Map<String, WeatherIcons> map = {
      '01d': WeatherIcons.clearSkyD,
      '01n': WeatherIcons.clearSkyN,
      '02d': WeatherIcons.fewCloudsD,
      '02n': WeatherIcons.fewCloudsN,
      '03d': WeatherIcons.scatteredClouds,
      '03n': WeatherIcons.scatteredClouds,
      '04d': WeatherIcons.brokenClouds,
      '04n': WeatherIcons.brokenClouds,
      '09d': WeatherIcons.showerRain,
      '09n': WeatherIcons.showerRain,
      '10d': WeatherIcons.rainD,
      '10n': WeatherIcons.rainN,
      '11d': WeatherIcons.thunderstorm,
      '11n': WeatherIcons.thunderstorm,
      '13d': WeatherIcons.snow,
      '13n': WeatherIcons.snow,
      '50d': WeatherIcons.mist,
      '50n': WeatherIcons.thunderstorm,
    };
    return map[inputString] ?? 'Dont know';
  }
}

class Coord {
  double _lon;
  double _lat;

  double get lon => _lon;

  double get lat => _lat;

  Coord({double lon, double lat}) {
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }
}
