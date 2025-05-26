import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/modules/home/controllers/home_controller.dart';
import 'package:minutes_magic_app/app/modules/home/views/banner_carousel.dart';
import 'package:minutes_magic_app/app/modules/home/views/product_grid_veiw.dart';

class HomeView extends GetView<HomeController> {

  const HomeView({super.key});



  final categories = const [


    {'name': 'Spices', 'icon': 'assets/images/spices.png'},
    {'name': 'Dry Fruits', 'icon': 'assets/images/Dry Fruits.png'},
    {'name': 'Rice', 'icon': 'assets/images/rice.png'},
    {'name': 'Drinks', 'icon': 'assets/images/eggs.png'},
    {'name': 'Eggs', 'icon': 'assets/images/bread.png'},
    {'name': 'Bread', 'icon': 'assets/images/fruits.png'},
    {'name': 'Fruits', 'icon': 'assets/images/drinks.png'},
    {'name': 'Vegetables', 'icon': 'assets/images/vegetable.png'},

  ];


  final homeandkitchen = const [


    {'name': 'Spices', 'icon': 'assets/images/spices.png'},
    {'name': 'Dry Fruits', 'icon': 'assets/images/Dry Fruits.png'},
    {'name': 'Rice', 'icon': 'assets/images/rice.png'},
    {'name': 'Drinks', 'icon': 'assets/images/eggs.png'},
    {'name': 'Eggs', 'icon': 'assets/images/bread.png'},
    {'name': 'Bread', 'icon': 'assets/images/fruits.png'},
    {'name': 'Fruits', 'icon': 'assets/images/drinks.png'},
    {'name': 'Vegetables', 'icon': 'assets/images/vegetable.png'},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: Colors.red),
        title:  Text(
          'Delivered Before You Know It\nP.N - 7 sector-15 , Mansarow...',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
        ),
        actions: [
IconButton(
  icon: Image.asset(
    'assets/icons/person.png', // apni image path yahan dein
    width: 24,
    height: 24,
  ),
  onPressed: () {
    // Action on tap
  },
)

        ],
      ),
      body: SingleChildScrollView(
         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
           BannerCarousel(),
            const SizedBox(height: 16),

            const Text('Top category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            buildCategoryGrid(categories),

            const SizedBox(height: 1),
            const Text('Home & Kitchen Essentials', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            buildCategoryGrid(homeandkitchen),
                    const Text('Producs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),


            SizedBox(
              height: 350,
              width: 400,
              child: ProductGridPage()),
                 const SizedBox(height: 15),
                 const Text('Popular Shop', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
               SizedBox(
              height: 350,
              width: 400,
              child: ProductGridPage()),
                 const SizedBox(height: 15),
                 
    



          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      BottomNavigationBarItem(
  icon: Image.asset(
    'assets/icons/bike.png', // Aapka image path
    width: 24,
    height: 24,
  ),
  label: '',
),

          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget buildCategoryGrid(List<Map<String, String>> list) {

    
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
        return Column(
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
        );
      },
    );
  }
}
