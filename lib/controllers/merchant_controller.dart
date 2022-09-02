import '/data/repos/merchant_repo.dart';
import 'package:get/get.dart';

import '../models/merchant_model.dart';

class MercahntController extends GetxController {
  final MerchantRepo merchantRepo;
  MercahntController({required this.merchantRepo});
  List<dynamic> _merchantList = [];
  List<dynamic> get merchantList => _merchantList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getMerchantList() async {
    Response response = await merchantRepo.getMerchantList();
    if (response.statusCode == 200) {
      _merchantList = [];
      _merchantList.addAll(MerchantList.fromJson(response.body).data);
      _isLoaded = true;
      update();
    } else {}
  }

  void getMerchants() {}
}
