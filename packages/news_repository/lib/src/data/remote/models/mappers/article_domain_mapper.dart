import 'package:news_repository/news_repository.dart';

extension ArticleDomainMapper on ArticleResponse {
  ArticleDomain toDomain() {
    return ArticleDomain(
      title: title,
      description: description,
      source: source.name,
      url: url,
      imageUrl: imageUrl,
      content: content,
      dateTime: dateTime,
    );
  }
}
