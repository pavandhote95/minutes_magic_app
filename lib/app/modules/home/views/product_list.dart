import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          category,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            icon: Image.asset("assets/icons/sort.png", width: 20, height: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8, // reduce horizontal gap
            mainAxisSpacing: 6, // reduce vertical gap
            childAspectRatio: 0.53, // wider cards
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return GestureDetector(
              onTap: () => Get.to(() => ProductDetailsView(product: product)),
              child: Container(
                decoration: BoxDecoration(
                  color: product.backgroundColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'product-image-${product.name}',
                      child: Image.asset(
                        product.image,
                        height: 100, // bigger image
                        width: 100, // match width with height
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          product.name,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 10,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(5, (i) {
                            return Icon(
                              Icons.star,
                              size: 13,
                              color:
                                  i < (product.rating ?? 4).round()
                                      ? Colors.orangeAccent
                                      : Colors.grey.shade300,
                            );
                          }),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '₹ ${product.price}',
                              style: GoogleFonts.poppins(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 5),
                            if (product.oldPrice != null)
                              Text(
                                '₹ ${product.oldPrice}',
                                style: GoogleFonts.poppins(
                                  fontSize: 11.5,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),

                        if (product.unit != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              product.unit!,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
