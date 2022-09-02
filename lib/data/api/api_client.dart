import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appbaseUrl;

  late Map<String, String> _headers;

  ApiClient({required this.appbaseUrl}) {
    baseUrl = appbaseUrl;
    timeout = Duration(seconds: 30);
    token = Constants.TOKEN;

    _headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri) async {
    try {
      final response = await get(uri);
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
