import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/common/widgets/article_card.dart';
import 'package:flutter_adict_news/src/common/widgets/custom_app_bar.dart';
import 'package:flutter_adict_news/src/config/router/router.dart';
import 'package:flutter_adict_news/src/extensions/context_extensions.dart';
import 'package:flutter_adict_news/src/extensions/widget_extensions.dart';
import 'package:flutter_adict_news/src/features/news/bloc/news_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';

@RoutePage()
class NewsScreen extends StatefulWidget implements AutoRouteWrapper {
  const NewsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(
        newsRepository: context.read<NewsRepository>(),
      ),
      child: this,
    );
  }

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late final StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription;
  bool _isInternetAvailable = true;

  @override
  void initState() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (result) {
        setState(() {
          _isInternetAvailable = !result.contains(ConnectivityResult.none);
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          final completer = Completer();

          context.read<NewsBloc>().add(
                LoadNewsEvent(completer: completer),
              );

          return completer.future;
        },
        child: CustomScrollView(
          slivers: [
            CustomAppBar(title: context.tr.mainNewsTabName),
            BlocBuilder(
              bloc: context.read<NewsBloc>()
                ..add(
                  const LoadNewsEvent(completer: null),
                ),
              builder: (context, state) {
                if (!_isInternetAvailable) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(context.tr.unavailableInternet),
                    ),
                  );
                }

                if (state is NewsErrorState) {
                  return SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.error.toString()),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () => context.read<NewsBloc>().add(
                                const LoadNewsEvent(completer: null),
                              ),
                          child: Text(context.tr.errorButtonTitle),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                  );
                }

                if (state is NewsLoadedState) {
                  return SliverList.separated(
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) {
                      final article = state.articles[index];
                      return ArticleCard(
                        onTap: () => ArticleDetailsRoute(
                          article: article,
                        ).push(context),
                        article: article,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 12);
                    },
                  )
                      .sliverPaddingSymmetric(horizontal: 16, vertical: 24)
                      .sliverSafeArea(top: false);
                }

                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
