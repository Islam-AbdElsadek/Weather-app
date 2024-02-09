import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

//http://api.weatherapi.com/v1/forecast.json?key=f8e6683c055044018d6151128222912&q=London&days=4
class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '83b179b999de4355a4b135341230807';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
