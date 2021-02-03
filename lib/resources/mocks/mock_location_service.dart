import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/resources/services/location_service.dart';
import 'package:rxdart/subjects.dart';

class MockLocationService extends LocationService {
  BehaviorSubject<Location> _locationStream;
  @override
  Stream<Location> getLocationStream() {
    _locationStream =
        new BehaviorSubject<Location>.seeded(Location(lat: 50.1, lon: 19.2));
    return _locationStream;
  }

  void addLocationEvent(Location location) {
    _locationStream.sink.add(location);
  }
}
