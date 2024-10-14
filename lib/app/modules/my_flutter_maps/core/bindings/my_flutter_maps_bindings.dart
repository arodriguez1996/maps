import 'package:get/get.dart';
import 'package:maps/app/modules/main/core/services/location_service.dart';
import 'package:maps/app/modules/my_flutter_maps/presentation/controllers/my_flutter_maps_controller.dart';

class MyFlutterMapsBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..put(LocationService())
      ..lazyPut(() => MyFlutterMapsController(Get.find()));
  }
}
