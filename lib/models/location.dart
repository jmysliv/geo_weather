import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Location extends Equatable {
  bool get stringify => true;

  final double lat;
  final double lon;

  Location({@required this.lat, @required this.lon});

  Location copyWith({double lat, double lon}) {
    return Location(lat: lat ?? this.lat, lon: lon ?? this.lon);
  }

  @override
  List get props => [lat, lon];

  Map<String, dynamic> toJson() {
    return {"lat": lat, "lon": lon};
  }

  factory Location.fromJson(dynamic json) {
    if (json == null) return null;
    return Location(lat: json["lat"] as double, lon: json["lon"] as double);
  }
}
