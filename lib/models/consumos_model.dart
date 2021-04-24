import 'dart:convert';

Consumos consumosFromJson(String str) => Consumos.fromJson(json.decode(str));

String consumosToJson(Consumos data) => json.encode(data.toJson());

class Consumos {
  Consumos({
    this.ofertaSede,
    this.canjeFech,
  });

  OfertaSede ofertaSede;
  DateTime canjeFech;

  factory Consumos.fromJson(Map<String, dynamic> json) => Consumos(
        ofertaSede: OfertaSede.fromJson(json["ofertaSede"]),
        canjeFech: DateTime.parse(json["canjeFech"]),
      );

  Map<String, dynamic> toJson() => {
        "ofertaSede": ofertaSede.toJson(),
        "canjeFech":
            "${canjeFech.year.toString().padLeft(4, '0')}-${canjeFech.month.toString().padLeft(2, '0')}-${canjeFech.day.toString().padLeft(2, '0')}",
      };
}

class OfertaSede {
  OfertaSede({
    this.oferta,
  });

  Oferta oferta;

  factory OfertaSede.fromJson(Map<String, dynamic> json) => OfertaSede(
        oferta: Oferta.fromJson(json["oferta"]),
      );

  Map<String, dynamic> toJson() => {
        "oferta": oferta.toJson(),
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
