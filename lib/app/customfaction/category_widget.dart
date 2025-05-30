import 'package:flutter/material.dart';

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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final item = list[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 100,

                child: Image.asset(item['icon']!, fit: BoxFit.contain),
              ),
              const SizedBox(height: 12),
              Text(
                item['name'] ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
