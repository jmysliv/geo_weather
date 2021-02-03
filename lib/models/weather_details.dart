import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class WeatherDetails extends Equatable {
  bool get stringify => true;

  final String main;
  final String description;
  final String icon;

  WeatherDetails(
      {@required this.main, @required this.description, @required this.icon});

  WeatherDetails copyWith({String main, String description, String icon}) {
    return WeatherDetails(
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon);
  }

  @override
  List get props => [main, description, icon];

  Map<String, dynamic> toJson() {
    return {"main": main, "description": description, "icon": icon};
  }

  factory WeatherDetails.fromJson(dynamic json) {
    if (json == null) return null;
    return WeatherDetails(
        main: json["main"],
        description: json["description"],
        icon: json["icon"]);
  }
}
