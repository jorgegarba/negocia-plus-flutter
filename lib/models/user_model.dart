import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.usuId,
    this.isSuperuser,
    this.usuMail,
    this.usuTipo,
    this.usuCheck,
    this.usuActivo,
    this.usuFono,
    this.usuModo,
    this.isActive,
    this.isStaff,
    this.perId,
  });

  int usuId;
  bool isSuperuser;
  String usuMail;
  String usuTipo;
  bool usuCheck;
  bool usuActivo;
  String usuFono;
  String usuModo;
  bool isActive;
  bool isStaff;
  PerId perId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        usuId: json["usuId"],
        isSuperuser: json["is_superuser"],
        usuMail: json["usuMail"],
        usuTipo: json["usuTipo"],
        usuCheck: json["usuCheck"],
        usuActivo: json["usuActivo"],
        usuFono: json["usuFono"],
        usuModo: json["usuModo"],
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        perId: PerId.fromJson(json["perId"]),
      );

  Map<String, dynamic> toJson() => {
        "usuId": usuId,
        "is_superuser": isSuperuser,
        "usuMail": usuMail,
        "usuTipo": usuTipo,
        "usuCheck": usuCheck,
        "usuActivo": usuActivo,
        "usuFono": usuFono,
        "usuModo": usuModo,
        "is_active": isActive,
        "is_staff": isStaff,
        "perId": perId.toJson(),
      };
}

class PerId {
  PerId({
    this.perId,
    this.perNom,
    this.perApe,
    this.perDni,
  });

  int perId;
  String perNom;
  String perApe;
  String perDni;

  factory PerId.fromJson(Map<String, dynamic> json) => PerId(
        perId: json["perId"],
        perNom: json["perNom"],
        perApe: json["perApe"],
        perDni: json["perDni"],
      );

  Map<String, dynamic> toJson() => {
        "perId": perId,
        "perNom": perNom,
        "perApe": perApe,
        "perDni": perDni,
      };
}
