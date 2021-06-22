import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/app/features/main/main.controller.dart';

class Main extends GetView {
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("home"),
        ),
      ),
    );
  }
}
