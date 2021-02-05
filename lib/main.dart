import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geo_weather/bloc/weather_bloc.dart';
import 'package:geo_weather/resources/geolocator_services/geolocator_location_service.dart';
import 'package:geo_weather/resources/open_weather_map_repositories/owm_weather_repository.dart';
import 'package:geo_weather/resources/repositories/weather_repository.dart';
import 'package:geo_weather/resources/services/location_service.dart';
import 'package:geo_weather/ui/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GeolocatorLocationService.initialize();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          Provider<LocationService>(
            create: (_) => GeolocatorLocationService(),
          ),
          Provider<WeatherRepository>(
            create: (_) => OwmWeatherRepository(),
          )
        ],
        child: Builder(
          builder: (context) {
            return Provider<WeatherBloc>(
              create: (_) => WeatherBloc(
                  repository: context.read<WeatherRepository>(),
                  locationService: context.read<LocationService>()),
              child: MaterialApp(
                title: 'Geo Weather',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case "/":
                      {
                        return PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            child: HomeScreen());
                      }
                    default:
                      {
                        // this should not happen
                        assert(false);
                        return null;
                      }
                  }
                },
                initialRoute: "/",
              ),
            );
          },
        ));
  }
}
