import 'dart:convert';

import 'package:flutter_weather_app/constants.dart';
import 'package:flutter_weather_app/weathermodel.dart';
import 'package:http/http.dart' as http;
class WeatherApi{
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";

  Future<ApiResponse> getCurrentWeather(String location) async {
    String apiUrl = "$baseUrl?key=$apiKey&q=$location";
    try {
     final res = await http.get(Uri.parse(apiUrl));
     if (res.statusCode==200) {
        return ApiResponse.fromJson(jsonDecode(res.body));
     }
     else{
      throw Exception("Failed to load weather");
     }
    } catch (e) {
      throw Exception("Failed to load weather");
    }
  }
}