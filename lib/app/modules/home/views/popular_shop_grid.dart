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
            mainAxisSpacing: 8,
            childAspectRatio: 0.70,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(

         
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(product.image, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 12),
                  ),
                  const SizedBox(height: 4),




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


  const Shop({
    required this.name,

    required this.image,

  });
}
