import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/address/bindings/address_binding.dart';
import 'package:minutes_magic_app/app/modules/address/views/address_view.dart';
import 'package:minutes_magic_app/app/modules/delivery/bindings/delivery_binding.dart';
import 'package:minutes_magic_app/app/modules/delivery/views/delivery_view.dart';
import 'package:minutes_magic_app/app/modules/otp/bindings/otp_binding.dart';
import 'package:minutes_magic_app/app/modules/otp/views/otp_view.dart';
import 'package:minutes_magic_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:minutes_magic_app/app/modules/profile/views/profile_view.dart';
import 'package:minutes_magic_app/app/modules/search/bindings/search_binding.dart';
import 'package:minutes_magic_app/app/modules/search/views/search_view.dart';
import 'package:minutes_magic_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:minutes_magic_app/app/modules/splash/start_screen.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/views/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.address,
      page: () => const AddressView(),
      binding: AddressBinding(), // Consider creating an OtpBinding if needed
    ),
    GetPage(
      name: Routes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(), // Consider creating an OtpBinding if needed
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(), // Or SplashBinding if separated
    ),
    GetPage(
      name: Routes.start,
      page: () => const StartView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.delivery,
      page: () => const DeliveryView(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    // Uncomment when ready to use:
    // GetPage(
    //   name: Routes.registration,
    //   page: () => const RegisterView(),
    //   binding: RegisterBinding(),
    // ),
    // GetPage(
    //   name: Routes.rotp,
    //   page: () => const ResendotpView(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.location,
    //   page: () => const LocationView(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.hair,
    //   page: () => const HairView(),
    //   binding: HairBinding(),
    // ),
  ];
}
