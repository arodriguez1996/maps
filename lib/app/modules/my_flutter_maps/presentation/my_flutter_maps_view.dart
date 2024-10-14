import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/app/modules/my_flutter_maps/presentation/widgets/my_flutter_maps.dart';

class MyFlutterMapsView extends StatelessWidget {
  const MyFlutterMapsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: const Center(
          child: MyFlutterMaps(),
        ),
      );
}
