import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  final nameController = TextEditingController();

  void proceedToPay(BuildContext context) {
    final card = cardNumberController.text;
    final expiry = expiryController.text;
    final cvv = cvvController.text;
    final name = nameController.text;

    if (card.isEmpty || expiry.isEmpty || cvv.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // Proceed with payment logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment processing...')),
    );

    // Example: Clear fields after successful payment
    cardNumberController.clear();
    expiryController.clear();
    cvvController.clear();
    nameController.clear();
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
