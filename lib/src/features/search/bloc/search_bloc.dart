import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(const SearchInitialState()) {
    on<SearchNewsEvent>(
      _searchNews,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 800))
            .asyncExpand(mapper);
      },
    );
  }

  Future<void> _searchNews(
    SearchNewsEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(const SearchInitialState());
      return;
    }

    try {
      emit(const SearchLoadingState());

      final articles = await _newsRepository.getEverything(
        query: event.query,
      );

      emit(SearchLoadedState(articles: articles));
    } catch (e) {
      emit(SearchErrorState(error: e));
    }
  }

  final NewsRepository _newsRepository;
}
