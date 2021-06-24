import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/app/data/models/BaseModel.dart';
import 'package:pay/app/data/repository/BaseRepository.dart';


class MainController extends GetxController {
  BaseRepository baseRepo = new BaseRepository();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var baseData = new BaseModel().obs;
  var isLoadingData = false.obs;

  @override
  void onReady() {
    super.onReady();
    loadBaseData();
  }

  void loadBaseData() {
    isLoadingData.value = true;
    baseRepo.getMainDataMock().then((res) {
      baseData.value = res;
      isLoadingData.value = false;
    }).catchError((_error) {
      isLoadingData.value = false;
    });
  }
}
