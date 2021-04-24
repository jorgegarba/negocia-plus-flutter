// To parse this JSON data, do
//
//     final Province = ProvinceFromJson(jsonString);

import 'dart:convert';

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  Province({
    this.provId,
    this.provNom,
    this.est,
    this.dptoId,
  });

  int provId;
  String provNom;
  bool est;
  int dptoId;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        provId: json["provId"],
        provNom: json["provNom"],
        est: json["est"],
        dptoId: json["dptoId"],
      );

  Map<String, dynamic> toJson() => {
        "provId": provId,
        "provNom": provNom,
        "est": est,
        "dptoId": dptoId,
      };
}
