import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/modules/home/views/cart_page.dart';
import '../controllers/product_details_controller.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool showDetails = true;
    bool showReviews = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StatefulBuilder(
          builder: (context, setState) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button and title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Product Detail",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
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
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            product.image,
                            height: 210,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          for (int i = 0; i < 2; i++) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                product.image,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (i == 0) const SizedBox(height: 10),
                          ],
                        ],
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

                const SizedBox(height: 10),

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
                    const SizedBox(width: 10),
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
                const SizedBox(height: 8),

                // Short description
                Text(
                  "LAKMÉ ABSOLUTE SKIN DEW SERUM FOUNDATION WARM CREME, FULL, ALL SKIN TYPE, 30G : BUY ONLINE AT BEST",
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const CartPage()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffff4d4d),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          "Add To Cart",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          "Place Order",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Product Details Toggle
                GestureDetector(
                  onTap: () => setState(() => showDetails = !showDetails),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("PRODUCT DETAILS",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                      Icon(
                        showDetails
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: 26,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                if (showDetails) ...[
                  productDetailRow("brand", "Bikaji"),
                  productDetailRow("product type", "Food"),
                  productDetailRow("smudge proof", "Yes"),
                  productDetailRow("colour name", "Black"),
                  productDetailRow("transfer proof", "Yes"),
                  const SizedBox(height: 20),
                ],

                // Reviews Toggle
                GestureDetector(
                  onTap: () => setState(() => showReviews = !showReviews),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("REVIEWS",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                      Icon(
                        showReviews
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: 26,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                if (showReviews)
                  Text(
                    "No reviews yet.",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable row for product details
  Widget productDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black54,
              )),
          Text(value,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
