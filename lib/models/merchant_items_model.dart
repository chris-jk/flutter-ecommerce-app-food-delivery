class MerchantItems {
  bool? _status;
  String? _errMsg;

  late List<List<MerchantItemsModel>> _data;

  List<List<MerchantItemsModel>> get data => _data;

  MerchantItems({
    required data,
    required status,
    required errMsg,
  }) {
    _status = status;
    _errMsg = errMsg;
    _data = data;
  }

  MerchantItems.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _errMsg = json['errMsg'];
    if (json['data'] != null) {
      _data = <MerchantItemsModel>[].cast<List<MerchantItemsModel>>();
      // json['data'].forEach((v) {
      //   _data.add(MerchantItemsModel.fromJson(v));
      // });
    }
  }
}

class MerchantItemsModel {
  int? id;
  String? name;
  String? description;
  String? image;
  double? price;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  int? available;
  int? hasVariants;
  int? vat;
  String? deletedAt;
  int? enableSystemVariants;
  int? discountedPrice;
  String? logom;
  String? icon;
  String? shortDescription;
  // List<Null>? variants;
  String? categoryName;
  // List<Null>? extras;
  // List<Null>? options;

  MerchantItemsModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.available,
    this.hasVariants,
    this.vat,
    this.deletedAt,
    this.enableSystemVariants,
    this.discountedPrice,
    this.logom,
    this.icon,
    this.shortDescription,
    // this.variants,
    this.categoryName,
    // this.extras,
    // this.options
  });

  MerchantItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    available = json['available'];
    hasVariants = json['has_variants'];
    vat = json['vat'];
    deletedAt = json['deleted_at'];
    enableSystemVariants = json['enable_system_variants'];
    discountedPrice = json['discounted_price'];
    logom = json['logom'];
    icon = json['icon'];
    shortDescription = json['short_description'];
    // if (json['variants'] != null) {
    //   variants = <Null>[];
    //   json['variants'].forEach((v) {
    //     variants!.add(new Null.fromJson(v));
    //   });
    // }
    // categoryName = json['category_name'];
    // if (json['extras'] != null) {
    //   extras = <Null>[];
    //   json['extras'].forEach((v) {
    //     extras!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['options'] != null) {
    //   options = <Null>[];
    //   json['options'].forEach((v) {
    //     options!.add(new Null.fromJson(v));
    //   });
    // }
  }
}
