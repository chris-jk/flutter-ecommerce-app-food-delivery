class MerchantItems {
  MerchantItems({
    required this.data,
    required this.status,
    required this.errMsg,
  });

  List<List<MerchantItemModel>> data;
  bool status;
  String errMsg;

  factory MerchantItems.fromJson(Map<String, dynamic> json) => MerchantItems(
        data: List<List<MerchantItemModel>>.from(json["data"].map((x) =>
            List<MerchantItemModel>.from(
                x.map((x) => MerchantItemModel.fromJson(x))))),
        status: json["status"],
        errMsg: json["errMsg"],
      );
}

class MerchantItemModel {
  MerchantItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.available,
    required this.hasVariants,
    required this.vat,
    required this.deletedAt,
    required this.enableSystemVariants,
    required this.discountedPrice,
    required this.logom,
    required this.icon,
    required this.shortDescription,
    required this.variants,
    required this.categoryName,
    required this.extras,
    required this.options,
  });

  int id;
  String name;
  String description;
  String image;
  num price;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int available;
  int hasVariants;
  int vat;
  dynamic deletedAt;
  int enableSystemVariants;
  int discountedPrice;
  String logom;
  String icon;
  String shortDescription;
  List<Variant> variants;
  String categoryName;
  List<Extra> extras;
  List<Extra> options;

  factory MerchantItemModel.fromJson(Map<String, dynamic> json) =>
      MerchantItemModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        categoryId: json["category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        available: json["available"],
        hasVariants: json["has_variants"],
        vat: json["vat"],
        deletedAt: json["deleted_at"],
        enableSystemVariants: json["enable_system_variants"],
        discountedPrice: json["discounted_price"],
        logom: json["logom"],
        icon: json["icon"],
        shortDescription: json["short_description"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
        categoryName: json["category_name"],
        extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
        options:
            List<Extra>.from(json["options"].map((x) => Extra.fromJson(x))),
      );
}

class Extra {
  Extra({
    required this.id,
    required this.itemId,
    required this.price,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.extraForAllVariants,
    required this.options,
  });

  int id;
  int itemId;
  num? price;
  dynamic name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int? extraForAllVariants;
  dynamic options;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        id: json["id"],
        itemId: json["item_id"],
        price: json["price"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        extraForAllVariants: json["extra_for_all_variants"],
        options: json["options"],
      );
}

class Pivot {
  Pivot({
    required this.variantId,
    required this.extraId,
  });

  int variantId;
  int extraId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        variantId: json["variant_id"],
        extraId: json["extra_id"],
      );
}

class Variant {
  Variant({
    required this.id,
    required this.price,
    required this.options,
    required this.image,
    required this.qty,
    required this.enableQty,
    required this.order,
    required this.itemId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.isSystem,
    required this.extras,
  });

  int id;
  num price;
  String options;
  String image;
  int qty;
  int enableQty;
  int order;
  int itemId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int isSystem;
  List<Extra> extras;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        price: json["price"],
        options: json["options"],
        image: json["image"],
        qty: json["qty"],
        enableQty: json["enable_qty"],
        order: json["order"],
        itemId: json["item_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        isSystem: json["is_system"],
        extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
      );
}
