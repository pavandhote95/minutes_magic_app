import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:minutes_magic_app/app/modules/cart/views/cart_view.dart';
import '../../../customfaction/snac_bar.dart';
import '../controllers/product_details_controller.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool showDetails = true;
    bool showReviews = false;
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
     leading:    const BackButton(color: Colors.black),
    centerTitle: true,
       title:  Text(
           "Product Detail",
           style: GoogleFonts.poppins(
             fontSize: 18,
             fontWeight: FontWeight.w600,
             color: Colors.black87,
           ),
        ),
      ) ,

      backgroundColor: Colors.white,
      body: SafeArea(
        child: StatefulBuilder(
          builder:
              (context, setState) => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button and title

                    const SizedBox(height: 20),

                    // Product images
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Hero(
                            tag: 'product-image-${product.name}',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                product.image,
                                height: 220,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: List.generate(2, (i) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: i == 0 ? 10 : 0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    product.image,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Product name
                    Text(
                      product.name.toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Price and discount
                    Row(
                      children: [
                        Text(
                          "MRP: ₹${product.oldPrice ?? product.price}",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (product.oldPrice != null)
                          Text(
                            "${((1 - product.price / product.oldPrice!) * 100).round()}% OFF",
                            style: GoogleFonts.poppins(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Short description
                    Text(
                      "LAKMÉ ABSOLUTE SKIN DEW SERUM FOUNDATION WARM CREME, FULL, ALL SKIN TYPE, 30G : BUY ONLINE AT BEST",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              cartController.addToCart(product);
                              Utils.showToast("Product Added Successfully");


                              Get.to(() => const CartView());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffff4d4d),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              "Add To Cart",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              cartController.addToCart(product);
                              Get.to(() => const CartView());
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              "Place Order",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // PRODUCT DETAILS toggle
                    _toggleSection(
                      title: "PRODUCT DETAILS",
                      isExpanded: showDetails,
                      onTap: () => setState(() => showDetails = !showDetails),
                    ),
                    if (showDetails) ...[
                      const SizedBox(height: 10),
                      _productDetailRow("Brand", "Bikaji"),
                      _productDetailRow("Product Type", "Food"),
                      _productDetailRow("Smudge Proof", "Yes"),
                      _productDetailRow("Colour Name", "Black"),
                      _productDetailRow("Transfer Proof", "Yes"),
                    ],
                    const SizedBox(height: 20),

                    // REVIEWS toggle
                    _toggleSection(
                      title: "REVIEWS",
                      isExpanded: showReviews,
                      onTap: () => setState(() => showReviews = !showReviews),
                    ),
                    if (showReviews) ...[
                      const SizedBox(height: 10),
                      Text(
                        "No reviews yet.",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
        ),
      ),
    );
  }

  Widget _toggleSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 26,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  Widget _productDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 13, color: Colors.black54),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
