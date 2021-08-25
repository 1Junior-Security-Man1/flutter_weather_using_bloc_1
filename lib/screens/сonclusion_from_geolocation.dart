import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/settings_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/theme_bloc.dart';
import 'package:flutter_weather_using_bloc_1/models/weather.dart';
import 'package:flutter_weather_using_bloc_1/models/weather_geolocation.dart';
import 'package:flutter_weather_using_bloc_1/states/settings_state.dart';
import 'package:flutter_weather_using_bloc_1/states/theme_state.dart';

class ConclusionFromGeolocation extends StatelessWidget {
  final Main weatherGeolocation;
  //constructor
  ConclusionFromGeolocation({Key key, @required this.weatherGeolocation})
      : assert(weatherGeolocation != null),
        super(key: key);
  // //Convert celcius to fahrenheit
  // int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();
  //
  // String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
  //     temperatureUnit == TemperatureUnit.fahrenheit
  //         ? '${_toFahrenheit(temp)}°F'
  //         : '${temp.round()}°C';

  // Image _mapWeatherConditionToIcon({WeatherCondition weatherCondition}) {
  //   Image image;
  //   String str;
  //   switch (weatherCondition) {
  //     case WeatherCondition.clear:
  //       image = Image.asset('assets/image/summer.png');
  //       str = 'Clear';
  //       break;
  //     case WeatherCondition.lightCloud:
  //       image = Image.asset('assets/image/partly-cloudy-day.png');
  //       str = 'Light Cloud';
  //       break;
  //     case WeatherCondition.hail:
  //       image = Image.asset('assets/image/hail.png');
  //       str = 'Hail';
  //       break;
  //     case WeatherCondition.snow:
  //       image = Image.asset('assets/image/snow.png');
  //       str = 'Snow';
  //       break;
  //     case WeatherCondition.sleet:
  //       image = Image.asset('assets/image/sleet.png');
  //       str = 'Sleet';
  //       break;
  //     case WeatherCondition.heavyCloud:
  //       image = Image.asset('assets/image/rain-cloud.png');
  //       str = 'Heavy Cloud';
  //       break;
  //     case WeatherCondition.heavyRain:
  //       image = Image.asset('assets/image/moderate-rain.png');
  //       str = 'Heavy Rain';
  //       break;
  //     case WeatherCondition.lightRain:
  //       image = Image.asset('assets/image/rain-cloud.png');
  //       str = 'Light Rain';
  //       break;
  //     case WeatherCondition.showers:
  //       image = Image.asset('assets/image/heavy-rain.png');
  //       str = 'Showers';
  //       break;
  //     case WeatherCondition.thunderstorm:
  //       image = Image.asset('assets/image/lightning.png');
  //       str = 'Thunderstorm';
  //       break;
  //     case WeatherCondition.unknown:
  //       image = Image.asset('assets/image/sunset.png');
  //       str = 'Unknown';
  //       break;
  //   }
  //   return image;
  // }

  @override
  Widget build(BuildContext context) {
    ThemeState _themeState = BlocProvider.of<ThemeBloc>(context).state;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 45),
              //Add an icon here
              //_mapWeatherConditionToIcon(weatherCondition: weather.weatherCondition),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 15),
                child: Text(
                  '${weatherGeolocation.main.temp.toInt()}',
                  style: TextStyle(
                    fontSize: 40,
                    color: _themeState.textColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 3),
                    child: Text(
                      'Min: ${weatherGeolocation.main.tempMin.toInt()}',
                      style: TextStyle(
                        fontSize: 12,
                        color: _themeState.textColor,
                      ),
                    ),
                  ),
                  Text(
                    'Max: ${weatherGeolocation.main.tempMax.toInt()}',
                    style: TextStyle(
                      fontSize: 12,
                      color: _themeState.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              //TODO
              Text('',
                style: TextStyle(
                  fontSize: 13,
                  color: _themeState.textColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}