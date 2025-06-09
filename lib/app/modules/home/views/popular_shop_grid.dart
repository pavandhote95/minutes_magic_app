import 'package:flutter/material.dart';

class PopularShop extends StatelessWidget {
  const PopularShop({super.key});

  final List<Shop> products = const [
    Shop(name: "Minutes Magic", image: "assets/images/shop1.png"),
    Shop(name: "Fresh Product", image: "assets/images/shop2.png"),
    Shop(name: "D-Mart", image: "assets/images/shop3.png"),
    Shop(name: "Smart Bazar", image: "assets/images/shop4.png"),
    Shop(name: "V Mart", image: "assets/images/shop5.png"),
    Shop(name: "Big Basket", image: "assets/images/shop6.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    // Adjust columns based on orientation + screen width
    int crossAxisCount =
        orientation == Orientation.portrait
            ? (screenWidth < 600 ? 3 : 4)
            : (screenWidth < 800 ? 4: 6);

    // Adjust aspect ratio based on orientation
    double aspectRatio = orientation == Orientation.portrait ? 0.75 : 0.65;

    return GridView.builder(
      itemCount: products.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(product.image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}

class Shop {
  final String name;
  final String image;

  const Shop({required this.name, required this.image});
}
