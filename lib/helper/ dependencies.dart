import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';

import '../controllers/merchant_controller.dart';
import '../data/api/api_client.dart';
import '../data/repos/merchant_repo.dart';

// api Client
Future<void> init() async {
  Get.lazyPut(() => ApiClient(appbaseUrl: Constants.BASE_URL));

// from repos
  Get.lazyPut(() => MerchantRepo(apiClient: Get.find()));

// from controllers
  Get.lazyPut(() => MercahntController(merchantRepo: Get.find()));
}
