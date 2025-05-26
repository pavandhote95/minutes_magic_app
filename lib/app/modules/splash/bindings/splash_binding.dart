import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/splash/controllers/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
