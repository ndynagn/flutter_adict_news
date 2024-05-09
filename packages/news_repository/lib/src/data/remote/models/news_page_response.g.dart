// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsPageResponse _$NewsPageResponseFromJson(Map<String, dynamic> json) =>
    NewsPageResponse(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) =>
    ArticleResponse(
      title: json['title'] as String,
      description: json['description'] as String?,
      source: ArticleSourceResponse.fromJson(
          json['source'] as Map<String, dynamic>),
      url: json['url'] as String,
      imageUrl: json['urlToImage'] as String?,
      content: json['content'] as String?,
      dateTime: DateTime.parse(json['publishedAt'] as String),
    );

ArticleSourceResponse _$ArticleSourceResponseFromJson(
        Map<String, dynamic> json) =>
    ArticleSourceResponse(
      name: json['name'] as String,
    );
