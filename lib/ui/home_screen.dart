import 'package:flutter/material.dart';
import 'package:geo_weather/bloc/weather_bloc.dart';
import 'package:geo_weather/models/location.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  final String title = "Geo Weather";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location currentLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: context.read<WeatherBloc>().locationStream,
        builder: (context, AsyncSnapshot<Location> snapshot) {
          if (snapshot.hasData) currentLocation = snapshot.data;
          return Center(
            child: Text(
              currentLocation != null
                  ? 'lat: ${currentLocation.lat}; lon: ${currentLocation.lon}'
                  : "Loading location...",
            ),
          );
        },
      ),
    );
  }
}
