import 'package:news_app/domain/entities/news_entity.dart';

class Article extends NewsEntity {
  final Map<String, dynamic> source;
  final int id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    this.source,
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }) : super(
          id: id,
          title: title,
          content: content,
          description: description,
          url: url,
          imageUrl: urlToImage,
        );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
