import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home1/domain/repo/news_repository.dart';
import 'package:home1/ui/bloc/news_event.dart';
import 'package:home1/ui/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.repository}) : super(const NewsInitial()) {
    on<GetNewsEvent>(_onGetNews);
  }

  final NewsRepository repository;

  Future<void> _onGetNews(GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(const NewsLoading());

    try {
      final articles = await repository.getEverythingArticles();
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}