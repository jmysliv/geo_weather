import 'package:geo_weather/models/location.dart';

abstract class LocationService {
  Stream<Location> getLocationStream();
}
