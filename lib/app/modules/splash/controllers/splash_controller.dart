import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 0));

    final prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('seen_stylish') ?? false;

    if (!hasSeenOnboarding) {
      print("stylish");
      await prefs.setBool('seen_stylish', true);
      Get.offAllNamed('/start'); // Show StylishPage only once
    } else {
      print("login");
      Get.offAllNamed('/start'); // Go directly to home
    }
  }
}
