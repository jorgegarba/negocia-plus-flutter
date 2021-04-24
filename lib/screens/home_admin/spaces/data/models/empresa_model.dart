// To parse this JSON data, do
//
//     final EmpresaModel = EmpresaModelFromJson(jsonString);

import 'dart:convert';

EmpresaModel empresaModelFromJson(String str) =>
    EmpresaModel.fromJson(json.decode(str));

String empresaModelToJson(EmpresaModel data) => json.encode(data.toJson());

class EmpresaModel {
  EmpresaModel({
    this.empresaId,
    this.pagos,
    this.empresaRz,
    this.empresaNom,
    this.empresaRuc,
    this.empresaDir,
    this.empresaFono,
    this.est,
    this.imagenId,
    this.usuId,
    this.catEmpId,
  });

  int empresaId;
  List<Pago> pagos;
  String empresaRz;
  String empresaNom;
  String empresaRuc;
  String empresaDir;
  String empresaFono;
  bool est;
  int imagenId;
  int usuId;
  int catEmpId;

  factory EmpresaModel.fromJson(Map<String, dynamic> json) => EmpresaModel(
        empresaId: json["empresaId"],
        pagos: List<Pago>.from(json["pagos"].map((x) => Pago.fromJson(x))),
        empresaRz: json["empresaRz"],
        empresaNom: json["empresaNom"],
        empresaRuc: json["empresaRUC"],
        empresaDir: json["empresaDir"],
        empresaFono: json["empresaFono"],
        est: json["est"],
        imagenId: json["imagenId"],
        usuId: json["usuId"],
        catEmpId: json["catEmpId"],
      );

  Map<String, dynamic> toJson() => {
        "empresaId": empresaId,
        "pagos": List<dynamic>.from(pagos.map((x) => x.toJson())),
        "empresaRz": empresaRz,
        "empresaNom": empresaNom,
        "empresaRUC": empresaRuc,
        "empresaDir": empresaDir,
        "empresaFono": empresaFono,
        "est": est,
        "imagenId": imagenId,
        "usuId": usuId,
        "catEmpId": catEmpId,
      };
}

class Pago {
  Pago({
    this.ePagoId,
    this.espacios,
    this.ePagoFechin,
    this.ePagoFechfin,
    this.ePagoFecha,
    this.ePagoHash,
    this.ePagoNroope,
    this.ePagoMonto,
    this.planId,
    this.empresaId,
  });

  int ePagoId;
  List<Espacio> espacios;
  DateTime ePagoFechin;
  DateTime ePagoFechfin;
  DateTime ePagoFecha;
  String ePagoHash;
  dynamic ePagoNroope;
  String ePagoMonto;
  int planId;
  int empresaId;

  factory Pago.fromJson(Map<String, dynamic> json) => Pago(
        ePagoId: json["ePagoId"],
        espacios: List<Espacio>.from(
            json["espacios"].map((x) => Espacio.fromJson(x))),
        ePagoFechin: DateTime.parse(json["ePagoFechin"]),
        ePagoFechfin: DateTime.parse(json["ePagoFechfin"]),
        ePagoFecha: DateTime.parse(json["ePagoFecha"]),
        ePagoHash: json["ePagoHash"],
        ePagoNroope: json["ePagoNroope"],
        ePagoMonto: json["ePagoMonto"],
        planId: json["planId"],
        empresaId: json["empresaId"],
      );

  Map<String, dynamic> toJson() => {
        "ePagoId": ePagoId,
        "espacios": List<dynamic>.from(espacios.map((x) => x.toJson())),
        "ePagoFechin":
            "${ePagoFechin.year.toString().padLeft(4, '0')}-${ePagoFechin.month.toString().padLeft(2, '0')}-${ePagoFechin.day.toString().padLeft(2, '0')}",
        "ePagoFechfin":
            "${ePagoFechfin.year.toString().padLeft(4, '0')}-${ePagoFechfin.month.toString().padLeft(2, '0')}-${ePagoFechfin.day.toString().padLeft(2, '0')}",
        "ePagoFecha":
            "${ePagoFecha.year.toString().padLeft(4, '0')}-${ePagoFecha.month.toString().padLeft(2, '0')}-${ePagoFecha.day.toString().padLeft(2, '0')}",
        "ePagoHash": ePagoHash,
        "ePagoNroope": ePagoNroope,
        "ePagoMonto": ePagoMonto,
        "planId": planId,
        "empresaId": empresaId,
      };
}

class Espacio {
  Espacio({
    this.espacioId,
    this.ofertas,
    this.espacioTit,
    this.espacioDesc,
    this.est,
    this.epagoId,
    this.imagenId,
  });

  int espacioId;
  List<Oferta> ofertas;
  String espacioTit;
  String espacioDesc;
  bool est;
  int epagoId;
  int imagenId;

  factory Espacio.fromJson(Map<String, dynamic> json) => Espacio(
        espacioId: json["espacioId"],
        ofertas:
            List<Oferta>.from(json["ofertas"].map((x) => Oferta.fromJson(x))),
        espacioTit: json["espacioTit"],
        espacioDesc: json["espacioDesc"],
        est: json["est"],
        epagoId: json["epagoId"],
        imagenId: json["imagenId"],
      );

  Map<String, dynamic> toJson() => {
        "espacioId": espacioId,
        "ofertas": List<dynamic>.from(ofertas.map((x) => x.toJson())),
        "espacioTit": espacioTit,
        "espacioDesc": espacioDesc,
        "est": est,
        "epagoId": epagoId,
        "imagenId": imagenId,
      };
}

class Oferta {
  Oferta({
    this.ofertaId,
    this.ofertaTit,
    this.ofertaDesc,
    this.ofertaFd,
    this.ofertaPreci,
    this.ofertaPrecf,
    this.ofertaCheck,
    this.ofertaFechin,
    this.ofertaFechfin,
    this.ofertaCant,
    this.ofertaDelivery,
    this.ofertaOpc,
    this.ofertaInfo,
    this.est,
    this.espacioId,
    this.tipoofId,
    this.imagenId,
  });

  int ofertaId;
  String ofertaTit;
  String ofertaDesc;
  bool ofertaFd;
  String ofertaPreci;
  String ofertaPrecf;
  bool ofertaCheck;
  DateTime ofertaFechin;
  DateTime ofertaFechfin;
  int ofertaCant;
  bool ofertaDelivery;
  String ofertaOpc;
  String ofertaInfo;
  bool est;
  int espacioId;
  int tipoofId;
  int imagenId;

  factory Oferta.fromJson(Map<String, dynamic> json) => Oferta(
        ofertaId: json["ofertaId"],
        ofertaTit: json["ofertaTit"],
        ofertaDesc: json["ofertaDesc"],
        ofertaFd: json["ofertaFd"],
        ofertaPreci: json["ofertaPreci"],
        ofertaPrecf: json["ofertaPrecf"],
        ofertaCheck: json["ofertaCheck"],
        ofertaFechin: DateTime.parse(json["ofertaFechin"]),
        ofertaFechfin: DateTime.parse(json["ofertaFechfin"]),
        ofertaCant: json["ofertaCant"],
        ofertaDelivery: json["ofertaDelivery"],
        ofertaOpc: json["ofertaOpc"],
        ofertaInfo: json["ofertaInfo"],
        est: json["est"],
        espacioId: json["espacioId"],
        tipoofId: json["tipoofId"],
        imagenId: json["imagenId"],
      );

  Map<String, dynamic> toJson() => {
        "ofertaId": ofertaId,
        "ofertaTit": ofertaTit,
        "ofertaDesc": ofertaDesc,
        "ofertaFd": ofertaFd,
        "ofertaPreci": ofertaPreci,
        "ofertaPrecf": ofertaPrecf,
        "ofertaCheck": ofertaCheck,
        "ofertaFechin":
            "${ofertaFechin.year.toString().padLeft(4, '0')}-${ofertaFechin.month.toString().padLeft(2, '0')}-${ofertaFechin.day.toString().padLeft(2, '0')}",
        "ofertaFechfin":
            "${ofertaFechfin.year.toString().padLeft(4, '0')}-${ofertaFechfin.month.toString().padLeft(2, '0')}-${ofertaFechfin.day.toString().padLeft(2, '0')}",
        "ofertaCant": ofertaCant,
        "ofertaDelivery": ofertaDelivery,
        "ofertaOpc": ofertaOpc,
        "ofertaInfo": ofertaInfo,
        "est": est,
        "espacioId": espacioId,
        "tipoofId": tipoofId,
        "imagenId": imagenId,
      };
}
