import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_data.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';
import 'package:minutes_magic_app/app/modules/allcategory/views/allcategory_view.dart';
import 'package:minutes_magic_app/app/modules/cart/views/cart_view.dart';
import 'package:minutes_magic_app/app/modules/delivery/views/delivery_view.dart';
import 'package:minutes_magic_app/app/modules/home/controllers/home_controller.dart';
import 'package:minutes_magic_app/app/modules/home/views/banner_carousel.dart';
import 'package:minutes_magic_app/app/modules/home/views/popular_shop_grid.dart';
import 'package:minutes_magic_app/app/modules/home/views/product_grid_veiw.dart';
import 'package:minutes_magic_app/app/modules/home/views/product_list.dart';
import 'package:minutes_magic_app/app/modules/profile/views/profile_view.dart';
import 'package:minutes_magic_app/app/modules/search/views/search_view.dart';

import '../../address/controllers/address_controller.dart';

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
    CartView(),
    ProfileView(),
  ];
  @override
  void initState() {
    super.initState();
    Get.put(AddressController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 0 ? _buildHomeAppBar() : null,
      body: KeyedSubtree(
        key: ValueKey(_selectedIndex),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildHomeAppBar() {
    final AddressController controller = Get.find<AddressController>();

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(Icons.location_on, color: Colors.red),
      title: Obx(
            () => Text(
          'Delivered Before You Know It\n${controller.selectedAddress.value
          }',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
        ),
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/icons/person.png', width: 24, height: 24),
          onPressed: () {
            Get.toNamed("/profile");
          },
        ),
      ],
    );
  }
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
        onTap: (index) => setState(() => _selectedIndex = index),
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

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  final categories = const [
    {'name': 'Spices', 'icon': 'assets/images/spices.png'},
    {'name': 'Dry Fruits', 'icon': 'assets/images/Dry Fruits.png'},
    {'name': 'Rice', 'icon': 'assets/images/rice.png'},
    {'name': 'Drinks', 'icon': 'assets/images/drinks.png'},
    {'name': 'Eggs', 'icon': 'assets/images/eggs.png'},
    {'name': 'Bread', 'icon': 'assets/images/bread.png'},
    {'name': 'Fruits', 'icon': 'assets/images/fruits.png'},
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
  ];

  final List<Shop> Shops = const [
    Shop(name: "Minutes Magic", image: "assets/images/shop1.png"),
    Shop(name: "Fresh Product", image: "assets/images/shop2.png"),
    Shop(name: "D-Mart", image: "assets/images/shop3.png"),
    Shop(name: "Smart Bazar", image: "assets/images/shop4.png"),
    Shop(name: "V Mart", image: "assets/images/shop5.png"),
    Shop(name: "Big Basket", image: "assets/images/shop6.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannerCarousel(),
          const SizedBox(height: 8),
          const Text(
            'Shops',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.height * 1.5
                    : MediaQuery.of(context).size.height < 668
                    ? MediaQuery.of(context).size.height * 0.48
                    : MediaQuery.of(context).size.height * 0.40,
            child: const PopularShop(),
          ),

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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          buildCategoryGrid(categories),
          const SizedBox(height: 10),
          const Text(
            'Home & Kitchen Essentials',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          buildCategoryGrid(homeandkitchen),

          const Text(
            'Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.height * 1.2
                    : kIsWeb
                    ? MediaQuery.of(context).size.height < 700
                        ? MediaQuery.of(context).size.height * 0.40
                        : MediaQuery.of(context).size.height * 0.55
                    : Platform.isAndroid
                    ? MediaQuery.of(context).size.height < 668
                        ? MediaQuery.of(context).size.height * 0.38
                        : MediaQuery.of(context).size.height * 0.50
                    : MediaQuery.of(context).size.height < 668
                    ? MediaQuery.of(context).size.height * 0.35
                    : MediaQuery.of(context).size.height * 0.48,
            child: const ProductGridPage(),
          ),
        ],
      ),
    );
  }

  static Widget buildCategoryGrid(List<Map<String, String>> list) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final crossAxisCount = 4;
        final spacing = 12.0;
        final itemWidth =
            (screenWidth - ((crossAxisCount - 1) * spacing)) / crossAxisCount;
        final itemHeight = itemWidth / 0.8;

        return GridView.builder(
          itemCount: list.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 8,
            crossAxisSpacing: spacing,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemBuilder: (context, index) {
            final item = list[index];
            final categoryName = item['name']!;
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
      },
    );
  }
}
