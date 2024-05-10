import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adict_news/src/extensions/context_extensions.dart';

@RoutePage()
class MainWrapperScreen extends StatelessWidget {
  const MainWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      BottomNavigationBarItem(
        label: context.tr.mainNewsTabName,
        icon: const Icon(
          Icons.article_outlined,
        ),
      ),
      BottomNavigationBarItem(
        label: context.tr.mainSearchTabName,
        icon: const Icon(
          Icons.search_outlined,
        ),
      ),
    ];

    return AutoTabsScaffold(
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: context.colorsExt.primaryColor.withOpacity(.12),
              ),
            ),
          ),
          child: BottomNavigationBar(
            items: tabs,
            onTap: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}
