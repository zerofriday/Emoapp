import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay/app/constants/app_colors.dart';
import 'package:pay/app/constants/config.dart';
import 'package:pay/app/data/models/NewsItemModel.dart';
import 'package:pay/app/features/main/main.controller.dart';
import 'package:pay/app/utils/utils.dart';

class Main extends GetView {
  final MainController controller = Get.put(MainController());

  Widget buildAppBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 24),
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
        behavior: HitTestBehavior.translucent,
        onTap: () => openLink(link),
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
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => openLink(EMOBIT_WEBSITE),
              child: Flexible(
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

  Widget statusHandle(RxStatus status, Function builder) {
    if (status.isLoading) {
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }
    if (status.isSuccess) {
      return builder();
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "No Internet",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget buildTokenInfoBox() {
    return Obx(
      () => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  colors: [Color(0xff1C7ED9), Color(0xff1664AC)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          padding: EdgeInsets.only(right: 12, left: 12, top: 24, bottom: 24),
          child: statusHandle(
            controller.rxStatus.value,
            () => IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              controller.baseData.value.price,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Holders",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              controller.baseData.value.holders.toString(),
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(4),
                      child: Image.asset("assets/images/token_contract.png"),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget buildNewsItem(NewsItemModel item) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.1)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title + "...",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => openLink(item.link),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 4),
                          child: Text(
                            "Read More",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/arrow_right_simple.svg",
                          width: 8,
                          height: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNewsSection() {
    return Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "Last News",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Obx(
              () => statusHandle(
                controller.rxStatus.value,
                () => Column(
                    children: List.generate(
                        controller.baseData.value.news.length, (index) {
                  NewsItemModel item = controller.baseData.value.news[index];
                  return buildNewsItem(item);
                })),
              ),
            )
          ],
        ));
  }

  Widget buildMainContent() {
    return ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          buildTokenInfoBox(),
          GestureDetector(
            onTap: () => openLink(TELEGRAM_LINK),
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Image.asset("assets/images/telegram_banner.png"),
            ),
          ),
          buildExchangesSection(),
          buildNewsSection()
        ]);
  }

  Widget buildExchangeItem(List<String> data) {
    return GestureDetector(
      onTap: () => openLink(data[1]),
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 6),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Image.asset(
            data[0],
          ),
        ),
      ),
    );
  }

  Widget buildExchangesSection() {
    return Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "Buy Emo",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(EXCHANGES_LIST.length, (index) {
                    return buildExchangeItem(EXCHANGES_LIST[index]);
                  })),
            ),
          ],
        ));
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
          children: [buildAppBar(), Expanded(child: buildMainContent())],
        ),
      )),
    );
  }
}
