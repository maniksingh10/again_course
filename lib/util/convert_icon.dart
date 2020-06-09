import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weatherDescription, Color color, double size}) {
  switch (weatherDescription) {
    case "Clear":
      {
        return Icon(
          Icons.wb_sunny,
          color: Colors.yellow.shade600,
          size: size,
        );
      }
      break;
    case "Clouds":
      {
        return Icon(Icons.cloud, color: Colors.blueAccent, size: size);
      }
      break;
    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: Colors.blueGrey,
          size: size,
        );
      }
      break;
    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: color,
          size: size,
        );
      }
      break;
    default:
      {
        return Icon(
          Icons.wb_sunny,
          color: Colors.yellow,
          size: size,
        );
      }
      break;
  }
}
