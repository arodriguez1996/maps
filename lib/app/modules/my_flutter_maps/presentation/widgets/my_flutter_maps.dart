import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:maps/app/modules/my_flutter_maps/presentation/controllers/my_flutter_maps_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFlutterMaps extends GetView<MyFlutterMapsController> {
  const MyFlutterMaps({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => controller.loadingLocation
            ? const SizedBox()
            : GetBuilder<MyFlutterMapsController>(
                builder: (builder) => FlutterMap(
                  options: MapOptions(
                    initialCenter: controller
                        .currentPosition, // Center the map over London
                    initialZoom: 15.0,
                  ),
                  children: [
                    TileLayer(
                      // Display map tiles from any source
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                      userAgentPackageName: 'com.example.app',
                      // And many more recommended properties!
                    ),
                    MarkerLayer(
                      markers: controller.markers,
                    ),
                    RichAttributionWidget(
                      // Include a stylish prebuilt attribution widget that meets all requirments
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => launchUrl(Uri.parse(
                              'https://openstreetmap.org/copyright')), // (external)
                        ),
                        // Also add images...
                      ],
                    ),
                  ],
                ),
              ),
      );
}
