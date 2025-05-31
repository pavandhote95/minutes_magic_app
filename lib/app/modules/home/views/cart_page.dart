import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Cart'),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              SizedBox(
                height: 280,
                child: ListView.builder(
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
                              // Product Image
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
                              // Product Info and Counter
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

                              // Quantity Counter
                            ],
                          ),
                        ),
                        const Divider(indent: 2, endIndent: 2),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              const Text(
                'Recently Viewed',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(height: 340, child: RecentproductGrid()),
            ],
          ),
        ),
      ),
    );
  }
}
