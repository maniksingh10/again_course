import 'dart:convert';

import 'package:againcourse/model/weather_forecast_model.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=" +
        cityName +
        "&cnt=14&appid=" +
        "" +
        "&units=metric"; //change to metric or imperial

    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      // we get the actual mapped model ( dart object )
      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
