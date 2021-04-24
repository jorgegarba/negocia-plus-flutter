import 'dart:convert';

OfferType offerTypeFromJson(String str) => OfferType.fromJson(json.decode(str));

String offerTypeToJson(OfferType data) => json.encode(data.toJson());

class OfferType {
  OfferType({
    this.tipoOfId,
    this.tipoOfDesc,
    this.est,
  });

  int tipoOfId;
  String tipoOfDesc;
  bool est;

  factory OfferType.fromJson(Map<String, dynamic> json) => OfferType(
        tipoOfId: json["tipoOfId"],
        tipoOfDesc: json["tipoOfDesc"],
        est: json["est"],
      );

  Map<String, dynamic> toJson() => {
        "tipoOfId": tipoOfId,
        "tipoOfDesc": tipoOfDesc,
        "est": est,
      };
}
