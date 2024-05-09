import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:news_repository/news_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  GetIt.I
    ..registerLazySingleton<Dio>(
          () => Dio(
        BaseOptions(
          baseUrl: dotenv.env['API_BASE_URL']!,
        ),
      ),
    )
    ..registerLazySingleton(
          () => NewsApiDataSource(
        dio: GetIt.I.get<Dio>(),
        apiKey: 'fcff0d57be814fbfadbe86b7cb54b1b1',
        localeCode: 'us',
      ),
    )
    ..registerLazySingleton<String>(
          () => dotenv.env['API_KEY']!,
      instanceName: 'apiKey',
    );

  runApp(const App());
}
