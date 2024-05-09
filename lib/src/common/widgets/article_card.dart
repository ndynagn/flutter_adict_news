import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/config/styles/styles.dart';
import 'package:flutter_adict_news/src/extensions/context_extensions.dart';
import 'package:flutter_adict_news/src/extensions/widget_extensions.dart';
import 'package:news_repository/news_repository.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.onTap,
    required this.article,
  });

  final GestureTapCallback? onTap;
  final ArticleDomain article;

  @override
  Widget build(BuildContext context) {
    return ClipSmoothRect(
      radius: SmoothBorderRadius(
        cornerRadius: AppDimensions.medium,
        cornerSmoothing: 1,
      ),
      child: Material(
        color: context.colorsExt.backgroundSecondaryColor,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.imageUrl != null)
                ClipSmoothRect(
                  radius: SmoothBorderRadius(
                    cornerRadius: AppDimensions.medium,
                    cornerSmoothing: 1,
                  ),
                  child: Ink.image(
                    image: NetworkImage(article.imageUrl!),
                    width: double.infinity,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 12),
              Text(article.title).paddingSymmetric(
                horizontal: 12,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
