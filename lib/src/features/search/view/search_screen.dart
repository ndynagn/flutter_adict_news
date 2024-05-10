import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/common/widgets/article_card.dart';
import 'package:flutter_adict_news/src/common/widgets/custom_app_bar.dart';
import 'package:flutter_adict_news/src/config/router/router.dart';
import 'package:flutter_adict_news/src/extensions/context_extensions.dart';
import 'package:flutter_adict_news/src/extensions/widget_extensions.dart';
import 'package:flutter_adict_news/src/features/search/bloc/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';

@RoutePage()
class SearchScreen extends StatefulWidget implements AutoRouteWrapper {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(
        newsRepository: context.read<NewsRepository>(),
      ),
      child: this,
    );
  }
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: context.tr.mainSearchTabName,
          ),
          const SizedBox(height: 16).sliverToBox,
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
            ),
            onChanged: (value) {
              return context.read<SearchBloc>().add(
                    SearchNewsEvent(query: value),
                  );
            },
          ).sliverToBox.sliverPaddingSymmetric(horizontal: 16),
          BlocBuilder(
            bloc: context.read<SearchBloc>(),
            builder: (context, state) {
              if (state is SearchInitialState) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      context.tr.searchEmptyFieldMessage,
                    ),
                  ),
                );
              }

              if (state is SearchErrorState) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(state.error.toString()),
                  ),
                );
              }

              if (state is SearchLoadedState) {
                if (state.articles.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        context.tr.searchNotFoundNewsMessage,
                      ),
                    ),
                  );
                }

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
    );
  }
}
