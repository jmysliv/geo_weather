import 'package:geo_weather/models/weather.dart';

extension WeatherExtension on Weather {
  String getTemperatureString() {
    int tempInCelsius = (this.main.temp - 273.15).toInt();
    return "$tempInCelsius°C";
  }
}
