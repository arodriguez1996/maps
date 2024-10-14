import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/app/modules/my_flutter_maps/presentation/controllers/my_flutter_maps_controller.dart';
import 'package:maps/app/modules/my_flutter_maps/presentation/widgets/my_flutter_maps.dart';

class MyFlutterMapsView extends GetView<MyFlutterMapsController> {
  const MyFlutterMapsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 400.0,
                child: MyFlutterMaps(),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: controller.searchController,
                decoration: const InputDecoration(
                  hintText: 'Search any location',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () => controller.search(),
                child: const Text('search'),
              )
            ],
          ),
        ),
      );
}
