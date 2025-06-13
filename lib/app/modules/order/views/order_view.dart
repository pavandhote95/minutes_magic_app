import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../myorders/views/myorders_view.dart';
import '../../trackmyorder/views/trackmyorder_view.dart';

class OrderConfirmedView extends StatelessWidget {
  const OrderConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:  const BackButton(color: Colors.black),
        title: Text(
          'Order Confirmed',
          style: GoogleFonts.poppins(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Checkmark circle
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFE8F5E9), // Light green background
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/check_mark.png',
                  width: 60,
                  height: 60,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.check_circle,
                    size: 60,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Order confirmed text
            Text(
              'ORDER CONFIRMED!',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),

            // Success message
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                children: [
                  TextSpan(text: 'Your order has been placed successfully. '),
                  TextSpan(
                    text: 'View Order History',
                    style: const TextStyle(
                      color: Color(0xFF227D25),
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyordersView()),
                        );// 👈 Navigate to your "My Orders" page
                      },
                  ),

                ],
              ),
            ),
            const SizedBox(height: 8),

            // Delivery estimate
            Text(
              'Estimated delivery: Mon, 06 Feb - Thu, 09 Feb',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Track order button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackmyorderView()),
                );// 👈
                // Handle track order
              },
              child: Text(
                'TRACK MY ORDER',
                style: GoogleFonts.poppins(
                  color: Color(0xFF227D25),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Continue shopping button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF227D25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Get.toNamed('/all-category');
                  // Handle continue shopping
                },
                child: Text(
                  'CONTINUE SHOPPING',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}