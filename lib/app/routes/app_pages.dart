import 'package:get/get.dart';
import 'package:pay/app/features/splash/splash.dart';
import 'package:pay/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => Splash(),
    ),
  ];
}
