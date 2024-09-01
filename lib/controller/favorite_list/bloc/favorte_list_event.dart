part of 'favorte_list_bloc.dart';

@immutable
sealed class FavorteListEvent {}

final class FavoriteEvent extends FavorteListEvent {
  final Article data;
  final bool isfavorite;

  FavoriteEvent({required this.data, required this.isfavorite});
}