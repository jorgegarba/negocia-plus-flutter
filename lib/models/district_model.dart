// To parse this JSON data, do
//
//     final District = DistrictFromJson(jsonString);

import 'dart:convert';

District districtFromJson(String str) => District.fromJson(json.decode(str));

String districtToJson(District data) => json.encode(data.toJson());

class District {
  District({
    this.distId,
    this.distNom,
    this.est,
    this.provId,
  });

  int distId;
  String distNom;
  bool est;
  int provId;

  factory District.fromJson(Map<String, dynamic> json) => District(
        distId: json["distId"],
        distNom: json["distNom"],
        est: json["est"],
        provId: json["provId"],
      );

  Map<String, dynamic> toJson() => {
        "distId": distId,
        "distNom": distNom,
        "est": est,
        "provId": provId,
      };
}
