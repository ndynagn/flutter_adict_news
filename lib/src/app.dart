import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adict_news/src/config/router/router.dart';
import 'package:flutter_adict_news/src/config/styles/styles.dart';
import 'package:flutter_adict_news/src/extensions/context_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:news_repository/news_repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _router;

  @override
  void initState() {
    _router = AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final platformBrightness = context.mediaQuery.platformBrightness;
    final focusManager = FocusManager.instance;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: platformBrightness == Brightness.light
            ? Brightness.dark
            : Brightness.light,
      ),
    );

    return RepositoryProvider<NewsRepository>(
      create: (context) => NewsRepositoryImpl(
        dataSource: GetIt.I.get<NewsApiDataSource>(),
      ),
      child: GestureDetector(
        onTap: () => focusManager.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}
