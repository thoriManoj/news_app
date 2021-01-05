import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/news_entity.dart';
import 'package:news_app/domain/entities/no_params.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/usecases/usecases.dart';

class GetTopHeadlines extends UseCases<List<NewsEntity>, NoParams> {
  NewsRepository newsRepository;

  GetTopHeadlines(this.newsRepository);

  Future<Either<AppError, List<NewsEntity>>> call(NoParams noParams) async {
    return newsRepository.getTopHeadlines();
  }
}
