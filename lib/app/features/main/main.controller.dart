import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/app/data/models/BaseModel.dart';
import 'package:pay/app/data/repository/BaseRepository.dart';


class MainController extends GetxController {
  BaseRepository baseRepo = new BaseRepository();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var baseData = new BaseModel().obs;
  var rxStatus = RxStatus.empty().obs;

  @override
  void onReady() {
    super.onReady();
    loadBaseData();
  }

  void loadBaseData() {
    rxStatus.value=RxStatus.loading();
    baseRepo.getMainDataMock().then((res) {
      baseData.value = res;
      rxStatus.value=RxStatus.success();
    }).catchError((_error) {
      rxStatus.value=RxStatus.error();
    });
  }
}
