import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/delivery/controllers/delivery_controller.dart';

class DeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryController>(() => DeliveryController());
  }
}
