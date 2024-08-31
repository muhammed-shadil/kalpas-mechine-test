import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_dara_event.dart';
part 'news_dara_state.dart';

class NewsDaraBloc extends Bloc<NewsDaraEvent, NewsDaraState> {
  NewsDaraBloc() : super(NewsDaraInitial()) {
    on<NewsDaraEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
