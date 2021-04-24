import 'package:flutter/cupertino.dart';

import 'dart:convert';

class UserRegister {
  String password;
  bool isSuperuser;
  String email;
  String type;
  String cellphone;
  String mode;
  bool isActive;
  bool isStaff;
  int personId;

  UserRegister({
    @required this.password,
    @required this.isSuperuser,
    @required this.email,
    @required this.type,
    @required this.cellphone,
    @required this.mode,
    @required this.isActive,
    @required this.isStaff,
    @required this.personId,
  });

  Map<String, dynamic> toJson() => {
        "password": password,
        "usuMail": email,
        "usuTipo": type,
        "email": email,
        "usuFono": cellphone,
        "usuModo": mode,
        "is_active": isActive,
        "is_staff": isStaff,
        "perId": personId
      };
}

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    this.perId,
    this.perNom,
    this.perApe,
    this.perDni,
    this.personas,
  });

  int perId;
  String perNom;
  String perApe;
  String perDni;
  List<dynamic> personas;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        perId: json["perId"],
        perNom: json["perNom"],
        perApe: json["perApe"],
        perDni: json["perDni"],
        personas: List<dynamic>.from(json["personas"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "perId": perId,
        "perNom": perNom,
        "perApe": perApe,
        "perDni": perDni,
        "personas": List<dynamic>.from(personas.map((x) => x)),
      };
}
