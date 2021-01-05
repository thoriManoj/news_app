import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:news_app/core/api_client.dart';
import 'package:news_app/data/datasource/news_remote_datasource.dart';
import 'package:news_app/data/repository/news_repository_impl.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/usecases/get_top_headline.dart';
import 'package:news_app/presentation/bloc/news_carousel/news_carousel_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTopHeadlines>(
      () => GetTopHeadlines(getItInstance()));

  getItInstance.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(
      () => NewsCarouselBloc(getTopHeadlines: getItInstance()));
}
