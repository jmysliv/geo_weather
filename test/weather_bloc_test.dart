import 'package:flutter_test/flutter_test.dart';
import 'package:geo_weather/bloc/weather_bloc.dart';
import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/models/weather.dart';
import 'package:geo_weather/models/weather_details.dart';
import 'package:geo_weather/models/weather_main.dart';
import 'package:geo_weather/resources/mocks/mock_location_service.dart';
import 'package:geo_weather/resources/mocks/mock_weather_repository.dart';
import 'package:geo_weather/resources/repositories/weather_repository.dart';

void main() {
  group('Weather bloc', () {
    final WeatherRepository repository = MockWeatherRepository();
    final MockLocationService service = MockLocationService();
    final WeatherBloc bloc =
        WeatherBloc(repository: repository, locationService: service);

    test('location stream gets updated', () async {
      Location expectedLocation = Location(lat: 50.3, lon: 19.2);
      service.addLocationEvent(expectedLocation);
      var location = await bloc.locationStream.first;
      expect(location, expectedLocation);
    });

    test('weather stream gets updated', () async {
      Location location = Location(lat: 50.3, lon: 19.2);
      service.addLocationEvent(location);
      WeatherState expectedWeatherState = WeatherFetched(
          weather: Weather(
              coord: location,
              weather: [
                WeatherDetails(
                    main: "Clouds", description: "few clouds", icon: "02d")
              ],
              main: WeatherMain(temp: 280.02, pressure: 1005, humidity: 85),
              name: "Kobiór"));
      var state = await bloc.weatherStream.first;
      expect(state, expectedWeatherState);
    });
  });
}
