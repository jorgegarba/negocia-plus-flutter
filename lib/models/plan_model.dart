// To parse this JSON data, do
//
//     final Plan = PlanFromJson(jsonString);

import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));

String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  Plan({
    this.planId,
    this.planDesc,
    this.planDias,
    this.planPrecio,
    this.est,
  });

  int planId;
  String planDesc;
  String planDias;
  String planPrecio;
  bool est;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        planId: json["planId"],
        planDesc: json["planDesc"],
        planDias: json["planDias"],
        planPrecio: json["planPrecio"],
        est: json["est"],
      );

  Map<String, dynamic> toJson() => {
        "planId": planId,
        "planDesc": planDesc,
        "planDias": planDias,
        "planPrecio": planPrecio,
        "est": est,
      };
}
