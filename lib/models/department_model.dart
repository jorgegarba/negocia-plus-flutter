import 'dart:convert';

Department departmentFromJson(String str) =>
    Department.fromJson(json.decode(str));

String departmentToJson(Department data) => json.encode(data.toJson());

class Department {
  Department({
    this.dptoId,
    this.dptoNom,
    this.est,
  });

  int dptoId;
  String dptoNom;
  bool est;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        dptoId: json["dptoId"],
        dptoNom: json["dptoNom"],
        est: json["est"],
      );

  Map<String, dynamic> toJson() => {
        "dptoId": dptoId,
        "dptoNom": dptoNom,
        "est": est,
      };
}
