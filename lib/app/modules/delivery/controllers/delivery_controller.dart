// lib/app/modules/delivery/controllers/delivery_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {
  final pickupController = TextEditingController(
    text: "Evergreen Mills Rd, Aldie, VA",
  );
  final dropoffController = TextEditingController();

  void clearPickup() {
    pickupController.clear();
  }

  void setDropoff(String address) {
    dropoffController.text = address;
    update(); // Only needed if using GetBuilder
  }

  @override
  void onClose() {
    pickupController.dispose();
    dropoffController.dispose();
    super.onClose();
  }
}
