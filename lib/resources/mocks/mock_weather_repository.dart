import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/models/weather.dart';
import 'package:geo_weather/resources/mocks/Fixtures.dart';
import 'package:geo_weather/resources/repositories/weather_repository.dart';

class MockWeatherRepository extends WeatherRepository {
  @override
  Future<Weather> fetchWeather(Location location) {
    return Future.value(Fixtures.getWeather(location: location));
  }
}
