import 'package:news_repository/src/data/news_repository.dart';
import 'package:news_repository/src/data/remote/models/mappers/article_domain_mapper.dart';
import 'package:news_repository/src/data/remote/news_api_data_source.dart';
import 'package:news_repository/src/domain/models/article_domain.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({
    required NewsApiDataSource dataSource,
  }) : _dataSource = dataSource;

  final NewsApiDataSource _dataSource;

  @override
  Future<List<ArticleDomain>> getHeadlines() async {
    final news = await _dataSource.getHeadlines();

    return news.articles.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<ArticleDomain>> getEverything({
    required String query,
  }) async {
    final news = await _dataSource.getEverything(query: query);

    return news.articles.map((e) => e.toDomain()).toList();
  }
}
