import 'package:get/get.dart';

class SecondController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}