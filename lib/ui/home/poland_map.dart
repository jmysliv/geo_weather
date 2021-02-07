import 'package:flutter/cupertino.dart';
import 'package:geo_weather/models/location.dart';

class PolandMap {
  static final northernmostPoint = Location(lat: 54.50, lon: 18.04);
  static final southernmostPoint = Location(lat: 49.002024, lon: 22.859635);
  static final easternmostPoint = Location(lat: 50.86852, lon: 24.14585);
  static final westernmostPoint = Location(lat: 52.83827, lon: 14.12298);
  static final topLeftEdge =
      Location(lat: northernmostPoint.lat, lon: westernmostPoint.lon);
  static final bottomRightEdge =
      Location(lat: southernmostPoint.lat, lon: easternmostPoint.lon);
  final double imageSize;

  PolandMap({@required this.imageSize});

  bool isInside(Location location) {
    if (location.lat <= northernmostPoint.lat &&
        location.lat >= southernmostPoint.lat &&
        location.lon >= westernmostPoint.lon &&
        location.lon <= easternmostPoint.lon) return true;
    return false;
  }

  double getTopOffset(Location location) {
    return (imageSize * (northernmostPoint.lat - location.lat)) /
        (northernmostPoint.lat - southernmostPoint.lat);
  }

  double getLeftOffset(Location location) {
    return (imageSize * (location.lon - westernmostPoint.lon)) /
        (easternmostPoint.lon - westernmostPoint.lon);
  }
}
