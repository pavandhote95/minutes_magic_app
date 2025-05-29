import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/otp/controllers/otp_controller.dart';



class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
  }
}
