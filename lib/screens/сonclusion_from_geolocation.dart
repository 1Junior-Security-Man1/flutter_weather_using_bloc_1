import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/settings_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/theme_bloc.dart';
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
  // Image _mapWeatherIconToIcon({WeatherIcons weatherIcons}) {
  //   Image image;
  //   switch (weatherIcons) {
  //     case WeatherIcons.clearSkyD:
  //       image = Image.asset('assets/weatherImage/01d@2x.png');
  //       break;
  //     case WeatherIcons.clearSkyN:
  //       image = Image.asset('assets/weatherImage/01n@2x.png');
  //       break;
  //     case WeatherIcons.fewCloudsD:
  //       image = Image.asset('assets/weatherImage/02d@2x.png');
  //       break;
  //     case WeatherIcons.fewCloudsN:
  //       image = Image.asset('assets/weatherImage/02n@2x.png');
  //       break;
  //     case WeatherIcons.scatteredClouds:
  //       image = Image.asset('assets/weatherImage/03d@2x.png');
  //       break;
  //     case WeatherIcons.brokenClouds:
  //       image = Image.asset('assets/weatherImage/04d@2x.png');
  //       break;
  //     case WeatherIcons.showerRain:
  //       image = Image.asset('assets/weatherImage/09d@2x.png');
  //       break;
  //     case WeatherIcons.rainD:
  //       image = Image.asset('assets/weatherImage/10d@2x.png');
  //       break;
  //     case WeatherIcons.rainN:
  //       image = Image.asset('assets/weatherImage/10n@2x.png');
  //       break;
  //     case WeatherIcons.mist:
  //       image = Image.asset('assets/weatherImage/04d@2x.png');
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
          return Column(
            children: [
              Text(
                weatherGeolocation.name,
                style: TextStyle(
                    fontSize: 43,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 35),
              //_mapWeatherIconToIcon(weatherIcons: weatherGeolocation.weatherIcon.weatherIcons),
              Row(
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
              ),
            ],
          );
        },
      ),
    );
  }
}