import 'package:flutter/material.dart';
import 'package:geo_weather/bloc/weather_bloc.dart';
import 'package:geo_weather/models/location.dart';
import 'package:geo_weather/ui/utils/poland_map.dart';
import 'package:geo_weather/ui/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:build_context/build_context.dart';

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
                  BoxDecoration(color: bittersweet, shape: BoxShape.circle)));
    }
    return Container();
  }

  _map(double width) {
    double imageSize = width - 20;
    return Container(
        width: width,
        height: width,
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
        ));
  }

  _labelWithIcon(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: bittersweet,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
                color: oxfordBlue, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }

  _labels() {
    if (currentLocation == null) {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(oxfordBlue),
                strokeWidth: 3.0)),
      );
    }
    return Container(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            _labelWithIcon(Icons.north, "Latitude: ${currentLocation.lat}"),
            SizedBox(
              height: 5,
            ),
            _labelWithIcon(Icons.east, "Longitude: ${currentLocation.lon}")
          ],
        ));
  }

  _button(IconData icon, String text, Function onPressed) {
    return RaisedButton.icon(
      padding: EdgeInsets.symmetric(horizontal: 30),
      icon: Icon(icon, color: bittersweet),
      onPressed: onPressed,
      elevation: 5,
      label: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: bittersweet,
              fontFamily: 'Montserrat',
              fontSize: 15.0,
              fontWeight: FontWeight.bold)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location",
          style: TextStyle(color: bittersweet),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: context.read<WeatherBloc>().locationStream,
        builder: (context, AsyncSnapshot<Location> snapshot) {
          if (snapshot.hasData) currentLocation = snapshot.data;
          return Column(children: [
            _map(size.width),
            SizedBox(
              height: 20,
            ),
            _labels(),
            SizedBox(
              height: 10,
            ),
            _button(Icons.cloud, "Check weather",
                () => context.pushNamed("/weather"))
          ]);
        },
      ),
    );
  }
}
