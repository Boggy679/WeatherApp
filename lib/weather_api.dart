import 'dart:convert';
import 'package:http/http.dart' as http;



getWeather() async {
  var response = await http.get(Uri.parse(
      "https://fcc-weather-api.glitch.me/api/current?lat=59.439518&lon=24.75708"));
  final weatherData = jsonDecode(response.body);
  final temp = weatherData ['main'] ['temp'];
  final condition = weatherData ['weather'][0]['description'];
  final city = weatherData['name'];
  return [temp, condition,city];
}




