import 'package:flutter/material.dart';
import 'package:gps_camera_app/controllers/geolocator_controller.dart';
import 'package:gps_camera_app/controllers/googlemaps_controller.dart';
import 'package:gps_camera_app/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:gps_camera_app/services/geolocator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<GeolocatorService>(() => GeolocatorService());
  Get.lazyPut<GeoLocatorController>(() => GeoLocatorController());
  Get.lazyPut<MapController>(() => MapController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Constructor
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GPS app',
        theme: ThemeData(
          brightness: Brightness.light,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 24.0,
              ),
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            ),
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 46.0,
              color: Colors.blue.shade700,
              fontWeight: FontWeight.w500,
            ),
            bodyText1: const TextStyle(fontSize: 18.0),
          ),
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}
