import 'package:dio/dio.dart';
import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/models/weather.dart';
import 'package:geo_weather/resources/repositories/weather_repository.dart';

class OwmWeatherRepository extends WeatherRepository{
  static const String URL = "https://api.openweathermap.org/data/2.5/weather?appid=cb8bdb9e8dea5b5d6fc7ffdefde7a5a3";
  @override
  Future<Weather> fetchWeather(Location location) async {
    String params = "&lat=${location.lat}&lon=${location.lon}";
    Dio dio = Dio();
    Response response = await dio.get(URL + params);
    if(response.statusCode != 200){
      throw Exception("Weather fetching failed. Try again later.");
    }

    return Weather.fromJson(response.data);
  }
  
}