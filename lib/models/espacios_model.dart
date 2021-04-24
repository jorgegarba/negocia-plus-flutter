// To parse this JSON data, do
//
//     final EspaciosModel = EspaciosModelFromJson(jsonString);

import 'dart:convert';

EspaciosModel espaciosModelFromJson(String str) =>
    EspaciosModel.fromJson(json.decode(str));

String espaciosModelToJson(EspaciosModel data) => json.encode(data.toJson());

class EspaciosModel {
  EspaciosModel({
    this.espacioId,
    this.espaciosOferta,
    this.imagen,
    this.empresa,
    this.espacioTit,
    this.espacioDesc,
    this.est,
    this.epagoId,
    this.imagenId,
  });

  int espacioId;
  List<EspaciosOferta> espaciosOferta;
  Imagen imagen;
  EspaciosModelEmpresa empresa;
  String espacioTit;
  String espacioDesc;
  bool est;
  int epagoId;
  int imagenId;

  factory EspaciosModel.fromJson(Map<String, dynamic> json) => EspaciosModel(
        espacioId: json["espacioId"],
        espaciosOferta: List<EspaciosOferta>.from(
            json["espaciosOferta"].map((x) => EspaciosOferta.fromJson(x))),
        imagen: Imagen.fromJson(json["imagen"]),
        empresa: EspaciosModelEmpresa.fromJson(json["empresa"]),
        espacioTit: json["espacioTit"],
        espacioDesc: json["espacioDesc"],
        est: json["est"],
        epagoId: json["epagoId"],
        imagenId: json["imagenId"],
      );

  Map<String, dynamic> toJson() => {
        "espacioId": espacioId,
        "espaciosOferta":
            List<dynamic>.from(espaciosOferta.map((x) => x.toJson())),
        "imagen": imagen.toJson(),
        "empresa": empresa.toJson(),
        "espacioTit": espacioTit,
        "espacioDesc": espacioDesc,
        "est": est,
        "epagoId": epagoId,
        "imagenId": imagenId,
      };
}

class EspaciosModelEmpresa {
  EspaciosModelEmpresa({
    this.empresa,
  });

  EmpresaEmpresa empresa;

  factory EspaciosModelEmpresa.fromJson(Map<String, dynamic> json) =>
      EspaciosModelEmpresa(
        empresa: EmpresaEmpresa.fromJson(json["empresa"]),
      );

  Map<String, dynamic> toJson() => {
        "empresa": empresa.toJson(),
      };
}

class EmpresaEmpresa {
  EmpresaEmpresa({
    this.empresaId,
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
  String empresaRz;
  String empresaNom;
  String empresaRuc;
  String empresaDir;
  String empresaFono;
  bool est;
  int imagenId;
  int usuId;
  int catEmpId;

  factory EmpresaEmpresa.fromJson(Map<String, dynamic> json) => EmpresaEmpresa(
        empresaId: json["empresaId"],
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

class EspaciosOferta {
  EspaciosOferta({
    this.ofertaId,
    this.ofertasDias,
    this.tipoofId,
    this.ofertasSedes,
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
    this.imagenId,
  });

  int ofertaId;
  List<OfertasDia> ofertasDias;
  TipoofId tipoofId;
  List<OfertasSede> ofertasSedes;
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
  int imagenId;

  factory EspaciosOferta.fromJson(Map<String, dynamic> json) => EspaciosOferta(
        ofertaId: json["ofertaId"],
        ofertasDias: List<OfertasDia>.from(
            json["ofertasDias"].map((x) => OfertasDia.fromJson(x))),
        tipoofId: TipoofId.fromJson(json["tipoofId"]),
        ofertasSedes: List<OfertasSede>.from(
            json["ofertasSedes"].map((x) => OfertasSede.fromJson(x))),
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
        imagenId: json["imagenId"],
      );

  Map<String, dynamic> toJson() => {
        "ofertaId": ofertaId,
        "ofertasDias": List<dynamic>.from(ofertasDias.map((x) => x.toJson())),
        "tipoofId": tipoofId.toJson(),
        "ofertasSedes": List<dynamic>.from(ofertasSedes.map((x) => x.toJson())),
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
        "imagenId": imagenId,
      };
}

class OfertasDia {
  OfertasDia({
    this.ofDiaId,
    this.diaId,
    this.ofDiaHin,
    this.ofDiaHfin,
    this.ofertaId,
  });

  int ofDiaId;
  DiaId diaId;
  String ofDiaHin;
  String ofDiaHfin;
  int ofertaId;

  factory OfertasDia.fromJson(Map<String, dynamic> json) => OfertasDia(
        ofDiaId: json["ofDiaId"],
        diaId: DiaId.fromJson(json["diaId"]),
        ofDiaHin: json["ofDiaHin"],
        ofDiaHfin: json["ofDiaHfin"],
        ofertaId: json["ofertaId"],
      );

  Map<String, dynamic> toJson() => {
        "ofDiaId": ofDiaId,
        "diaId": diaId.toJson(),
        "ofDiaHin": ofDiaHin,
        "ofDiaHfin": ofDiaHfin,
        "ofertaId": ofertaId,
      };
}

class DiaId {
  DiaId({
    this.diaId,
    this.diaNom,
    this.diaNro,
    this.est,
  });

  int diaId;
  String diaNom;
  int diaNro;
  bool est;

  factory DiaId.fromJson(Map<String, dynamic> json) => DiaId(
        diaId: json["diaId"],
        diaNom: json["diaNom"],
        diaNro: json["diaNro"],
        est: json["est"],
      );

  Map<String, dynamic> toJson() => {
        "diaId": diaId,
        "diaNom": diaNom,
        "diaNro": diaNro,
        "est": est,
      };
}

class OfertasSede {
  OfertasSede({
    this.ofSedeId,
    this.sede,
    this.est,
    this.sedeId,
    this.ofertaId,
  });

  int ofSedeId;
  Sede sede;
  bool est;
  int sedeId;
  int ofertaId;

  factory OfertasSede.fromJson(Map<String, dynamic> json) => OfertasSede(
        ofSedeId: json["ofSedeId"],
        sede: Sede.fromJson(json["sede"]),
        est: json["est"],
        sedeId: json["sedeId"],
        ofertaId: json["ofertaId"],
      );

  Map<String, dynamic> toJson() => {
        "ofSedeId": ofSedeId,
        "sede": sede.toJson(),
        "est": est,
        "sedeId": sedeId,
        "ofertaId": ofertaId,
      };
}

class Sede {
  Sede({
    this.sedeId,
    this.sedeNom,
    this.sedeLat,
    this.sedeLng,
    this.sedeTel,
    this.est,
    this.distId,
    this.empresaId,
  });

  int sedeId;
  String sedeNom;
  String sedeLat;
  String sedeLng;
  String sedeTel;
  bool est;
  int distId;
  int empresaId;

  factory Sede.fromJson(Map<String, dynamic> json) => Sede(
        sedeId: json["sedeId"],
        sedeNom: json["sedeNom"],
        sedeLat: json["sedeLat"],
        sedeLng: json["sedeLng"],
        sedeTel: json["sedeTel"],
        est: json["est"],
        distId: json["distId"],
        empresaId: json["empresaId"],
      );

  Map<String, dynamic> toJson() => {
        "sedeId": sedeId,
        "sedeNom": sedeNom,
        "sedeLat": sedeLat,
        "sedeLng": sedeLng,
        "sedeTel": sedeTel,
        "est": est,
        "distId": distId,
        "empresaId": empresaId,
      };
}

class TipoofId {
  TipoofId({
    this.tipoOfId,
    this.tipoOfDesc,
    this.est,
  });

  int tipoOfId;
  String tipoOfDesc;
  bool est;

  factory TipoofId.fromJson(Map<String, dynamic> json) => TipoofId(
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

class Imagen {
  Imagen({
    this.imagenId,
    this.imagenUrl,
    this.est,
  });

  int imagenId;
  String imagenUrl;
  bool est;

  factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        imagenId: json["imagenId"],
        imagenUrl: json["imagenUrl"],
        est: json["est"],
      );

  Map<String, dynamic> toJson() => {
        "imagenId": imagenId,
        "imagenUrl": imagenUrl,
        "est": est,
      };
}
