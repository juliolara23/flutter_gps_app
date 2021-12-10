import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gps_camera_app/services/geolocator_service.dart';

class GeoLocatorController extends GetxController {
  GeolocatorService geolocatorService = Get.find();

  final Rx<String> _latitude = RxString('');
  final Rx<String> _longitude = RxString('');

  String get latitude => _latitude.value;
  String get longitude => _longitude.value;

  Future<void> getCurrentLocation() async {
    try {
      Position? position = await geolocatorService.returnLocation();
      if (position != null) {
        _latitude.value = position.latitude.toString();
        _longitude.value = position.longitude.toString();
      }
    } catch (e) {
      print("ha ocurrido un error al consultar todas las tareas");
    }
  }
}
