import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(const NewsInitialState()) {
    on<LoadNewsEvent>(_loadNews);
  }

  Future<void> _loadNews(
    LoadNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      if (state is! NewsLoadedState) {
        emit(const NewsLoadingState());
      }

      final articles = await _newsRepository.getHeadlines();

      emit(NewsLoadedState(articles: articles));
    } catch (e) {
      emit(NewsErrorState(error: e));
    } finally {
      event.completer?.complete();
    }
  }

  final NewsRepository _newsRepository;
}
