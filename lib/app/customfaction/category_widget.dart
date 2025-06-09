import 'package:flutter/material.dart';

import '../modules/allcategory/model/product_data.dart';
import '../modules/allcategory/model/product_model.dart';
import '../modules/home/views/product_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  final List<Map<String, String>> categories = const [
    {'icon': 'assets/icons/doctor.png', 'name': 'Doctor'},
    {'icon': 'assets/icons/food.png', 'name': 'Food'},
    {'icon': 'assets/icons/gym.png', 'name': 'Fitness'},
    {'icon': 'assets/icons/pet.png', 'name': 'Pet Care'},
    {'icon': 'assets/icons/cleaning.png', 'name': 'Cleaning'},
    {'icon': 'assets/icons/repair.png', 'name': 'Repair'},
    {'icon': 'assets/icons/beauty.png', 'name': 'Beauty'},
    {'icon': 'assets/icons/plumber.png', 'name': 'Plumber'},
    {'icon': 'assets/icons/tech.png', 'name': 'IT Support'},
    {'icon': 'assets/icons/tech.png', 'name': 'IT Support'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          const SizedBox(height: 16),
          CategoryGrid.buildCategoryGrid(categories),
        ],
      ),
    );
  }
}

class CategoryGrid {
  static Widget buildCategoryGrid(List<Map<String, String>> list) {
    return GridView.builder(
      itemCount: list.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final item = list[index];
        final categoryName = item['name']!;

        // Pick correct product list based on category
        List<ProductModel> selectedProducts = [];
        switch (categoryName) {
          case 'Rice':
            selectedProducts = riceProducts;
            break;
          case 'Drinks':
            selectedProducts = drinkProducts;
            break;
          case 'Eggs':
            selectedProducts = eggProducts;
            break;
          case 'Bread':
            selectedProducts = breadProducts;
            break;
          case 'Fruits':
            selectedProducts = fruitProducts;
            break;
          case 'Vegetables':
            selectedProducts = vegetableProducts;
            break;
          case 'Spices':
            selectedProducts = spiceProducts;
            break;
          case 'Dry Fruits':
            selectedProducts = dryfruitProducts;
            break;
          default:
            selectedProducts = [];
        }

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => ProductList(
                      category: categoryName,
                      products: selectedProducts,
                    ),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(item['icon']!),
              ),
              const SizedBox(height: 8),
              Text(item['name']!, style: const TextStyle(fontSize: 12)),
            ],
          ),
        );
      },
    );
  }
}
