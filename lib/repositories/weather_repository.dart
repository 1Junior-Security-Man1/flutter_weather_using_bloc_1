//https://www.metaweather.com//api/location/search/?query=chicago
//by location id:
//https://www.metaweather.com//api/location/2379574
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_using_bloc_1/models/weather.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://www.metaweather.com';
final locationUrl = (city) => '${baseUrl}/api/location/search/?query=${city}';
final weatherUrl = (locationId) => '${baseUrl}/api/location/${locationId}';
class WeatherRepository {
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
  //LocationId => Weather
  Future<Weather> fetchWeather(int locationId) async {
    final response = await this.httpClient.get(Uri.parse(weatherUrl(locationId)));
    if(response.statusCode != 200) {
      print(response.body + 'api');
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