import 'package:flutter/material.dart';
import 'package:minutes_magic_app/app/customfaction/category_widget.dart';

class AllcategoryView extends StatelessWidget {
  const AllcategoryView({super.key});

  @override
  Widget build(BuildContext context) {




    final
    categories = const

    [
      {'name': 'Spices', 'icon': 'assets/images/spices.png'},

      {'name': 'Dry Fruits', 'icon': 'assets/images/Dry Fruits.png'},
      {'name': 'Rice', 'icon': 'assets/images/rice.png'},
      {'name': 'Drinks', 'icon': 'assets/images/drinks.png'},
      {'name': 'Eggs', 'icon': 'assets/images/eggs.png'},
      {'name': 'Bread', 'icon': 'assets/images/bread.png'},
      {'name': 'Fruits', 'icon': 'assets/images/fruits.png'},
      {'name': 'Vegetables', 'icon': 'assets/images/vegetable.png'},

      {'name': 'Vegetables', 'icon': 'assets/images/vegetable.png'},
    ];

    final homeandkitchen = const [

      {'name': 'Spices', 'icon': 'assets/images/spices.png'},
      {'name': 'Dry Fruits', 'icon': 'assets/images/Dry Fruits.png'},
      {'name': 'Rice', 'icon': 'assets/images/rice.png'},
      {'name': 'Drinks', 'icon': 'assets/images/drinks.png'},
      {'name': 'Eggs', 'icon': 'assets/images/eggs.png'},
      {'name': 'Bread', 'icon': 'assets/images/bread.png'},
      {'name': 'Fruits', 'icon': 'assets/images/fruits.png'},
      {'name': 'Vegetables', 'icon': 'assets/images/vegetable.png'},
      {'name': 'Vegetables', 'icon': 'assets/images/vegetable.png'},

    ];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("All category"),

        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column
            (


            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryGrid.buildCategoryGrid(categories),


              const SizedBox(height: 1),
              const Text(

                'Home & Kitchen Essentials',

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),


              ),
              const SizedBox(height: 15),
              CategoryGrid.buildCategoryGrid(homeandkitchen),

              const SizedBox(height: 15),
            ],
          ),

        ),
      ),
    );
  }
}
