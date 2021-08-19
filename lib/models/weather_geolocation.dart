import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Main extends Equatable{

  double temp;
  double tempMin;
  double tempMax;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"] as double,
    tempMin: json["temp_min"] as double,
    tempMax: json["temp_max"] as double,
  );

  @override
  List<Object> get props => [temp, tempMin, tempMax];

  // Map<String, dynamic> toJson() => {
  //   "temp": temp,
  //   "temp_min": tempMin,
  //   "temp_max": tempMax,
  // };
}

// class Weather {
//   Weather({
//     this.icon,
//   });
//
//   String icon;
//
//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//     icon: json["icon"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "icon": icon,
//   };
// }

// class CityName {
//   CityName({
//     this.name,
//   });
//
//   String name;
//
//   factory CityName.fromJson(Map<String, dynamic> json) => CityName(
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//   };
// }