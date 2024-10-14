import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:maps/app/config/routes/routes.dart';

const Map<String, String> providers = {
  "Flutter Maps": Routes.myFlutterMaps,
  "Google Maps": Routes.myGoggleFlutterMaps,
  "MapBox": Routes.myMapBox,
};

//['Flutter Maps', 'Google Maps', 'MapBox'];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                const Text(
                  'Welcome to the Flutter Maps Demo!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text('Select a map provider from the drawer.'),
                const SizedBox(
                  height: 24,
                ),
                for (var entry in providers.entries)
                  ListTile(
                    title: Text(entry.key),
                    onTap: () => Get.toNamed(entry.value),
                  ),
              ],
            ),
          ),
        ),
      );
}
