import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/models/weather.dart';
import 'package:geo_weather/resources/repositories/weather_repository.dart';
import 'package:geo_weather/resources/services/location_service.dart';
import 'package:rxdart/rxdart.dart';

part 'weather_state.dart';

class WeatherBloc {
  final WeatherRepository repository;
  BehaviorSubject<WeatherState> _weatherStream;
  Stream<Location> _locationStream;

  WeatherBloc(
      {@required this.repository, @required LocationService locationService}) {
    _weatherStream = BehaviorSubject<WeatherState>();
    _locationStream = locationService.getLocationStream();
    _locationStream.listen((event) => onLocationChanged(event));
  }

  Stream<Location> get locationStream => _locationStream;
  Stream<WeatherState> get weatherStream => _weatherStream.stream;

  void onLocationChanged(Location newLocation) async {
    WeatherState newState;
    try {
      Weather weather = await repository.fetchWeather(newLocation);
      newState = WeatherFetched(weather: weather);
    } catch (e) {
      newState = WeatherFetchingError(message: e.toString());
    } finally {
      _weatherStream.sink.add(newState);
    }
  }
}
