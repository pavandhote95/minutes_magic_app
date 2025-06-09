import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/text_style.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({super.key});

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String selectedType = 'Debit'; // toggle state
  String cardBrand = 'mastercard'; // default image

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(_detectCardBrand);
  }

  void _detectCardBrand() {
    final text = cardNumberController.text;
    if (text.startsWith('4')) {
      setState(() => cardBrand = 'visa');
    } else if (text.startsWith('5')) {
      setState(() => cardBrand = 'mastercard');
    } else {
      setState(() => cardBrand = 'default');
    }
  }

  void _proceedToPay() {
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

    // Proceed logic
    debugPrint("Card Type: $selectedType");
    debugPrint("Card Number: $card");
    debugPrint("Expiry: $expiry");
    debugPrint("CVV: $cvv");
    debugPrint("Name: $name");

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment processing...', style: KTextStyle.poppins(fs: 10, c: Colors.black, fw: FontWeight.w500)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debit / Credit Card"),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToggleButtonsRow(
              selected: selectedType,
              onSelect: (value) => setState(() => selectedType = value),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: cardNumberController,
              decoration: InputDecoration(
                labelText: "Card number",
                filled: true,
                fillColor: const Color(0xFFF9F8F8),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/$cardBrand.png',
                    width: 30,
                    errorBuilder: (_, __, ___) => const Icon(Icons.credit_card),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: expiryController,
                    decoration: InputDecoration(
                      labelText: "Expiry date",
                      filled: true,
                      fillColor: const Color(0xFFF9F8F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: cvvController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "CVV",
                      filled: true,
                      fillColor: const Color(0xFFF9F8F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                filled: true,
                fillColor: const Color(0xFFF9F8F8),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _proceedToPay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Proceed to pay",style:KTextStyle.poppins(fs: 15, c: Colors.white, fw:FontWeight.normal),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleButtonsRow extends StatelessWidget {
  final String selected;
  final Function(String) onSelect;

  const ToggleButtonsRow({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onSelect("Debit"),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: selected == "Debit" ? Colors.blue[100] : Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: const Center(child: Text("Debit")),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onSelect("Credit"),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: selected == "Credit" ? Colors.blue[100] : Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Center(child: Text("Credit")),
            ),
          ),
        ),
      ],
    );
  }
}
