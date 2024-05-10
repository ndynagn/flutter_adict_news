part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

final class LoadNewsEvent extends NewsEvent {
  const LoadNewsEvent({
    required this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => super.props..add(completer);
}
