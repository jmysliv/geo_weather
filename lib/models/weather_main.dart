import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class WeatherMain extends Equatable {
  bool get stringify => true;

  final double temp;
  final int pressure;
  final int humidity;

  WeatherMain(
      {@required this.temp, @required this.pressure, @required this.humidity});

  WeatherMain copyWith({double temp, int pressure, int humidity}) {
    return WeatherMain(
        temp: temp ?? this.temp,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity);
  }

  @override
  List get props => [temp, pressure, humidity];

  Map<String, dynamic> toJson() {
    return {"temp": temp, "pressure": pressure, "humidity": humidity};
  }

  factory WeatherMain.fromJson(dynamic json) {
    if (json == null) return null;
    return WeatherMain(
        temp: json["temp"] as double,
        pressure: json["pressure"] as int,
        humidity: json["humidity"] as int);
  }
}
