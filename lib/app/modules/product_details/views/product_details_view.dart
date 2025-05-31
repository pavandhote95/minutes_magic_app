import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/modules/home/views/cart_page.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [const Icon(Icons.arrow_back)]),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/spicedetail.png',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: List.generate(2, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/spices.png',
                              height: 80,
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
              Text(
                "SPICEY NAMKEEN",
                style: GoogleFonts.aboreto(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text("MRP :\$ 30", style: TextStyle(fontSize: 16)),
                  SizedBox(width: 10),
                  Text(
                    "40% OFF",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "LAKMÉ ABSOLUTE SKIN DEW SERUM FOUNDATION WARM CREME, FULL, ALL SKIN TYPE, 30G : BUY ONLINE AT BEST",
                style: GoogleFonts.aboreto(color: Colors.black, fontSize: 14),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(CartPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Add To Cart",
                        style: GoogleFonts.alata(
                          color: Colors.white,
                          fontSize: 14,
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
                      ),
                      child: Text(
                        "Place Order",
                        style: GoogleFonts.albertSans(
                          color: Colors.redAccent,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ExpansionTile(
                title: Text(
                  "PRODUCT DETAILS",
                  style: GoogleFonts.aboreto(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                initiallyExpanded: true,
                children: const [
                  DetailRow(label: "brand", value: "Bikaji"),
                  DetailRow(label: "product type", value: "Food"),
                  DetailRow(label: "smudge proof", value: "Yes"),
                  DetailRow(label: "colour name", value: "Black"),
                  DetailRow(label: "transfer proof", value: "Yes"),
                ],
              ),
              ExpansionTile(
                title: const Text("REVIEWS"),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("No reviews yet."),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.akatab(color: Colors.black, fontSize: 14),
          ),
          Text(value),
        ],
      ),
    );
  }
}
