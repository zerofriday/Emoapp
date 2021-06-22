import 'package:get/get.dart';
import 'package:pay/app/features/main/main.dart';
import 'package:pay/app/features/splash/splash.bindings.dart';
import 'package:pay/app/features/splash/splash.dart';
import 'package:pay/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      binding: SplashBinding(),
      page: () => Splash(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => Main(),
    ),
  ];
}
