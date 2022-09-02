class MerchantList {
  bool? _status;
  String? _errMsg;

  late List<MerchantModel> _data;

  List<MerchantModel> get data => _data;

  MerchantList({
    required data,
    required status,
    required errMsg,
  }) {
    _status = status;
    _errMsg = errMsg;
    _data = data;
  }

  MerchantList.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _errMsg = json['errMsg'];
    if (json['data'] != null) {
      _data = <MerchantModel>[];
      json['data'].forEach((v) {
        _data.add(MerchantModel.fromJson(v));
      });
    }
  }
}

class MerchantModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? subdomain;
  String? logo;
  String? cover;
  int? active;
  int? userId;
  String? lat;
  String? lng;
  String? address;
  String? phone;
  String? minimum;
  String? description;
  int? fee;
  int? staticFee;
  List<DeliveryRadius>? radius;
  int? isFeatured;
  int? cityId;
  int? views;
  int? canPickup;
  int? canDeliver;
  int? selfDeliver;
  int? freeDeliver;
  String? whatsappPhone;
  String? fbUsername;
  int? doCovertion;
  String? currency;
  String? paymentInfo;
  String? molliePaymentKey;
  String? deletedAt;
  int? canDinein;
  String? alias;
  String? logom;
  String? icon;
  String? coverm;

  MerchantModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.subdomain,
      this.logo,
      this.cover,
      this.active,
      this.userId,
      this.lat,
      this.lng,
      this.address,
      this.phone,
      this.minimum,
      this.description,
      this.fee,
      this.staticFee,
      this.radius,
      this.isFeatured,
      this.cityId,
      this.views,
      this.canPickup,
      this.canDeliver,
      this.selfDeliver,
      this.freeDeliver,
      this.whatsappPhone,
      this.fbUsername,
      this.doCovertion,
      this.currency,
      this.paymentInfo,
      this.molliePaymentKey,
      this.deletedAt,
      this.canDinein,
      this.alias,
      this.logom,
      this.icon,
      this.coverm});

  MerchantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    subdomain = json['subdomain'];
    logo = json['logo'];
    cover = json['cover'];
    active = json['active'];
    userId = json['user_id'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    phone = json['phone'];
    minimum = json['minimum'];
    description = json['description'];
    fee = json['fee'];
    staticFee = json['static_fee'];
    if (json['radius'] != null) {
      radius = <DeliveryRadius>[];
      json['radius'].forEach((v) {
        radius!.add(DeliveryRadius.fromJson(v));
      });
    }
    isFeatured = json['is_featured'];
    cityId = json['city_id'];
    views = json['views'];
    canPickup = json['can_pickup'];
    canDeliver = json['can_deliver'];
    selfDeliver = json['self_deliver'];
    freeDeliver = json['free_deliver'];
    whatsappPhone = json['whatsapp_phone'];
    fbUsername = json['fb_username'];
    doCovertion = json['do_covertion'];
    currency = json['currency'];
    paymentInfo = json['payment_info'];
    molliePaymentKey = json['mollie_payment_key'];
    deletedAt = json['deleted_at'];
    canDinein = json['can_dinein'];
    alias = json['alias'];
    logom = json['logom'];
    icon = json['icon'];
    coverm = json['coverm'];
  }
}

class DeliveryRadius {
  double? lat;
  double? lng;

  DeliveryRadius({this.lat, this.lng});

  DeliveryRadius.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}
