import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/app/constants/app_colors.dart';

class Splash extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.brand,
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/emobit_logo.png"),
            Text(
              "Emo Pay",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        )));
  }
}
