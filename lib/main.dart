import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  //     Get.put(HairController())
  // Get.put(FacialController());
  // Get.put(NailController());
  // Get.put(SpaController());
  // Get.put(ColorController());
  // Get.put(CombinedServiceController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),

    //flutter
  );
}
