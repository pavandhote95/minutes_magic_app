import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/constants/AppTextStyle.dart';
import 'package:minutes_magic_app/app/modules/address/controllers/address_controller.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';
import 'package:minutes_magic_app/app/modules/home/views/recent_products_grid.dart';
import 'package:minutes_magic_app/app/modules/payment/views/payment_option_view.dart';

import '../../address/views/address_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Cart", style: AppTextStyle.Bold
          (fontSize: 20)),
        centerTitle: true,
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
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(
            child: Text(
              "Your cart is empty",
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// 🛒 Cart Items
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  final product = item.product;

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
                                product.image,
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
                                    product.name,
                                    style: GoogleFonts.cinzel(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'QUANTITY : ${item.quantity}',
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
                                        '₹${product.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.decreaseQuantity(product.id);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xFF227D25),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              minimumSize: const Size(40, 40), // Slightly bigger size
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: const Icon(Icons.remove, color: Colors.white),
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            '${item.quantity}',
                                            style: const TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(width: 12),
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.increaseQuantity(product.id);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xFF227D25),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              minimumSize: const Size(40, 40),
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: const Icon(Icons.add, color: Colors.white),
                                          ),
                                        ],
                                      )

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

              const SizedBox(height: 10),

              /// Recently Viewed
              const Text(
                'Recently Viewed',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(height: 340, child: RecentproductGrid()),
            ],
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) return const SizedBox.shrink();

        return Theme(
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
                  _showCheckoutBottomSheet(context, controller.totalPrice);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF227D25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Checkout (₹${controller.totalPrice.toStringAsFixed(2)})',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }







  void _showCheckoutBottomSheet(BuildContext context, double totalPrice) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        // Initialize AddressController if not already done
        final addressController = Get.put(AddressController());

        return Obx(() {
          final selectedAddress = addressController.selectedSavedAddress.value;

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
                /// AppBar Row
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
                    Padding(
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
                              Icons.cancel_outlined,
                              color: Colors.black54,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Divider(thickness: 1.2),

                /// Delivery Address Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deliver to: ${selectedAddress.isNotEmpty ? selectedAddress.split(',').first : "No address selected"}",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              selectedAddress.isNotEmpty
                                  ? selectedAddress
                                  : "Please select a delivery address",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () async {
                          // Wait for address selection
                          final result = await Get.to<String>(() => const DeliveryAddressView());
                          if (result != null) {
                            addressController.selectedSavedAddress.value = result;
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF227D25)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          minimumSize: const Size(70, 35),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        child: Text(
                          "Change",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF227D25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(thickness: 1.2),

                /// Rest of your bottom sheet content...
                _buildOptionTile(
                  title: "Payment",
                  icon: Icons.payment_outlined,
                  onTap: () => Get.to(() => const PaymentOptionScreen()),
                ),

                _buildOptionTile(
                  title: "Promo Code",
                  subtitle: "Pick discount",
                  icon: Icons.discount_outlined,
                  onTap: () {},
                ),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Total Cost",
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
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
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                    label: Text(
                      "Place Order",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (selectedAddress.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "Please select a delivery address",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.red,
                          fontSize: 14.0,
                        );

                        return;
                      }
                      Navigator.pop(context);
                      // Place order logic
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
        });
      },
    );
  }




  Widget _buildOptionTile({
    required String title,
    String? subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subtitle != null)
            Text(
              subtitle,
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.black54),
            ),
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
