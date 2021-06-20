import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/app/core/theme/app_theme.dart';
import 'package:pay/app/features/splash/splash.bindings.dart';
import 'package:pay/app/features/splash/splash.dart';
import 'package:pay/app/routes/app_pages.dart';
import 'package:pay/app/routes/app_routes.dart';

import 'app/translations/app_translations.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: SplashBinding(),
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    home: Splash(),
    locale: Locale('en', 'US'),
    translationsKeys: AppTranslation.translations,
  ));
}
