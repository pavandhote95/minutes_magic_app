import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/otp/views/otp_view.dart';
import 'package:minutes_magic_app/app/modules/start_screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    

    //  GetPage(
    //   name: _Paths.HAIR,
    //   page: () =>  HairView(),
    //   binding: HairBinding(),
    // ),
    //        GetPage(
    //   name: _Paths.ROTP,
    //   page: () => const ResendotpView(),
    //   binding: HomeBinding(),
    // ),
    
       GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: HomeBinding(),

    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.REGISTRATION,
    //   page: () => const RegisterView(),
    //   binding: RegisterBinding(),
    // ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () =>  SplashView(),
      binding: HomeBinding(),
      
       // This must be included
    ),
    // GetPage(
    //   name: _Paths.LOCATION,
    //   page: () =>  LocationView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.STYLISH,
      page: () => const StartView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.ROTP,
    //   page: () => const ResendotpView(),
    //   binding: HomeBinding(),
    // ),

  ];
}
