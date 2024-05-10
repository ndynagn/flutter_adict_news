part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

final class NewsInitialState extends NewsState {
  const NewsInitialState();
}

final class NewsLoadingState extends NewsState {
  const NewsLoadingState();
}

final class NewsLoadedState extends NewsState {
  const NewsLoadedState({required this.articles});

  final List<ArticleDomain> articles;

  @override
  List<Object?> get props => [articles];
}

final class NewsErrorState extends NewsState {
  const NewsErrorState({
    required this.error,
  });

  final Object? error;

  @override
  List<Object?> get props => [error];
}
