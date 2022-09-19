import 'package:get/get.dart';
import '/data/repos/merchant_items_repo.dart';
import '../models/merchant_items_model.dart';

class MerchantItemsController extends GetxController {
  final MerchantItemsRepo merchantItemsRepo;

  MerchantItemsController({required this.merchantItemsRepo});
  List<dynamic> _merchantItems = [];
  List<dynamic> get merchantItems => _merchantItems;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getMerchantItems() async {
    Response response = await merchantItemsRepo.getMerchantItems();
    if (response.statusCode == 200) {
      print('Got Products Successfully 📦 ✅');
      _merchantItems = [];
      _merchantItems.addAll(MerchantItems.fromJson(response.body).data);
      _isLoaded = true;
      // printError(info: response.body.toString());
      update();
    } else {}
  }
}
