import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String content;
  final String url;
  final String imageUrl;

  NewsEntity({
    this.id,
    this.title,
    this.description,
    this.content,
    this.url,
    this.imageUrl,
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
