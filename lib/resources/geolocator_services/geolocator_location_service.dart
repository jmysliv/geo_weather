import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/resources/services/location_service.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorLocationService extends LocationService {
  static Future<void> initialize() async {
    var permission = await Geolocator.checkPermission();
    while (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
  }

  @override
  Stream<Location> getLocationStream() {
    return Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.medium, distanceFilter: 1)
        .map((event) => Location(lat: event.latitude, lon: event.longitude))
        .asBroadcastStream();
  }
}
