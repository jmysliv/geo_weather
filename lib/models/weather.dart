import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import "package:geo_weather/models/weather_details.dart";
import "package:geo_weather/models/weather_main.dart";
import "package:geo_weather/models/location.dart";

class Weather extends Equatable {
  bool get stringify => true;

  final Location coord;
  final WeatherDetails weather;
  final WeatherMain main;
  final String name;

  Weather(
      {@required this.coord,
      @required this.weather,
      @required this.main,
      @required this.name});

  Weather copyWith(
      {Location coord, WeatherDetails weather, WeatherMain main, String name}) {
    return Weather(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        main: main ?? this.main,
        name: name ?? this.name);
  }

  @override
  List get props => [coord, weather, main, name];

  Map<String, dynamic> toJson() {
    return {
      "coord": coord?.toJson(),
      "weather": weather?.toJson(),
      "main": main?.toJson(),
      "name": name
    };
  }

  factory Weather.fromJson(dynamic json) {
    if (json == null) return null;
    return Weather(
        coord: Location.fromJson(json["coord"]),
        weather: WeatherDetails.fromJson(json["weather"]),
        main: WeatherMain.fromJson(json["main"]),
        name: json["name"]);
  }
}
