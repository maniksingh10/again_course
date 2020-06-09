import 'package:againcourse/model/weather_forecast_model.dart';

import 'package:flutter/material.dart';

import 'forecast_card.dart';

//Better way of doing business!
class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const BottomView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "7-Day Weather Forecast".toUpperCase(),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
        ),
        Container(
          height: 180,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: snapshot.data.list.length,
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: 160,
                      child: forecastCard(snapshot, index),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.blue.shade100,
                        Colors.blue.shade50
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    ),
                  )),
        )
      ],
    );
  }
}
