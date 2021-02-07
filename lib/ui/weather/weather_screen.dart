import 'package:flutter/material.dart';
import 'package:geo_weather/bloc/weather_bloc.dart';
import 'package:geo_weather/models/weather.dart';
import 'package:geo_weather/ui/utils/cache_image.dart';
import 'package:geo_weather/ui/utils/theme.dart';
import 'package:geo_weather/ui/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:geo_weather/ui/utils/weather_extension.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather _currentWeather;

  _labels() {
    return Column(
      children: [
        labelWithIcon(Icons.map, "City", "${_currentWeather.name}"),
        labelWithIcon(Icons.wb_sunny, "Temperature",
            _currentWeather.getTemperatureString()),
        labelWithIcon(Icons.description, "Description",
            "${_currentWeather.weather.first.main}"),
        labelWithIcon(
            Icons.compress, "Pressure", "${_currentWeather.main.pressure} hPa"),
        labelWithIcon(
            Icons.grain, "Humidity", "${_currentWeather.main.humidity}%")
      ],
    );
  }

  _weatherLoading() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(oxfordBlue),
              strokeWidth: 3.0)),
    );
  }

  _weatherFetched() {
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.center,
                    child: CustomCachedImage(
                        imageUrl:
                            "http://openweathermap.org/img/wn/${_currentWeather.weather.first.icon}@4x.png"))),
            Expanded(flex: 2, child: _labels())
          ],
        ));
  }

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
          if (_currentWeather == null) return _weatherLoading();
          return _weatherFetched();
        },
      ),
    );
  }
}
