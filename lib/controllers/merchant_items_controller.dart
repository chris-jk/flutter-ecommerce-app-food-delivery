import '/data/repos/merchant_items_repo.dart';
import 'package:get/get.dart';
import 'dart:developer';
import '../models/merchant_items_model.dart';

class MercahntItemsController extends GetxController {
  final MerchantItemsRepo merchantItemsRepo;

  MercahntItemsController({required this.merchantItemsRepo});

  List<dynamic> _merchantItems = [];
  List<dynamic> get merchantItems => _merchantItems;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getMerchantItems() async {
    Response response = await merchantItemsRepo.getMerchantItems();
    if (response.statusCode == 200) {
      _merchantItems = [];
      _merchantItems.addAll(MerchantItems.fromJson(response.body).data);
      _isLoaded = true;
      print(_merchantItems);
      // inspect(response.body);

      update();
    } else {}
  }
}
