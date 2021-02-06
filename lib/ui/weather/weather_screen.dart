import 'package:flutter/material.dart';
import 'package:geo_weather/bloc/weather_bloc.dart';
import 'package:geo_weather/models/weather.dart';
import 'package:geo_weather/ui/utils/theme.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather _currentWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather",
          style: TextStyle(color: bittersweet),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: context.read<WeatherBloc>().weatherStream,
        builder: (context, AsyncSnapshot<WeatherState> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data is WeatherFetched)
              _currentWeather = (snapshot.data as WeatherFetched).weather;
            else {
              return Center(
                child: Text((snapshot.data as WeatherFetchingError).message),
              );
            }
          }
          return Center(
              child: Text(_currentWeather != null
                  ? _currentWeather.toString()
                  : "loading..."));
        },
      ),
    );
  }
}
