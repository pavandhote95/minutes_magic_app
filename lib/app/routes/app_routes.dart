part of 'app_pages.dart';

abstract class Routes {

  Routes._();
  static const HOME = _Paths.HOME;
  static const REGISTRATION = _Paths.REGISTRATION;
  static const LOGIN = _Paths.LOGIN;
  static const SPLASH = _Paths.SPLASH;
  static const OTP= _Paths.OTP;
  static const ROTP= _Paths.ROTP;
  static const LOCATION = _Paths.LOCATION;
  static const STYLISH = _Paths.STYLISH;
  static const HAIR= _Paths.HAIR;

}


abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const SPLASH = '/splash';
  static const OTP = '/otp';
  static const ROTP = '/rotp';
  static const LOCATION = '/location';
  static const STYLISH = '/stylish';
  static const REGISTRATION = '/registration';
  static const HAIR = '/hair';
}
