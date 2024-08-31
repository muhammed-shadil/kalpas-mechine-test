import 'package:http/http.dart' as http;
import 'package:kalbas_mechine_test/utils/resources/api.dart';

class Apiprovider {
  Future<http.Response> newsFetchProvider() async {
    final response = await http.get(
      Uri.parse('$apiurl$apikey'),
    );
    return response;
  }
}
