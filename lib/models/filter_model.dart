class FilterModel {
  final dynamic catnegId;
  final dynamic catvarId;
  final dynamic dptoId;
  final dynamic provId;
  final dynamic distId;
  final int tipoofertaId;

  FilterModel(
      {this.catnegId,
      this.catvarId,
      this.dptoId,
      this.provId,
      this.distId,
      this.tipoofertaId});

  factory FilterModel.fromJson(Map<String, dynamic> parsedJson) {
    return FilterModel(
      catnegId: parsedJson['catneg_id'],
      catvarId: parsedJson['catvar_id'],
      dptoId: parsedJson['dpto_id'],
      provId: parsedJson['prov_id'],
      distId: parsedJson['dist_id'],
      tipoofertaId: parsedJson['tipooferta_id'],
    );
  }
}
