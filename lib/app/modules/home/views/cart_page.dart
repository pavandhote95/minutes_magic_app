import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/constants/AppTextStyle.dart';
import 'package:minutes_magic_app/app/modules/home/views/recent_products_grid.dart';

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
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 0,
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
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
}
