import 'package:get/route_manager.dart';
import 'package:maps/app/config/routes/routes.dart';
import 'package:maps/app/modules/home/home.dart';
import 'package:maps/app/modules/my_google_flutter_maps/my_google_flutter_maps.dart';
import 'package:maps/app/modules/my_map_box/my_map_box.dart';
import 'package:maps/app/modules/my_flutter_maps/my_flutter_maps_view.dart';

abstract class Pages {
  Pages._();

  static List<GetPage<dynamic>>? routes = [
    GetPage(
      name: Routes.home,
      page: HomeView.new,
    ),
    GetPage(
      name: Routes.myFlutterMaps,
      page: MyFlutterMapsView.new,
    ),
    GetPage(
      name: Routes.myGoggleFlutterMaps,
      page: MyGoogleFlutterMapsView.new,
    ),
    GetPage(
      name: Routes.myMapBox,
      page: MyMapBoxView.new,
    ),
  ];
}
