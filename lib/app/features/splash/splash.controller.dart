import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pay/app/routes/app_routes.dart';

class SplashController extends GetxController{
@override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2),(){
      Get.offNamed(Routes.MAIN);
    });
  }
}