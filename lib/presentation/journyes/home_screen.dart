import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/get_it.dart';
import 'package:news_app/presentation/bloc/news_carousel/news_carousel_bloc.dart';
import 'package:news_app/presentation/bloc/news_carousel/news_carousel_event.dart';
import 'package:news_app/presentation/bloc/news_carousel/news_carousel_state.dart';
import 'package:news_app/presentation/journyes/news_carousel/news_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsCarouselBloc newsCarouselBloc;

  @override
  void initState() {
    super.initState();
    newsCarouselBloc = getItInstance<NewsCarouselBloc>();
    newsCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    newsCarouselBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsCarouselBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter News'),
        ),
        body: BlocBuilder<NewsCarouselBloc, NewsCarouselState>(
          builder: (context, state) {
            if (state is NewsCarouselLoaded) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  return NewsCarousel(
                    news: state.news[index],
                  );
                  //return Text(state.news[index].description);
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
