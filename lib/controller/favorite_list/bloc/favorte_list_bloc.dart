import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kalbas_mechine_test/model/news_model.dart';
import 'package:meta/meta.dart';
part 'favorte_list_event.dart';
part 'favorte_list_state.dart';

class FavorteListBloc extends Bloc<FavorteListEvent, FavorteListState> {
  FavorteListBloc() : super(FavorteListInitial()) {
    on<FavoriteEvent>(favoritebloc);
  }
  List<Article> article = [];
  FutureOr<void> favoritebloc(
      FavoriteEvent event, Emitter<FavorteListState> emit) {
    emit(FavoriteLoading());
    try {
      if (event.isfavorite) {
        article.add(event.data);
        emit(Favoritestate(data: article, isfavorite: event.isfavorite));
      } else {
        article.remove(event.data);
        emit(Favoritestate(data: article, isfavorite: event.isfavorite));
      }
    } catch (e) {
      emit(FavoriteLoading());
    }
  }
}
