part of 'newsdata_bloc.dart';

@immutable
sealed class NewsdataEvent {}

final class NewsfetchEvent extends NewsdataEvent {}

