//https://www.metaweather.com//api/location/search/?query=chicago
//by location id:
//https://www.metaweather.com//api/location/2379574
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_using_bloc_1/geolocator/geolocator.dart';
import 'package:flutter_weather_using_bloc_1/models/weather.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://www.metaweather.com';
final locationUrl = (city) => '${baseUrl}/api/location/search/?query=${city}';
final weatherUrl = (locationId) => '${baseUrl}/api/location/${locationId}';
class WeatherRepository {
  static String _apiKey = "f92b5779c828433706f748a890681ef8";
  final http.Client httpClient;
  //constructor
  WeatherRepository({@required this.httpClient}): assert(httpClient != null);

  Future<int> getLocationIdFromCity(String city) async {
    final response = await this.httpClient.get(Uri.parse(locationUrl(city)));
    if(response.statusCode == 200) {
      final cities = jsonDecode(response.body) as List;
      return (cities.first)['woeid'] ?? Map();
    } else {
      throw Exception('Error getting location id of : ${city}');
    }
  }

  //TODO Update
  Future<dynamic> getResponseData(double latitude, double longitude) async {
    // LocationInfo position = LocationInfo();
    // await position.getUserLocationData();
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=$_apiKey&units=metric';
    http.Response response = await http.post(Uri.parse(url));
    // print('Api ${position.latitude}');
    // print('Api ${position.longitude}');
    print('Api ${latitude}');
    print('Api ${longitude}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  //LocationId => Weather
  Future<Weather> fetchWeather(int locationId) async {
    final response = await this.httpClient.get(Uri.parse(weatherUrl(locationId)));
    if(response.statusCode != 200) {
      //print(response.body + 'api');
      throw Exception('Error getting weather from locationId: ${locationId}');
    }
    final weatherJson = jsonDecode(response.body);
    return Weather.fromJson(weatherJson);
  }
  Future<Weather> getWeatherFromCity(String city) async {
    final int locationId = await getLocationIdFromCity(city);
    return fetchWeather(locationId);
  }
}