import 'package:flutter/material.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';

class ProductListView extends StatelessWidget {
  final String category;
  final List<ProductModel> products;

  const ProductListView({
    super.key,
    required this.category,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Products'),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2,
            child: ListTile(
              leading: Image.asset(product.image, width: 50),
              title: Text(product.name),
              subtitle: Text('₹${product.price.toStringAsFixed(2)}'),
            ),
          );
        },
      ),
    );
  }
}
