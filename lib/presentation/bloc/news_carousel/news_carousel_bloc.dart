import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/entities/no_params.dart';
import 'package:news_app/domain/usecases/get_top_headline.dart';
import 'package:news_app/presentation/bloc/news_carousel/news_carousel_event.dart';
import 'package:news_app/presentation/bloc/news_carousel/news_carousel_state.dart';

class NewsCarouselBloc extends Bloc<NewsCarouselEvent, NewsCarouselState> {
  final GetTopHeadlines getTopHeadlines;

  NewsCarouselBloc({@required this.getTopHeadlines})
      : super(NewsCarouselInitial());

  @override
  Stream<NewsCarouselState> mapEventToState(NewsCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      final newsEither = await getTopHeadlines(NoParams());

      yield newsEither.fold((l) => NewsCarouselError(), (news) {
        return NewsCarouselLoaded(
          news: news,
        );
      });
    }
  }
}
