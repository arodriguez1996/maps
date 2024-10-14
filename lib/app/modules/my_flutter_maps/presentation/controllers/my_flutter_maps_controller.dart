import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/app/modules/main/core/services/location_service.dart';

class MyFlutterMapsController extends GetxController {
  MyFlutterMapsController(this._locationService);

  final LocationService _locationService;

  LatLng get currentPosition => LatLng(
        _locationService.location.value.latitude!,
        _locationService.location.value.longitude!,
      );
  bool get loadingLocation => _locationService.loading.value;
}
