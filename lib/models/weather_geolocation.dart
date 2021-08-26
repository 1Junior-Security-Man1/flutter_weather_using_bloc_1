import 'package:equatable/equatable.dart';

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
  MainObject _main;
  String _name;
  //WeatherIcon _weatherIcon;

  //List<WeatherIcon> _weather;

  MainObject get main => _main;
  String get name => _name;
  //WeatherIcon get weatherIcon => _weatherIcon;

  Main({
    MainObject main,
    String name,
    //WeatherIcon weatherIcon,
  }){
    _main = main;
    _name = name;
    //_weatherIcon = weatherIcon;
  }

  Main.fromJson(dynamic json) {
    _main = json['main'] != null ? MainObject.fromJson(json['main']) : null;
    _name = json['name'];
    // if (json['weather'] != null) {
    //   _weatherIcon = [] as WeatherIcon;
    //   // json['weather'].forEach((v) {
    //   //   _weatherIcon.add(WeatherIcon.fromJson(v));
    //   // });
    // }
  }
}

/// temp : 14.36
/// feels_like : 14.1
/// temp_min : 12.2
/// temp_max : 15.62
/// pressure : 1014
/// humidity : 86

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
  }){
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

// enum WeatherIcons {
//   clearSkyD,
//   clearSkyN,
//   fewCloudsD,
//   fewCloudsN,
//   scatteredClouds,
//   brokenClouds,
//   showerRain,
//   rainD,
//   rainN,
//   thunderstorm,
//   snow,
//   mist,
// }
//
// class WeatherIcon extends Equatable {
//   WeatherIcons weatherIcons;
//   //String _icon;
//
//   //String get icon => _icon;
//   //String get weatherIcons;
//
//   WeatherIcon({
//     String weatherIcons,
//     //String icon
//   }){
//     weatherIcons = weatherIcons;
//     //_icon = icon;
//   }
//
//   @override
//   List<Object> get props => [weatherIcons];
//
//   WeatherIcon.fromJson(dynamic json) {
//     weatherIcons: _mapStringToWeatherCondition(json['icon']) ?? '';
//     //_icon = json['icon'];
//   }
//
//   static WeatherIcons _mapStringToWeatherCondition(String inputString) {
//     Map<String, WeatherIcons> map = {
//       '01d': WeatherIcons.clearSkyD,
//       '01n': WeatherIcons.clearSkyN,
//       '02d': WeatherIcons.fewCloudsD,
//       '02n': WeatherIcons.fewCloudsN,
//       '03d': WeatherIcons.scatteredClouds,
//       '03n': WeatherIcons.scatteredClouds,
//       '04d': WeatherIcons.brokenClouds,
//       '04n': WeatherIcons.brokenClouds,
//       '09d': WeatherIcons.showerRain,
//       '09n': WeatherIcons.showerRain,
//       '10d': WeatherIcons.rainD,
//       '10n': WeatherIcons.rainN,
//       '11d': WeatherIcons.thunderstorm,
//       '11n': WeatherIcons.thunderstorm,
//       '13d': WeatherIcons.snow,
//       '13n': WeatherIcons.snow,
//       '50d': WeatherIcons.mist,
//       '50n': WeatherIcons.thunderstorm,
//     };
//     return map[inputString] ?? 'Dont know';
//   }
//}