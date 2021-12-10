import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_camera_app/services/geolocator_service.dart';

class MapController extends GetxController {
  GeolocatorService geolocatorService = Get.find();

  final Rx<LatLng> _posIni = const LatLng(0.0, 0.0).obs;

  LatLng get posIni => _posIni.value;

  Future<void> getCurrentMapLocation() async {
    try {
      Position? position = await geolocatorService.returnLocation();
      if (position != null) {
        _posIni.value = LatLng(position.latitude, position.longitude);
      } else {
        _posIni.value = const LatLng(0.0, 0.0);
      }
    } catch (e) {
      print("ha ocurrido un error al consultar la ubicación");
    }
  }
}
