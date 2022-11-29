import 'package:flutter/material.dart';

void main() {
  runApp(const Weather());
}


class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int temp = 0;
  String location = 'Tallinn';
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
                        '${temp}C',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,),
                      ),
                    ),
                    Center(
                      child: Text(
                          location,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,)
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
