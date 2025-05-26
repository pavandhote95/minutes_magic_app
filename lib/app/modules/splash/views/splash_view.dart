import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:minutes_magic_app/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
   SplashView({super.key});
    final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        fit: StackFit.expand,

        children: [
          Image.asset(
            'assets/images/spls.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              'assets/images/applogo.png',
              width: 700, // Adjust size as needed
              height: 700,

            ),
          ),
        ],
      ),
    );
  }
}
