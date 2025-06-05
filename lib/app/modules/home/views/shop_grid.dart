import 'package:flutter/material.dart';

class PopularShopGridPage extends StatelessWidget {
  const PopularShopGridPage({super.key});

  final List<Shop> shops = const [
    Shop(name: "Minutes Magic", image: "assets/images/shop1.png"),
    Shop(name: "Fresh Shop", image: "assets/images/shop2.png"),
    Shop(name: "D-Mart", image: "assets/images/shop3.png"),
    Shop(name: "Smart Bazar", image: "assets/images/shop4.png"),
    Shop(name: "V Mart", image: "assets/images/shop5.png"),
    Shop(name: "Big Basket", image: "assets/images/shop6.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: shops.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            childAspectRatio: 0.80,
          ),
          itemBuilder: (context, index) {
            final shop = shops[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(shop.image, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      shop.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Shop {
  final String name;
  final String image;

  const Shop({required this.name, required this.image});
}
