import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/address/controllers/address_controller.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(() => AddressController());
  }
}
