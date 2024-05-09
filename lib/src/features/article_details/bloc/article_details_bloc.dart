import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'article_details_event.dart';
part 'article_details_state.dart';

class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  ArticleDetailsBloc() : super(ArticleDetailsInitial()) {
    on<ArticleDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
