import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_demo/second_controller.dart';

class SecondScreen extends StatelessWidget {
  final controller = Get.put(SecondController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("second screen")),
      body: Column(
        children: [
          Obx(() => Text("${controller.count}")),
          TextButton(onPressed: () {controller.increment();}, child: const Text("get data"))
        ],
      ),
    );
  }
}
