import 'package:news_repository/src/domain/models/article_domain.dart';

abstract interface class NewsRepository {
  const NewsRepository._();

  Future<List<ArticleDomain>> getHeadlines();

  Future<List<ArticleDomain>> getEverything({required String query});
}
