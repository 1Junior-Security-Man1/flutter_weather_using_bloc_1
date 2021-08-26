import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_using_bloc_1/bloc_geolocation_weather/event/weather_geolocation_event.dart';
import 'package:flutter_weather_using_bloc_1/bloc_geolocation_weather/state/weather_geolocation_state.dart';
import 'package:flutter_weather_using_bloc_1/bloc_geolocation_weather/weather_bloc_geolocation.dart';
import 'package:flutter_weather_using_bloc_1/blocs/theme_bloc.dart';
import 'package:flutter_weather_using_bloc_1/events/theme_event.dart';
import 'package:flutter_weather_using_bloc_1/models/weather_geolocation.dart';
import 'package:flutter_weather_using_bloc_1/screens/city_search_screen.dart';
import 'package:flutter_weather_using_bloc_1/screens/settings_screen.dart';
import 'package:flutter_weather_using_bloc_1/screens/temperature_widget.dart';
import 'package:flutter_weather_using_bloc_1/states/theme_state.dart';

// import 'package:flutter_weather_using_bloc_1/states/weather_state.dart';
// import 'package:flutter_weather_using_bloc_1/events/weather_evant.dart';
// import 'package:flutter_weather_using_bloc_1/blocs/weather_bloc.dart';

import '../utils.dart';
import 'сonclusion_from_geolocation.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Completer<void> _completer;
  //CityName cityName = CityName();

  @override
  void initState() {
    super.initState();
    _completer = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App using Flutter Bloc'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //Navigate to SettingsScreen
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(),
              ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              //Navigate to CitySearchScreen
              final typedCity = await Navigator.push(context, MaterialPageRoute(builder: (context) => CitySearchScreen(),
                ),
              );
              // if (typedCity != null) {
              //  BlocProvider.of<WeatherBloc>(context).add(WeatherEventRequested(city: typedCity));
              // }
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherGeolocationBloc, WeatherGeolocationState>(
            listener: (context, weatherGeolocationState) {
              // if (weatherGeolocationState is WeatherStateSuccess) {
              //   BlocProvider.of<ThemeBloc>(context).add(ThemeEventWeatherChanged(weatherCondition: weatherGeolocationState.weather.weatherCondition));
              //   _completer?.complete();
              //   _completer = Completer();
              // }
            }, builder: (context, weatherGeolocationState) {
          if (weatherGeolocationState is WeatherStateLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (weatherGeolocationState is WeatherStateSuccess) {
            final weatherGeolocation = weatherGeolocationState.weatherGeolocation;
            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    final result = await Connectivity().checkConnectivity();
                    showConnectivitySnackBar(result);
                    BlocProvider.of<WeatherGeolocationBloc>(context).add(WeatherEventRefresh());
                    //return a "Completer object"
                    ///
                    return _completer.future;
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 160),
                    color: themeState.backgroundColor,
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            // Text(
                            //   ///
                            //   cityName.name,
                            //   style: TextStyle(
                            //       fontSize: 43,
                            //       fontWeight: FontWeight.bold,
                            //       color: themeState.textColor),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1),
                            ),
                            // Center(
                            //   child: Text(
                            //     'Updated: ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}',
                            //     style: TextStyle(
                            //         fontSize: 12, color: themeState.textColor),
                            //   ),
                            // ),
                            //show more here, put together inside a Widget
                            //ConclusionFromGeolocation(),
                            ConclusionFromGeolocation(weatherGeolocation: weatherGeolocation),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (weatherGeolocationState is WeatherStateFailure) {
            return Text(
              'Something went wrong',
              style: TextStyle(color: Colors.redAccent, fontSize: 16),
            );
          }
          return Center(
            child: Text(
              'select a location first !',
              style: TextStyle(fontSize: 30),
            ),
          );
        }),
      ),
    );
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? 'You have again ${result.toString()}'
        : 'You have not internet';
    final color = hasInternet ? Colors.green : Colors.red;
    Utils.showTopSnackBar(context, message, color);
  }
}