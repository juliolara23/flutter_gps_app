import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gps_camera_app/services/geolocator_service.dart';

class GeoLocatorController extends GetxController {
  GeolocatorService geolocatorService = Get.find();

  final Rx<String> _latitude = RxString('');
  final Rx<String> _longitude = RxString('');

  String get latitude => _latitude.value;
  String get longitude => _longitude.value;

  final Rx<double> _latitudeNumber = RxDouble(0);
  final Rx<double> _longitudeNumber = RxDouble(0);

  double get latitudeNumber => _latitudeNumber.value;
  double get longitudeNumber => _longitudeNumber.value;

  Future<void> getCurrentLocation() async {
    try {
      Position? position = await geolocatorService.returnLocation();
      if (position != null) {
        _latitude.value = position.latitude.toString();
        _longitude.value = position.longitude.toString();
      } else {
        _latitude.value = '0';
        _longitude.value = '0';
      }
    } catch (e) {
      print("ha ocurrido un error al consultar la ubicación");
    }
  }

  Future<void> getCurrentLocationNumber() async {
    try {
      Position? position = await geolocatorService.returnLocation();
      if (position != null) {
        _latitudeNumber.value = position.latitude;
        _longitudeNumber.value = position.longitude;
      } else {
        _latitudeNumber.value = 0;
        _longitudeNumber.value = 0;
      }
    } catch (e) {
      print("ha ocurrido un error al consultar la ubicación");
    }
  }
}
