part of 'favorte_list_bloc.dart';

@immutable
sealed class FavorteListState {}

final class FavorteListInitial extends FavorteListState {}

final class Favoritestate extends FavorteListState {
  final List<Article> data;
  final bool isfavorite;

  Favoritestate({required this.data, required this.isfavorite});
}

final class FavoriteLoading extends FavorteListState {}
