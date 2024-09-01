import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:kalbas_mechine_test/model/news_model.dart';
import 'package:kalbas_mechine_test/utils/api_repository/api_repository.dart';
import 'package:meta/meta.dart';
part 'newsdata_event.dart';
part 'newsdata_state.dart';

class NewsdataBloc extends Bloc<NewsdataEvent, NewsdataState> {
  NewsdataBloc() : super(NewsdataInitial()) {
    on<NewsdataEvent>(newsfetchbloc);
  }
  Apirepository apirepository = Apirepository();
  List<Article> article = [];
  FutureOr<void> newsfetchbloc(
      NewsdataEvent event, Emitter<NewsdataState> emit) async {
    emit(Loading());
    late Newsfetch fetchdatas;

    try {
      final Response response = await apirepository.newsFetchRepository();

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        fetchdatas = Newsfetch.fromjson(result);
        emit(SuccessFetching(newsdata: fetchdatas));
      } else {
        emit(FaildFetching(message: "somthing went wrong"));
      }
    } catch (e) {
      emit(FaildFetching(message: e.toString()));
    }
  }
}
