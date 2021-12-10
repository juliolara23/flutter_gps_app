import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gps_camera_app/controllers/geolocator_controller.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  GeoLocatorController geoLocatorController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            geoLocatorController.latitude == ""
                ? const CircularProgressIndicator()
                : Text("Ubicación: " +
                    geoLocatorController.latitude +
                    " " +
                    geoLocatorController.longitude),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => geoLocatorController.getCurrentLocation(),
                child: const Text(
                  "Mostrar Ubicación",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
