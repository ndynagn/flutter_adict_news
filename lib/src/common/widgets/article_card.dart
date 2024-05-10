import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/config/styles/styles.dart';
import 'package:flutter_adict_news/src/extensions/context_extensions.dart';
import 'package:flutter_adict_news/src/extensions/widget_extensions.dart';
import 'package:news_repository/news_repository.dart';
import 'package:shimmer/shimmer.dart';

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
        shape: SmoothRectangleBorder(
          side: BorderSide(
            color: context.colorsExt.primaryColor.withOpacity(.12),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.imageUrl != null)
                CachedNetworkImage(
                  imageUrl: article.imageUrl!,
                  imageBuilder: (context, imageProvider) {
                    return Ink.image(
                      image: imageProvider,
                      width: double.infinity,
                      height: 190,
                      fit: BoxFit.cover,
                    );
                  },
                  placeholder: (context, imageUrl) {
                    return Shimmer.fromColors(
                      baseColor: context.colorsExt.backgroundTertiaryColor,
                      highlightColor: context.colorsExt.backgroundTertiaryColor
                          .withOpacity(.1),
                      child: Container(
                        width: double.infinity,
                        height: 190,
                        color: context.colorsExt.backgroundTertiaryColor,
                      ),
                    );
                  },
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
