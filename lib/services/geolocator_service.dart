import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class GeolocatorService {
  loc.Location location = loc.Location();

  Future<void> checkPermission() async {
    if (await Permission.location.request().isGranted) {
      print("Tiene permiso");
    } else {
      print("No tiene permiso");
    }
  }

  Future<Position?> returnLocation() async {
    Position? currentLocation;
    try {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
