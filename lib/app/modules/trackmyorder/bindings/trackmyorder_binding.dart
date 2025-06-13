import 'package:get/get.dart';

import '../controllers/trackmyorder_controller.dart';

class TrackmyorderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackmyorderController>(
      () => TrackmyorderController(),
    );
  }
}
