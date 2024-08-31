import 'package:http/http.dart' as http;
import 'package:kalbas_mechine_test/utils/api_provider/api_provider.dart';

class Apirepository {
  final Apiprovider apiprovider = Apiprovider();
  Future<http.Response> newsFetchRepository() async {
    return apiprovider.newsFetchProvider();
  }
}
