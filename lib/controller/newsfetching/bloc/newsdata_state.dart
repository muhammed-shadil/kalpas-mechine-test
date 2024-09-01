part of 'newsdata_bloc.dart';

@immutable
sealed class NewsdataState {}

final class NewsdataInitial extends NewsdataState {}

final class SuccessFetching extends NewsdataState {
  final Newsfetch newsdata;

  SuccessFetching({required this.newsdata});
}

final class FaildFetching extends NewsdataState {
  final String message;

  FaildFetching({required this.message});
}

final class Loading extends NewsdataState {}
