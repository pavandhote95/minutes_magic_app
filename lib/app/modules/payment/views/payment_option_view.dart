import 'package:flutter/material.dart';
import 'package:get/get.dart';
 // Import your controller
import 'package:minutes_magic_app/app/modules/payment/views/cart_payment_screen.dart';
import '../../../constants/text_style.dart';
import '../controllers/paymet_controller.dart';

class PaymentOptionScreen extends StatefulWidget {
  const PaymentOptionScreen({super.key});

  @override
  State<PaymentOptionScreen> createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
  String selectedLabel = 'Paytm'; // Default selected

  // Inject the PaymentController using Get.put or Get.find if already injected
  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Payment Option",
          style: KTextStyle.alata(fs: 20, c: Colors.black54, fw: FontWeight.w100),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: const Color.fromARGB(224, 244, 243, 243),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Scrollable list of payment options
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BankingTile(
                      label: 'Debit / Credit card',
                      imagePath: 'assets/images/card.png',
                      isSelected: selectedLabel == 'Debit / Credit card',
                      onTap: () {
                        setState(() => selectedLabel = 'Debit / Credit card');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CardPaymentScreen()),
                        );
                      },
                    ),
                    BankingTile(
                      label: 'Internet Banking',
                      imagePath: 'assets/images/internet_banking.png',
                      isSelected: selectedLabel == 'Internet Banking',
                      onTap: () {
                        setState(() => selectedLabel = 'Internet Banking');
                      },
                    ),
                    UPIPaymentTile(
                      label: 'Paytm',
                      iconPath: 'assets/images/paytm.png',
                      isSelected: selectedLabel == 'Paytm',
                      onTap: () {
                        setState(() => selectedLabel = 'Paytm');
                      },
                    ),
                    UPIPaymentTile(
                      label: 'Phonepe',
                      iconPath: 'assets/images/phonpe.png',
                      isSelected: selectedLabel == 'Phonepe',
                      onTap: () {
                        setState(() => selectedLabel = 'Phonepe');
                      },
                    ),
                    const SizedBox(height: 16),
                    Card(
                      elevation: 0,
                      color: const Color.fromARGB(255, 249, 248, 248),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () {
                          debugPrint("Add another option tapped");
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_circle_outline, size: 28, color: Colors.black),
                              SizedBox(width: 12),
                              Text(
                                'Add another option',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Proceed to Pay button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  paymentController.proceedToPay(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Proceed to pay",
                  style: KTextStyle.poppins(fs: 15, c: Colors.white, fw: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

// ---------------- BANKING TILE ----------------

class BankingTile extends StatelessWidget {
  final String label;
  final String imagePath; // Use image path instead of icon
  final bool isSelected;
  final VoidCallback onTap;

  const BankingTile({
    super.key,
    required this.label,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(255, 249, 248, 248),
      shape: RoundedRectangleBorder(
        side: isSelected ? const BorderSide(color: Colors.blue, width: 1.5) : BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Image.asset(
                imagePath,
                width: 28,
                height: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- UPI PAYMENT TILE ----------------

class UPIPaymentTile extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const UPIPaymentTile({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(255, 249, 248, 248),
      shape: RoundedRectangleBorder(
        side: isSelected ? const BorderSide(color: Colors.blue, width: 1.5) : BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Row(
            children: [
              Image.asset(iconPath, width: 28, height: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Image.asset(
                'assets/images/upi.png',
                width: 34,
                height: 34,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
