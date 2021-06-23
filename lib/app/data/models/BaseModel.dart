import 'package:pay/app/data/models/NewsItemModel.dart';

class BaseModel {
  String price = "";
  int holders = 0;
  List<NewsItemModel> news = [];

  BaseModel();

  BaseModel.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        holders = json['holders'],
        news = List<NewsItemModel>.from(json["news"].map((item) => NewsItemModel.fromJson(item)).toList());
}
