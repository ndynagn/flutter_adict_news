import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/common/widgets/custom_app_bar.dart';
import 'package:flutter_adict_news/src/extensions/context_extensions.dart';
import 'package:flutter_adict_news/src/extensions/widget_extensions.dart';
import 'package:news_repository/news_repository.dart';
import 'package:sliver_tools/sliver_tools.dart';

@RoutePage()
class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({
    super.key,
    required this.article,
  });

  final ArticleDomain article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: article.title,
            imageUrl: article.imageUrl,
            expandedHeight: context.height / 4,
          ),
          if (article.description != null)
            MultiSliver(
              children: [
                const SizedBox(height: 12).sliverToBox,
                Text(
                  article.description!,
                  style: context.textTheme.bodyMedium,
                ).sliverToBox.sliverPaddingSymmetric(horizontal: 16),
              ],
            ),
          const SizedBox(height: 12).sliverToBox,
          Text(
            context.tr.articleDetailsPublishedAt(article.dateTime.toLocal()),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorsExt.primaryColor.withOpacity(.4),
            ),
          ).sliverToBox.sliverPaddingSymmetric(horizontal: 16),
          if (article.content != null)
            MultiSliver(
              children: [
                const SizedBox(height: 12).sliverToBox,
                Text(
                  article.content!,
                  style: context.textTheme.bodyMedium,
                ).sliverToBox.sliverPaddingSymmetric(horizontal: 16),
              ],
            ),
          const SizedBox(height: 12).sliverToBox,
          Text(
            article.source,
            style: context.textTheme.bodyMedium,
          ).sliverToBox.sliverPaddingSymmetric(horizontal: 16),
        ],
      ),
    );
  }
}
