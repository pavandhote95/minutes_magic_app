import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  // Rename to match the usage in the widget
  final TextEditingController searchController = TextEditingController();

  var recentSearches =
      <String>[
        "Search item 1",
        "Search item 2",
        "Search item 3",
        "Search item 4",
        "Search item 5",
      ].obs;

  void clearSearch() {
    searchController.clear();
  }

  void searchItemTapped(String item) {
    // Implement search logic here
    print("Tapped on: $item");
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
