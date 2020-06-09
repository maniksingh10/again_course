import 'package:againcourse/model/weather_forecast_model.dart';
import 'package:againcourse/util/convert_icon.dart';
import 'package:againcourse/util/forecast_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;

  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDayDate(date);
  //[Saturday,Dec 14,2019]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          fullDate,
          style: TextStyle(fontWeight: FontWeight.w800),
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Colors.white,
              child: getWeatherIcon(
                  weatherDescription: forecastList[index].weather[0].main,
                  color: Colors.yellow,
                  size: 50),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].main.tempMax.toStringAsFixed(0)}°C "),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.red,
                      size: 17,
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                        "${forecastList[index].main.tempMin.toStringAsFixed(0)}°C "),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.green,
                    size: 17,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].main.humidity.toStringAsFixed(0)}% "),
                    Icon(
                      FontAwesomeIcons.solidGrinBeamSweat,
                      color: Colors.yellow.shade700,
                      size: 17,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].wind.speed.toStringAsFixed(1)}km/h "),
                    Icon(
                      FontAwesomeIcons.wind,
                      color: Colors.blueGrey,
                      size: 17,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          "${forecastList[index].weather[0].description.toUpperCase()}",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        )),
      ),
    ],
  );
}
