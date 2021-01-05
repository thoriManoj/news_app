import 'package:news_app/data/model/articles.dart';

class NewsResultModel {
  List<Article> articles;

  NewsResultModel({
    this.articles,
  });

  NewsResultModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      // ignore: deprecated_member_use
      articles = List<Article>();
      json['articles'].forEach((v) {
        articles.add(Article.fromJson(v));
      });
    }
  }
}
