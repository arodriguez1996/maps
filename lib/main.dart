import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:maps/app/config/routes/pages.dart';
import 'package:maps/app/config/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Maps Demo',
      getPages: Pages.routes,
      initialRoute: Routes.home,
    );
  }
}
