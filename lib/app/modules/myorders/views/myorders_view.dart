import 'package:flutter/material.dart';

class MyordersView extends StatelessWidget {
  final List<OrderItem> orders = [
    OrderItem(status: 'Delivered', date: 'October 26, 2024', price: '₹700'),
    OrderItem(status: 'Delivered', date: 'October 20, 2024', price: '₹550'),
    OrderItem(status: 'Cancelled', date: 'October 10, 2024', price: '₹799'),
    OrderItem(status: 'Cancelled', date: 'September 25, 2024', price: '₹450'),
    OrderItem(status: 'Delivered', date: 'September 12, 2024', price: '₹1,200'),
    OrderItem(status: 'Delivered', date: 'August 30, 2024', price: '₹999'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body:

      ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final order = orders[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: order.status == 'Delivered'
                        ? const Color(0xFF227D25)
                        : Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(Icons.shopping_bag, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order #345',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order.status,
                        style: TextStyle(
                          color: order.status == 'Delivered'
                              ? const Color(0xFF227D25)
                              : Colors.redAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order.date,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  order.price,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class OrderItem {
  final String status;
  final String date;
  final String price;

  OrderItem({required this.status, required this.date, required this.price});
}
