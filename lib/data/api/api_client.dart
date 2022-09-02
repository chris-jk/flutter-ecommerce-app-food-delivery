import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appbaseUrl;

  late Map<String, String> _headers;

  ApiClient({required this.appbaseUrl}) {
    baseUrl = 'https://foodtiger.site/api/v2';
    timeout = Duration(seconds: 30);

    _headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token',
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
