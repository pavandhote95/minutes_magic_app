import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_data.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';
import 'package:minutes_magic_app/app/modules/allcategory/views/allcategory_view.dart';
import 'package:minutes_magic_app/app/modules/delivery/views/delivery_view.dart';
import 'package:minutes_magic_app/app/modules/home/controllers/home_controller.dart';
import 'package:minutes_magic_app/app/modules/home/views/banner_carousel.dart';
import 'package:minutes_magic_app/app/modules/home/views/cart_page.dart';
import 'package:minutes_magic_app/app/modules/home/views/product_grid_veiw.dart';
import 'package:minutes_magic_app/app/modules/home/views/product_list.dart';
import 'package:minutes_magic_app/app/modules/profile/views/profile_view.dart';
import 'package:minutes_magic_app/app/modules/search/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(HomeController());
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePageContent(),

    DeliveryView(),
    SearchView(),
    CartPage(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 0 ? _buildHomeAppBar() : null,

      // 🔥 1. Wrap your page in AnimatedSwitcher
      body: KeyedSubtree(
        key: ValueKey(_selectedIndex),
        child: _pages[_selectedIndex],
      ),

      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildHomeAppBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: const Icon(Icons.location_on, color: Colors.red),
    title: Text(
      'Delivered Before You Know It\nP.N - 7 sector-15 , Mansarow...',
      style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
    ),
    actions: [
      IconButton(
        icon: Image.asset('assets/icons/person.png', width: 24, height: 24),
        onPressed: () {},
      ),
    ],
  );
  Widget _buildBottomNavBar() {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap:
            (index) =>
                setState(() => _selectedIndex = index), // 🔔 triggers animation
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? Colors.red : Colors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/icons/bike.png',
                width: 24,
                height: 24,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

// Moved home screen UI into a separate widget to keep code clean
class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannerCarousel(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(AllcategoryView());
                },
                child: const Text(
                  'View All',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          buildCategoryGrid(categories),

          const SizedBox(height: 1),
          const Text(
            'Home & Kitchen Essentials',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          buildCategoryGrid(homeandkitchen),

          const SizedBox(height: 15),
          const Text(
            'Producs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 350, width: 400, child: ProductGridPage()),

          const SizedBox(height: 15),
          const Text(
            'Popular Shop',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          SizedBox(height: 350, width: 400, child: ProductGridPage()),
        ],
      ),
    );
  }

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
