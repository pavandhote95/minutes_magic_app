import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/otp/controllers/otp_controller.dart';
import 'package:minutes_magic_app/app/modules/payment/controllers/paymet_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
