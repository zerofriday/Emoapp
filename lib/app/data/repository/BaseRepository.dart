import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pay/app/constants/api_links.dart';
import 'package:pay/app/core/network/api_client.dart';
import 'package:pay/app/data/models/BaseModel.dart';

class BaseRepository {
  late Dio dio;

  BaseRepository() {
    dio = ApiClient().dio;
  }

  Future<BaseModel> getMainDataMock() async {
    dynamic json = JsonDecoder().convert("""{
    "price":"0.000009",
    "holders":400,
    "news":[
        {
            "title":"test first news :D",
            "link":"https://t.me/emobit_official",
            "date":"2021/6/22"
        }
    ]
}""");
    await Future.delayed(Duration(milliseconds: 1500));
    return Future.value(BaseModel.fromJson(json));
  }

  Future<BaseModel> getMainData() async {
    Response res;
    try {
      res = await dio.get(GET_MAIN_DATA);
      if (res.statusCode == 200 && res.data != null) {
        return Future.value(BaseModel.fromJson(res.data));
      }
    } catch (e) {}
    return Future.error(false);
  }
}
