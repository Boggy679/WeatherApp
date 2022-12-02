import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather_api.dart';


void main() => runApp(
  MaterialApp(
    home: Weather(),

  )
);



class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _WeatherState();
  }
}

class _WeatherState extends State<Weather> {

  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  var temp = 0.0;
  var city = "";
  var condition ="";

  void updateWeatherVars() async {
    var weather = await getWeather();
    setState(()  {
      temp = weather[0];
      condition = weather[1];
      city = weather[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child:Text(
                        '${temp}°C',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,),
                      ),
                    ),
                    Center(
                      child: Text(
                          city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,),

                      ),
                    ),
                    Center(
                      child: Text(
                        condition,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,),
                        ),
                      ),
                    SizedBox(
                      height: 100, // <-- SEE HERE
                    ),
                    Center(
                      child: ElevatedButton(
                        style: style,
                        onPressed: () async {
                          updateWeatherVars();
                        },
                        child: const Text('Refresh'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
