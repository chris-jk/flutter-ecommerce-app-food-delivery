import 'package:get/get.dart';

import '../screens/home/main_page.dart';
import '../screens/products/merchant_details.dart';

class RoutHelper {
  static String initial = '/';
  static String merchantDetails = '/merchant-details';

  static getinitial() => initial;

  static String getMerchantDetails(int pageId) =>
      '$merchantDetails?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainPage()),
    GetPage(
        name: merchantDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          return MerchantDetails(pageId: int.parse(pageId!));
        },
        transition: Transition.zoom),
  ];
}
