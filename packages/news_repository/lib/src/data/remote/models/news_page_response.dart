import 'package:json_annotation/json_annotation.dart';

part 'news_page_response.g.dart';

@JsonSerializable()
class NewsPageResponse {
  const NewsPageResponse({
    required this.articles,
  });

  factory NewsPageResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsPageResponseFromJson(json);

  final List<ArticleResponse> articles;
}

@JsonSerializable()
class ArticleResponse {
  const ArticleResponse({
    required this.title,
    required this.description,
    required this.source,
    required this.url,
    required this.imageUrl,
    required this.content,
    required this.dateTime,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'source')
  final ArticleSourceResponse source;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'urlToImage')
  final String? imageUrl;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'publishedAt')
  final DateTime dateTime;
}

@JsonSerializable()
class ArticleSourceResponse {
  const ArticleSourceResponse({
    required this.name,
  });

  factory ArticleSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceResponseFromJson(json);

  @JsonKey(name: 'name')
  final String name;
}
