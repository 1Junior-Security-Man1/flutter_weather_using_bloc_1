import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/settings_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/theme_bloc.dart';
import 'package:flutter_weather_using_bloc_1/models/weather.dart';
import 'package:flutter_weather_using_bloc_1/states/settings_state.dart';
import 'package:flutter_weather_using_bloc_1/states/theme_state.dart';
import 'package:weather_icons/weather_icons.dart';

class TemperatureWidget extends StatelessWidget {
  final Weather weather;

  //constructor
  TemperatureWidget({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  //Convert celcius to fahrenheit
  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit
          ? '${_toFahrenheit(temp)}°F'
          : '${temp.round()}°C';

  Image _mapWeatherConditionToIcon({WeatherCondition weatherCondition}) {
    Image image;
    Text text;
    switch (weatherCondition) {
      case WeatherCondition.clear:
        image = Image.asset('assets/image/summer.png');
        text = Text('Clear');
        break;
      case WeatherCondition.lightCloud:
        image = Image.asset('assets/image/partly-cloudy-day.png');
        text = Text('Light Cloud');
        break;
      case WeatherCondition.hail:
        image = Image.asset('assets/image/hail.png');
        text = Text('Hail');
        break;
      case WeatherCondition.snow:
      image = Image.asset('assets/image/snow.png');
      text = Text('Snow');
      break;
      case WeatherCondition.sleet:
        image = Image.asset('assets/image/sleet.png');
        text = Text('Sleet');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/image/rain-cloud.png');
        text = Text('Heavy Cloud');
        break;
      case WeatherCondition.heavyRain:
        image = Image.asset('assets/image/moderate-rain.png');
        text = Text('Heavy Rain');
        break;
      case WeatherCondition.lightRain:
        image = Image.asset('assets/image/rain-cloud.png');
        text = Text('Light Rain');
        break;
      case WeatherCondition.showers:
        image = Image.asset('assets/image/heavy-rain.png');
        text = Text('Showers');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/image/lightning.png');
        text = Text('Thunderstorm');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('assets/image/sunset.png');
        text = Text('Unknown');
        break;
    }
    return image;
  }

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
              _mapWeatherConditionToIcon(weatherCondition: weather.weatherCondition),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 15),
                child: Text(
                  '${_formattedTemperature(weather.temp, settingsState.temperatureUnit)}',
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
                      'Min: ${_formattedTemperature(weather.minTemp, settingsState.temperatureUnit)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: _themeState.textColor,
                      ),
                    ),
                  ),
                  Text(
                    'Max: ${_formattedTemperature(weather.maxTemp, settingsState.temperatureUnit)}',
                    style: TextStyle(
                      fontSize: 13,
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