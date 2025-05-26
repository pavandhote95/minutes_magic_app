import 'package:flutter/material.dart';


class PopularShop extends StatelessWidget {
  const PopularShop({super.key});


  final List<Product> products = const [
    Product(
      name: "Alphonso Mango",
      price: 200,
      oldPrice: 240,
      unit: "1kg",
      image: "assets/images/mango.png",
    ),
    Product(
      name: "Strawberry Drink",
      price: 160,
      oldPrice: 180,
      unit: "750 ml",
      image: "assets/images/strawberry.png",
    ),
    Product(
      name: "Almonds",
      price: 900,
      oldPrice: 1100,
      unit: "500 g",
      image: "assets/images/Dry Fruits.png",
      backgroundColor: Color(0xFFE2F5F7),
    ),
    Product(
      name: "Alphonso Mango",
      price: 200,
      unit: "1kg",
      image: "assets/images/mango.png",
    ),
    Product(
      name: "Strawberry Drink",
      price: 180,
      unit: "750 ml",
      image: "assets/images/strawberry.png",
    ),
    Product(
      name: "Almonds",
      price: 900,
      unit: "500 g",
      image: "assets/images/Dry Fruits.png",
      backgroundColor: Color(0xFFE2F5F7),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: products.length,
            physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 28,
            mainAxisSpacing: 10,
            childAspectRatio: 0.50,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
         
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '₹ ${product.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 6),
                      if (product.oldPrice != null)
                        Text(
                          '₹ ${product.oldPrice}',
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                  if (product.unit != null)
                    Text(
                      product.unit!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final int price;
  final int? oldPrice;
  final String? unit;
  final String image;
  final Color? backgroundColor;

  const Product({
    required this.name,
    required this.price,
    this.oldPrice,
    this.unit,
    required this.image,
    this.backgroundColor,
  });
}
