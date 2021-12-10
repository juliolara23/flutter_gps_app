import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gps_camera_app/controllers/geolocator_controller.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  GeoLocatorController geoLocatorController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                geoLocatorController.latitude == ""
                    ? const CircularProgressIndicator()
                    : Text("Location:" +
                        geoLocatorController.latitude +
                        " " +
                        geoLocatorController.longitude),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () => geoLocatorController.getCurrentLocation(),
                    color: Colors.blue,
                    child: const Text(
                      "Get Location",
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
