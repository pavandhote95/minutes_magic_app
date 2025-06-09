import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({super.key});
  @override
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCC00)
,

      body: Center(
        child: Image.asset(
          'assets/images/applogo.png',
          width: 700, // Adjust size as needed
          height: 700,
        ),
      ),
    );
  }
}
