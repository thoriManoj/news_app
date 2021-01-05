import 'package:news_app/core/api_client.dart';
import 'package:news_app/data/model/articles.dart';
import 'package:news_app/data/model/news_result_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<Article>> getTopHeadlines();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  ApiClient _client;

  NewsRemoteDataSourceImpl(this._client);

  @override
  Future<List<Article>> getTopHeadlines() async {
    final response = await _client.get();
    final news = NewsResultModel.fromJson(response).articles;
    //print(news);
    return news;
  }
}
