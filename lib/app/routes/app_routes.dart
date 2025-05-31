part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const registration = _Paths.registration;
  static const login = _Paths.login;
  static const splash = _Paths.splash;
  static const otp = _Paths.otp;
  static const rotp = _Paths.rotp;
  static const location = _Paths.location;
  static const start = _Paths.start;
  static const search = _Paths.search;
  static const profile = _Paths.profile;
  static const address = _Paths.address;
  static const delivery = _Paths.delivery;
  static const PRODUCT_DETAILS = _Paths.PRODUCT_DETAILS;
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const login = '/login';
  static const splash = '/splash';
  static const otp = '/otp';
  static const rotp = '/rotp';
  static const location = '/location';
  static const start = '/start';
  static const registration = '/registration';
  static const search = '/search';
  static const profile = '/profile';
  static const address = '/address';
  static const delivery = '/delivery';
  static const PRODUCT_DETAILS = '/product-details';
}
