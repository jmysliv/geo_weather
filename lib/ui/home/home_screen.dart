import 'package:flutter/material.dart';
import 'package:geo_weather/bloc/weather_bloc.dart';
import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/ui/utils/poland_map.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location currentLocation;

  _locationMarker(double imageSize) {
    PolandMap map = PolandMap(imageSize: imageSize);
    if (currentLocation != null && map.isInside(currentLocation)) {
      return Positioned(
          top: map.getTopOffset(currentLocation),
          left: map.getLeftOffset(currentLocation),
          child: Container(
              width: 10,
              height: 10,
              decoration:
                  BoxDecoration(color: Colors.orange, shape: BoxShape.circle)));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double imageSize = size.width - 20;
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: context.read<WeatherBloc>().locationStream,
        builder: (context, AsyncSnapshot<Location> snapshot) {
          if (snapshot.hasData) currentLocation = snapshot.data;
          return Column(children: [
            Container(
                width: size.width,
                height: size.height * 0.7,
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset(
                          "assets/map.png",
                          width: imageSize,
                          height: imageSize,
                        )),
                    _locationMarker(imageSize)
                  ],
                )),
            Text(
              currentLocation != null
                  ? 'lat: ${currentLocation.lat}; lon: ${currentLocation.lon}'
                  : "Loading location...",
            ),
          ]);
        },
      ),
    );
  }
}
