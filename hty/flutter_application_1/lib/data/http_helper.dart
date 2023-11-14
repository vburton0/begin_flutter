import 'package:flutter_application_1/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper{
  //https://api.openweathermap.org/data/2.5/weather?q=london&appid=5147585a5d1809d21706f33de0d9e7c6
final String authority = 'api.openweathermap.org';
final String path = 'data/2.5/weather';
final String apiKey = '5147585a5d1809d21706f33de0d9e7c6';

Future<Weather> getWeather(String location) async { // Pour ne pas ralentir l'app
  Map<String, dynamic> parameters = {'q' : location, 'appId' : apiKey};
  Uri uri = Uri.https(authority, path, parameters);
  http.Response  result = await http.get(uri);
  Map<String, dynamic> data = json.decode(result.body);
  Weather weather = Weather.fromJson(data);
  return weather;
}
}