import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';
import '../api/api_client.dart';

class MerchantRepo extends GetxService {
  final ApiClient apiClient;

  MerchantRepo({required this.apiClient});

  Future<Response> getMerchantList() async {
    return await apiClient.getData(Constants.MERCHANT_URI);
  }
}
