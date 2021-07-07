import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/settings_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/theme_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/weather_bloc.dart';
import 'package:flutter_weather_using_bloc_1/blocs/weather_bloc_observer.dart';
import 'package:flutter_weather_using_bloc_1/repositories/weather_repository.dart';
import 'package:flutter_weather_using_bloc_1/screens/weather_screen.dart';
import 'package:flutter_weather_using_bloc_1/states/theme_state.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';

void main() {
  Bloc.observer = WeatherBlocObserver();
  final WeatherRepository weatherRepository =
      WeatherRepository(httpClient: http.Client());
  //other blocs ?
  runApp(BlocProvider<ThemeBloc>(
    create: (context) => ThemeBloc(),
    child: BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: MyApp(
        weatherRepository: weatherRepository,
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  MyApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) => OverlaySupport(
        child: MaterialApp(
            title: 'Flutter Weather App with Bloc',
            home: BlocProvider(
              create: (context) =>
                  WeatherBloc(weatherRepository: weatherRepository),
              child: WeatherScreen(),
            ),
        ),
      ),
    );
  }
}
