import 'package:flutter/cupertino.dart';
import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/models/weather.dart';
import 'package:geo_weather/models/weather_details.dart';
import 'package:geo_weather/models/weather_main.dart';

class Fixtures {
  static Weather getWeather({@required Location location}) {
    return Weather(
        coord: location,
        weather: [
          WeatherDetails(main: "Clouds", description: "few clouds", icon: "02d")
        ],
        main: WeatherMain(temp: 280.02, pressure: 1005, humidity: 85),
        name: "Kobiór");
  }
}
