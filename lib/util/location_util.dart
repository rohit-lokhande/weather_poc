import 'package:location/location.dart';

class LocationUtil {
  static Location location = Location();

  static bool _serviceEnabled = false;
  static late PermissionStatus _permissionGranted;
  static late LocationData _locationData;

  static Future<bool> _isServiceEnabled() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
      return true;
    }
    return _serviceEnabled;
  }

  static Future<bool> _enablePermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return true;
      }
      return false;
    }
    return _permissionGranted == PermissionStatus.granted;
  }

  static Future<LocationData> getLocation() async {
    if (await _enablePermission() && await _isServiceEnabled()) {
      _locationData = await location.getLocation();
    }
    return _locationData;
  }
}
