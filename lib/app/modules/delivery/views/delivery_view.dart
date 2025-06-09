// lib/app/modules/delivery/views/delivery_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/modules/delivery/controllers/delivery_controller.dart';
import 'package:minutes_magic_app/app/routes/app_pages.dart';

import '../../address/views/delivery_address.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryController>(
      init: DeliveryController(),
      builder:
          (controller) => Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/delivery_boy.png',
                            height: 140,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Delivering Your World,\nOne Parcel at a Time",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Icon(
                      Icons.local_shipping_outlined,
                      size: 32,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Courier",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          // Pickup field
                          TextField(
                            controller: controller.pickupController,
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.circle, size: 12),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: controller.clearPickup,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Dropoff field
                          TextField(
                            controller: controller.dropoffController,
                            readOnly: false,
                            onTap: () async {
                              if (controller.dropoffController.text.isEmpty) {
                                final selectedAddress = await Get.toNamed(
                                  Routes.address,
                                );

                                if (selectedAddress != null &&
                                    selectedAddress is String) {
                                  controller.setDropoff(selectedAddress);
                                }
                              }
                            },
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.stop, size: 12),
                              hintText: "Dropoff location",
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Book Now Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (controller.dropoffController.text.isEmpty) {
                                  final selectedAddress = await Get.to(
                                    () => const DeliveryAddressView(),
                                  );
                                  if (selectedAddress != null &&
                                      selectedAddress is String) {
                                    controller.setDropoff(selectedAddress);
                                  }
                                } else {
                                  print(
                                    "Booking with drop-off: ${controller.dropoffController.text}",
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "Book Now",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
