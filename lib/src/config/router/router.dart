import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/features/article_details/view/article_details_screen.dart';
import 'package:flutter_adict_news/src/features/main/view/main_wrapper_screen.dart';
import 'package:flutter_adict_news/src/features/news/view/news_screen.dart';
import 'package:flutter_adict_news/src/features/search/view/search_screen.dart';
import 'package:news_repository/news_repository.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainWrapperRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: NewsTab.page,
              path: 'news',
              initial: true,
              children: [
                AutoRoute(
                  page: NewsRoute.page,
                  path: '',
                ),
              ],
            ),
            AutoRoute(
              page: SearchTab.page,
              path: 'search',
              children: [
                AutoRoute(
                  page: SearchRoute.page,
                  path: '',
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          page: ArticleDetailsRoute.page,
          path: '/articleDetails',
        ),
      ];
}

@RoutePage(name: 'NewsTab')
class NewsTabPage extends AutoRouter {
  const NewsTabPage({super.key});
}

@RoutePage(name: 'SearchTab')
class SearchTabPage extends AutoRouter {
  const SearchTabPage({super.key});
}
