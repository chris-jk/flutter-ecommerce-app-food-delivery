// import 'dart:convert';

// // final merchantData = merchantDataFromJson(jsonString);

// class MerchantData {
//   MerchantData({
//     required this.data,
//   });

//   List<Merchant> data;

//   factory MerchantData.fromJson(Map<String, dynamic> json) => MerchantData(
//         data:
//             List<Merchant>.from(json["data"].map((x) => Merchant.fromJson(x))),
//       );
// }

// class Merchant {
//   Merchant({
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.name,
//     this.subdomain,
//     this.logo,
//     this.cover,
//     this.active,
//     this.userId,
//     this.lat,
//     this.lng,
//     this.address,
//     this.phone,
//     this.minimum,
//     this.description,
//     this.fee,
//     this.staticFee,
//     this.radius,
//     this.isFeatured,
//     this.cityId,
//     this.views,
//     this.canPickup,
//     this.canDeliver,
//     this.selfDeliver,
//     this.freeDeliver,
//     this.whatsappPhone,
//     this.fbUsername,
//     this.doCovertion,
//     this.currency,
//     this.paymentInfo,
//     this.molliePaymentKey,
//     this.deletedAt,
//     this.canDinein,
//     this.alias,
//     this.logom,
//     this.icon,
//     this.coverm,
//   });

//   int id;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String name;
//   String subdomain;
//   String logo;
//   String cover;
//   int active;
//   int userId;
//   String lat;
//   String lng;
//   String address;
//   String phone;
//   String minimum;
//   String description;
//   int fee;
//   int staticFee;
//   List<Radius> radius;
//   int isFeatured;
//   int cityId;
//   int views;
//   int canPickup;
//   int canDeliver;
//   int selfDeliver;
//   int freeDeliver;
//   String whatsappPhone;
//   dynamic fbUsername;
//   int doCovertion;
//   String currency;
//   String paymentInfo;
//   String molliePaymentKey;
//   dynamic deletedAt;
//   int canDinein;
//   String alias;
//   String logom;
//   String icon;
//   String coverm;

//   factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
//         id: json["id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         name: json["name"],
//         subdomain: json["subdomain"],
//         logo: json["logo"],
//         cover: json["cover"],
//         active: json["active"],
//         userId: json["user_id"],
//         lat: json["lat"],
//         lng: json["lng"],
//         address: json["address"],
//         phone: json["phone"],
//         minimum: json["minimum"],
//         description: json["description"],
//         fee: json["fee"],
//         staticFee: json["static_fee"],
//         radius:
//             List<Radius>.from(json["radius"].map((x) => Radius.fromJson(x))),
//         isFeatured: json["is_featured"],
//         cityId: json["city_id"],
//         views: json["views"],
//         canPickup: json["can_pickup"],
//         canDeliver: json["can_deliver"],
//         selfDeliver: json["self_deliver"],
//         freeDeliver: json["free_deliver"],
//         whatsappPhone: json["whatsapp_phone"],
//         fbUsername: json["fb_username"],
//         doCovertion: json["do_covertion"],
//         currency: json["currency"],
//         paymentInfo: json["payment_info"],
//         molliePaymentKey: json["mollie_payment_key"],
//         deletedAt: json["deleted_at"],
//         canDinein: json["can_dinein"],
//         alias: json["alias"],
//         logom: json["logom"],
//         icon: json["icon"],
//         coverm: json["coverm"],
//       );
// }

// class Radius {
//   Radius({
//     this.lat,
//     this.lng,
//   });

//   double lat;
//   double lng;

//   factory Radius.fromRawJson(String str) => Radius.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Radius.fromJson(Map<String, dynamic> json) => Radius(
//         lat: json["lat"].toDouble(),
//         lng: json["lng"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lng": lng,
//       };
// }
