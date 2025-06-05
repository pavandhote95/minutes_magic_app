import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/home/controllers/cart_controller.dart';


class CartPage extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
          () => CartController(),
    );
  }
}
