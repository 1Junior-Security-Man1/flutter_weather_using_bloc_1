import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_using_bloc_1/bloc_geolocation_weather/event/weather_geolocation_event.dart';
import 'package:flutter_weather_using_bloc_1/bloc_geolocation_weather/weather_bloc_geolocation.dart';
import 'package:flutter_weather_using_bloc_1/geolocator/geolocator.dart';
import 'package:flutter_weather_using_bloc_1/repositories/weather_repository.dart';
import 'package:flutter_weather_using_bloc_1/screens/weather_screen.dart';
import 'package:http/http.dart' as http;

class CitySearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final WeatherRepository weatherRepository = WeatherRepository(httpClient: http.Client());
  final TextEditingController _cityTextController = TextEditingController();
  LocationInfo position = LocationInfo();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter a city'),
      ),
      body: Column(
        children: [
          Form(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                        controller: _cityTextController,
                        decoration: InputDecoration(
                            labelText: 'Enter a city',
                            hintText: 'Example: Chicago'),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.pop(context, _cityTextController.text);
                  },
                ),
              ],
            ),
          ),
              Container(
                height: 55,
                width: 185,
                margin: const EdgeInsets.only(top: 500),
                child: ElevatedButton(
                  onPressed: () async {
                    //Navigate to CitySearchScreen
                    await position.getUserLocationData();
                    if (position != null) {
                      BlocProvider.of<WeatherGeolocationBloc>(context).add(WeatherEventRequested(latitude: position.latitude, longitude: position.longitude));
                    print(position.longitude);
                    print(position.latitude);
                    }
                   Navigator.pop(context);
                  },
                  child: const Text('Weather at my location'),
                ),
              ),
        ],
      ),
    );
  }
}