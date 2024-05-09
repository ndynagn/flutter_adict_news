import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_repository/src/data/remote/models/models.dart';

enum _Endpoints {
  everything('everything'),
  headlines('top-headlines');

  const _Endpoints(this.endpoint);

  final String endpoint;
}

class NewsApiDataSource {
  NewsApiDataSource({
    required Dio dio,
    required String apiKey,
    required String localeCode,
  })  : _dio = dio,
        _apiKey = apiKey,
        _localeCode = localeCode;

  final Dio _dio;
  final String _apiKey;
  final String _localeCode;

  Future<NewsPageResponse> getHeadlines() async {
    try {
      final response = await _dio.get(
        _Endpoints.headlines.endpoint,
        queryParameters: {
          'apiKey': _apiKey,
          'country': _localeCode,
        },
      );

      final news = NewsPageResponse.fromJson(response.data);

      return news;
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.notFound) {
        return Future.error('Nothing was found for your queries');
      }

      if (e.response?.statusCode == HttpStatus.badRequest) {
        return Future.error('The request was sent incorrectly');
      }

      if (e.response?.statusCode == HttpStatus.internalServerError) {
        return Future.error('An error has occurred on the server');
      }

      if (e.response?.statusCode == HttpStatus.forbidden) {
        return Future.error('You were denied access');
      }

      return Future.error(e);
    }
  }

  Future<NewsPageResponse> getEverything({
    required String query,
  }) async {
    try {
      final response = await _dio.get(
        _Endpoints.everything.endpoint,
        queryParameters: {
          'apiKey': _apiKey,
          'q': query,
        },
      );

      if (response.statusCode == HttpStatus.notFound) {
        return Future.error('Nothing was found for your queries');
      }

      if (response.statusCode == HttpStatus.badRequest) {
        return Future.error('The request was sent incorrectly');
      }

      if (response.statusCode == HttpStatus.internalServerError) {
        return Future.error('An error has occurred on the server');
      }

      if (response.statusCode == HttpStatus.forbidden) {
        return Future.error('You were denied access');
      }

      final news = NewsPageResponse.fromJson(response.data);

      return news;
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.notFound) {
        return Future.error('Nothing was found for your queries');
      }

      if (e.response?.statusCode == HttpStatus.badRequest) {
        return Future.error('The request was sent incorrectly');
      }

      if (e.response?.statusCode == HttpStatus.internalServerError) {
        return Future.error('An error has occurred on the server');
      }

      if (e.response?.statusCode == HttpStatus.forbidden) {
        return Future.error('You were denied access');
      }

      return Future.error(e);
    }
  }
}
