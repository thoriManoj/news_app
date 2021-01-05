import 'package:dartz/dartz.dart';
import 'package:news_app/data/datasource/news_remote_datasource.dart';
import 'package:news_app/data/model/articles.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/repository/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource);

  @override
  Future<Either<AppError,List<Article>>> getTopHeadlines() async {
    try {
      final news = await newsRemoteDataSource.getTopHeadlines();
      return Right(news);
    } on Exception {
      return Left(
        AppError('Something went wrong!'),
      );
    }
  }
}
