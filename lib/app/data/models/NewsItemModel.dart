class NewsItemModel {
  String title;
  String link;
  String date;

  NewsItemModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        link = json['link'],
        date = json['date'];
}
