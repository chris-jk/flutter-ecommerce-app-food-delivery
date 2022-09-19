// ignore_for_file: avoid_print

import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appbaseUrl;

  ApiClient({required this.appbaseUrl}) {
    baseUrl = appbaseUrl;
    timeout = const Duration(seconds: 30);
    token = Constants.TOKEN;
  }
  Future<Response> getData(String uri) async {
    try {
      final response = await get(uri);
      print(appbaseUrl + uri);
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
