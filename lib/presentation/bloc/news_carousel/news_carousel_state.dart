import 'package:equatable/equatable.dart';

import 'package:news_app/domain/entities/news_entity.dart';

abstract class NewsCarouselState extends Equatable {
  const NewsCarouselState();

  @override
  List<Object> get props => [];
}

class NewsCarouselInitial extends NewsCarouselState {}

class NewsCarouselError extends NewsCarouselState {}

class NewsCarouselLoaded extends NewsCarouselState {
  final List<NewsEntity> news;
  //final int defaultIndex;
  NewsCarouselLoaded({
    this.news,
    //this.defaultIndex,
  });

  @override
  List<Object> get props => [news];
}
