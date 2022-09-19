import 'package:food_delivery/screens/merchant/merchant_details2.dart';
import 'package:get/get.dart';

import '../screens/home/main_page.dart';
import '../screens/merchant/merchant_details.dart';

class RoutHelper {
  static String initial = '/';
  static String merchantDetails = '/merchant-details';

  static getinitial() => initial;

  static String getMerchantDetails(int pageId) =>
      '$merchantDetails?pageId=$pageId';

  static List<GetPage> routes = [
    // main page
    GetPage(name: initial, page: () => const MainPage()),
    //
    GetPage(
        name: merchantDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          print('Goin to -> pageId: $pageId');
          return MerchantDetails(pageId: int.parse(pageId ?? "0"));
        },
        transition: Transition.zoom),
  ];
}
