import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationService extends GetxService {
  final Location _location = Location();
  Rx<LocationData> location = LocationData.fromMap({
    'latitude': 0.0,
    'longitude': 0.0,
  }).obs;
  RxBool loading = true.obs;

  @override
  Future<void> onInit() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
    } //-12.161258784593446, -76.98645463781025

    // Check for location permissions
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return Future.error('Location permission denied.');
      }
    }
    location.value = await _location.getLocation();
    loading.value = false;

    super.onInit();
  }
}
