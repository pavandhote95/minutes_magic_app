import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/constants/AppTextStyle.dart';
import 'package:minutes_magic_app/app/constants/text_style.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(category, style: AppTextStyle.Bold(fontSize: 20)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),

        actions: [
          IconButton(
            icon: Image.asset("assets/icons/sort.png", width: 18, height: 18),
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ProductDetailsView());
                        },
                        child: Image.asset(
                          product.image,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  Text(
                    product.name,
                    style: KTextStyle.poppins(
                      fs: 12,
                      c: Colors.black,
                      fw: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  Text(product.desc, style: AppTextStyle.hint(fontSize: 13)),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price.toString(),
                        style: KTextStyle.poppins(
                          fs: 12,
                          c: Colors.black,
                          fw: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF227D25),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {
                            ProductDetailsView();
                            Fluttertoast.showToast(
                              msg: "Product added to cart",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: const Color(0xFF227D25),
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                          icon: const Icon(Icons.add, color: Colors.white),
                          iconSize: 20,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
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
