import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/cart/bindings/cart_binding.dart';
import 'app/modules/address/controllers/address_controller.dart';
import 'app/routes/app_pages.dart';

void main() {

  runApp(
    GetMaterialApp(
      initialBinding: CartBinding(),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
