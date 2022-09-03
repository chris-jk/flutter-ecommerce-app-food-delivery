import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';
import '../api/api_client.dart';

class MerchantItemsRepo extends GetxService {
  final ApiClient apiClient;

  MerchantItemsRepo({required this.apiClient});

  Future<Response> getMerchantItems() async {
    return await apiClient.getData(Constants.MERCHANT_ITEMS_URI);
  }
}
