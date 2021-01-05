import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/domain/entities/news_entity.dart';
import 'package:news_app/presentation/bloc/news_carousel/news_carousel_bloc.dart';
import 'package:news_app/presentation/bloc/news_carousel/news_carousel_state.dart';

class NewsCarousel extends StatelessWidget {
  final NewsEntity news;
  const NewsCarousel({
    Key key,
    this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCarouselBloc, NewsCarouselState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(imageUrl: news.imageUrl),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    news.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    news.content ?? '',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.8,
                        wordSpacing: 1),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
