
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/constants/AppTextStyle.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';
import 'package:minutes_magic_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:minutes_magic_app/app/modules/product_details/views/product_details_view.dart';

class ProductList extends StatelessWidget {
  final String category;
  final List<ProductModel> products;

  const ProductList({
    super.key,
    required this.category,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(category, style: AppTextStyle.Bold(fontSize: 20)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8, right: 8),
          child: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black87,
                  size: 16,
                ),
              ),
            ),
          ),
        ),


        actions: [
          IconButton(
            icon: Image.asset("assets/icons/sort.png", width: 18, height: 18),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: GridView.builder(
          itemCount: products.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 28,
            mainAxisSpacing: 10,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProductDetailsView(product: product));
                        },
                        child: Hero(
                          tag: 'product-image-${product.name}',
                          child: Image.asset(product.image, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '₹ ${product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (product.oldPrice != null)
                        Text(
                          '₹ ${product.oldPrice}',
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 11,
                          ),
                        ),
                    ],
                  ),
                  if (product.unit != null)
                    Text(
                      product.unit!,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
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
