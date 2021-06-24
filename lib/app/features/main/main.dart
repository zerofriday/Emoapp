import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay/app/constants/app_colors.dart';
import 'package:pay/app/constants/config.dart';
import 'package:pay/app/features/main/main.controller.dart';

class Main extends GetView {
  final MainController controller = Get.put(MainController());

  Widget buildAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 12),
                child: Image.asset(
                  "assets/images/emobit_logo.png",
                  width: 42,
                  height: 42,
                ),
              ),
              Text(
                "EmoPay",
                style: TextStyle(
                  color: AppColors.brand,
                  fontWeight: FontWeight.w300,
                  fontSize: 28,
                ),
              )
            ],
          ),
          InkResponse(
            onTap: () => openDrawer(),
            radius: 24,
            containedInkWell: true,
            child: SvgPicture.asset(
              "assets/icons/burger_menu.svg",
              width: 20,
              height: 8,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDrawerItem(Widget icon, String label, String link) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () => {
          // open link
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16),
                    child: icon),
                Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/arrow_right.svg",
                  width: 18,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget drawerItemDivider() {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Divider(height: 1, color: Colors.white.withOpacity(0.08)),
    );
  }

  Widget buildDrawer() {
    return Container(
      color: AppColors.darker,
      width: Get.size.width * 0.60,
      height: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(top: Get.size.height * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    child: Image.asset(
                      "assets/images/emobit_logo.png",
                    ),
                    widthFactor: 0.55,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      "www.emobit.xyz",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 28),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDrawerItem(
                      Image.asset(
                        "assets/icons/bsc.png",
                        width: 35,
                        height: 35,
                      ),
                      "Bsc",
                      BSC_LINK),
                  drawerItemDivider(),
                  buildDrawerItem(
                      SvgPicture.asset(
                        "assets/icons/telegram.svg",
                        width: 35,
                        height: 35,
                      ),
                      "Telegram",
                      TELEGRAM_LINK),
                  drawerItemDivider(),
                  buildDrawerItem(
                      SvgPicture.asset(
                        "assets/icons/twitter.svg",
                        width: 35,
                        height: 35,
                      ),
                      "Twitter",
                      TWITTER_LINK),
                  drawerItemDivider(),
                  buildDrawerItem(
                      SvgPicture.asset(
                        "assets/icons/instagram.svg",
                        width: 35,
                        height: 35,
                      ),
                      "Instagram",
                      INSTAGRAM_LINK),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void openDrawer() {
    controller.scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: AppColors.dark,
      endDrawer: buildDrawer(),
      drawerEdgeDragWidth: 150,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 12),
        child: Column(
          children: [
            buildAppBar(),
            Expanded(
                child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [buildMainContent()]))
          ],
        ),
      )),
    );
  }

  Widget buildMainContent() {
    return Container();
  }
}
