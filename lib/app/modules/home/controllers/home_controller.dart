import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var currentBannerIndex = 0.obs;
  

  final listItems = [
    {'image': 'assets/images/banner1.png', 'title': 'April Special'},
    {'image': 'assets/images/banner2.png', 'title': 'A-Z Nutrition'},
    {'image': 'assets/images/banner3.png', 'title': 'Baby Essentials'},

  ];

  RxList<String> bannerImages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBannerImages();  // Fetch banner images when the controller is initialized
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }
final List<Map<String, String>> items = [
  {'image': 'assets/images/doctor.jpg', 'label': 'Steps Counter'},
  {'image': 'assets/images/doctor.jpg', 'label': 'Calorie Counter'},
  {'image': 'assets/images/abitab.jpg', 'label': 'Track Sungar'},
  {'image': 'assets/images/doctor.jpg', 'label': 'Know Your Food'},
];

  // Function to simulate loading banner images
  void fetchBannerImages() {
    // Simulate network delay and load images
    Future.delayed(const Duration(seconds: 2), () {
      bannerImages.value = [
         'assets/images/banner1.png',
       'assets/images/banner2.png',
        'assets/images/banner3.png'
      
      ];

    });
  }
}
