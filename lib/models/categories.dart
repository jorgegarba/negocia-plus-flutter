import 'dart:convert';

String categoriaToJson(CategoriaNegocio data) => json.encode(data.toJson());

class CategoriaNegocio {
  CategoriaNegocio({
    this.catNegId,
    this.catNegDesc,
    this.est,
    this.imagenId,
  });

  int catNegId;
  String catNegDesc;
  bool est;
  dynamic imagenId;

  factory CategoriaNegocio.fromJson(Map<String, dynamic> json) =>
      CategoriaNegocio(
        catNegId: json["catNegId"],
        catNegDesc: json["catNegDesc"],
        est: json["est"],
        imagenId: json["imagenId"],
      );

  Map<String, dynamic> toJson() => {
        "catNegId": catNegId,
        "catNegDesc": catNegDesc,
        "est": est,
        "imagenId": imagenId,
      };
}

CategoriaItems categoriaItemsFromJson(String str) =>
    CategoriaItems.fromJson(json.decode(str));

String categoriaItemsToJson(CategoriaItems data) => json.encode(data.toJson());

class CategoriaItems {
  CategoriaItems({
    this.catVarId,
    this.categoriaNegocio,
    this.catVarDesc,
    this.est,
    this.catNegId,
    this.imagenId,
  });

  int catVarId;
  CategoriaNegocio categoriaNegocio;
  String catVarDesc;
  bool est;
  int catNegId;
  dynamic imagenId;

  factory CategoriaItems.fromJson(Map<String, dynamic> json) => CategoriaItems(
        catVarId: json["catVarId"],
        categoriaNegocio: CategoriaNegocio.fromJson(json["categoriaNegocio"]),
        catVarDesc: json["catVarDesc"],
        est: json["est"],
        catNegId: json["catNegId"],
        imagenId: json["imagenId"],
      );

  Map<String, dynamic> toJson() => {
        "catVarId": catVarId,
        "categoriaNegocio": categoriaNegocio.toJson(),
        "catVarDesc": catVarDesc,
        "est": est,
        "catNegId": catNegId,
        "imagenId": imagenId,
      };
}
