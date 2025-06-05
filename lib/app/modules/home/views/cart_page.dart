import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/constants/AppTextStyle.dart';
import 'package:minutes_magic_app/app/modules/home/views/recent_products_grid.dart';
import 'package:minutes_magic_app/app/modules/payment/views/payment_view.dart';

import '../../payment/views/payment_option_view.dart';
import '../../profile/views/profile_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  final List<Map<String, dynamic>> cartItems = const [
    {
      'name': 'BIKAJI NAMKEEN',
      'quantity': 1,
      'price': 25.50,
      'image': 'assets/images/spices.png',
    },
    {
      'name': 'BIKAJI NAMKEEN',
      'quantity': 1,
      'price': 25.50,
      'image': 'assets/images/spices.png',
    },
    {
      'name': 'BIKAJI NAMKEEN',
      'quantity': 1,
      'price': 25.50,
      'image': 'assets/images/spices.png',
    },
    {
      'name': 'BIKAJI NAMKEEN',
      'quantity': 1,
      'price': 25.50,
      'image': 'assets/images/spices.png',
    },
    {
      'name': 'BIKAJI NAMKEEN',
      'quantity': 1,
      'price': 25.50,
      'image': 'assets/images/spices.png',
    },
    {
      'name': 'BIKAJI NAMKEEN',
      'quantity': 1,
      'price': 25.50,
      'image': 'assets/images/spices.png',
    },
  ];

  double getTotalPrice() {
    return cartItems.fold<double>(
      0,
      (sum, item) => sum + item['price'] * item['quantity'],
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = getTotalPrice();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Cart", style: AppTextStyle.Bold(fontSize: 20)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item['image'],
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: GoogleFonts.cinzel(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 9,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'QUANTITY : ${item['quantity']}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 9,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${item['price'].toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.remove_circle_outline,
                                                size: 25,
                                              ),
                                              onPressed: () {
                                                // handle decrease quantity
                                              },
                                              color: Colors.grey,
                                            ),
                                            Text('${item['quantity']}'),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.add_circle_outline,
                                                size: 25,
                                              ),
                                              onPressed: () {
                                                // handle increase quantity
                                              },
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(indent: 2, endIndent: 2),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Recently Viewed',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(height: 340, child: RecentproductGrid()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _showCheckoutBottomSheet(context, totalPrice);
                // Handle checkout action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF227D25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.zero,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Checkout',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                      ),

                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
  // Place this in your CartPage inside onTap of 'Place Order' button:
  void _showCheckoutBottomSheet(BuildContext context, double totalPrice) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Checkout",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(thickness: 1.2),

              /// Delivery
              _buildOptionTile(
                title: "Delivery",
                subtitle: "Select Method",
                icon: Icons.local_shipping_outlined,
                onTap: () {},
              ),

              /// Payment
              _buildOptionTile(
                title: "Payment",
                icon: Icons.payment_outlined,
                onTap: () => Get.to(() => const PaymentOptionScreen()),
              ),

              /// Promo Code
              _buildOptionTile(
                title: "Promo Code",
                subtitle: "Pick discount",
                icon: Icons.discount_outlined,
                onTap: () {},
              ),

              /// Total Cost
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Total Cost",
                    style: GoogleFonts.poppins(fontSize: 15)),
                trailing: Text(
                  "₹${totalPrice.toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "By placing an order you agree to our\n",
                  style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "Terms and Conditions",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF227D25),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(

                  label: Text(
                    "Place Order",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Final order placement logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF227D25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Custom ListTile with icon and optional subtitle
  Widget _buildOptionTile({
    required String title,
    String? subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 14),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subtitle != null)
            Text(subtitle,
                style: GoogleFonts.poppins(fontSize: 13, color: Colors.black54)),
          const SizedBox(width: 6),
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }

}
