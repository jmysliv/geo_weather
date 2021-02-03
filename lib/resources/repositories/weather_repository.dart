import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(Location location);
}
