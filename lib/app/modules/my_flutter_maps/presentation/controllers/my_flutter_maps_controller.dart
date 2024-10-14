import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps/app/modules/main/core/services/location_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyFlutterMapsController extends GetxController {
  MyFlutterMapsController(this._locationService);

  final LocationService _locationService;

  final searchController = TextEditingController();
  final RxList<Marker> markers = <Marker>[].obs;

  LatLng get currentPosition => const LatLng(
      // _locationService.location.value.latitude!,
      // _locationService.location.value.longitude!,
      -12.161258784593446,
      -76.98645463781025);
  bool get loadingLocation => _locationService.loading.value;

  Future<void> search() async {
    if (searchController.text.isEmpty) return;

    // final response = await http.get(
    //   Uri.parse(
    //       'https://nominatim.openstreetmap.org/search?q=${searchController.text}&country=peru&city=lima&format=json&limit=5'),
    // );

    final response = await http.get(
      Uri.parse(
          'https://nominatim.openstreetmap.org/search?q=${searchController.text}&format=json&limit=5'),
    );

    if (response.statusCode == 200) {
      List places = jsonDecode(response.body);
      markers.clear();
      for (var place in places) {
        debugPrint('place: $place');
        markers.add(
          Marker(
            width: 50.0,
            height: 50.0,
            point:
                LatLng(double.parse(place['lat']), double.parse(place['lon'])),
            child: const FlutterLogo(),
          ),
        );
      }
      update();
      // Procesar la lista de lugares devueltos
    }
  }
}
