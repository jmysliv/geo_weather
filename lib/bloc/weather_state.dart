part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class WeatherFetched extends WeatherState {
  final Weather weather;

  WeatherFetched({@required this.weather});

  @override
  List<Object> get props => [this.weather];
}

class WeatherFetchingError extends WeatherState {
  final String message;

  WeatherFetchingError({@required this.message});

  @override
  List<Object> get props => [this.message];
}
