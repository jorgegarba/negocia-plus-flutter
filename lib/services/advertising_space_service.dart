import 'dart:convert';
import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/globals.dart';
import 'package:negocia/models/consumos_model.dart';
import 'package:negocia/models/espacios_model.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/utils/network-util.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AdvertisingSpaceService {
  NetworkUtil _netUtil = new NetworkUtil();

  static final _baseUrl = "$API/oferta";

  static final _advertisingSpaceUrl = "$_baseUrl/espacio";
  static final _advertisingPer = '$_baseUrl/per';
  static final _advertisingPerwithName = '$_baseUrl/busqueda';
  static final _canjeUrl = "$_baseUrl/canje";
  static final _validateCanjeUrl = "$_baseUrl/validar";
  static final _consumosURL = "$_baseUrl/consumos";

  Future<String> _getAdvertisingSpace() async {
    final response = await http.get(_advertisingSpaceUrl);
    return response.body;
  }

  Future<String> _getAdvertisingSpaceWithName({String name}) async {
    final response = await http.get('$_advertisingPerwithName/$name');
    return response.body;
  }

  Future<List<EspaciosModel>> getAdvertisingSpaceWithNameSecure(
      {@required String name}) async {
    try {
      if (name == null || name == '') {
        print('NO name: $name');
        String response = await _getAdvertisingSpace();
        final decodeResponse = json.decode(response)['results'];
        print(decodeResponse);
        final object = List<EspaciosModel>.from(decodeResponse
            .map((categories) => EspaciosModel.fromJson(categories)));
        return object;
      } else {
        print('Name: $name');
        String response = await _getAdvertisingSpaceWithName(name: name);
        final decodeResponse = json.decode(response)['content'];
        final object =
            List<EspaciosModel>.from(decodeResponse.map((categories) {
          print(EspaciosModel().espacioTit);
          return EspaciosModel.fromJson(categories);
        }));
        return object;
      }
    } on SocketException {
      // No Internet connection 😑
      throw Failure('Verifique su conexión a Internet 😑');
    } on HttpException {
      // Couldn't find the post
      throw Failure("Vuelve a intenterlo");
    } on FormatException {
      // Bad response format 👎
      throw Failure("Verifique su información por favor");
    }
  }

  Future<List<EspaciosModel>> postAdvertisingSpace() async {
    return _netUtil.post(_advertisingPer, body: {
      "catneg_id": "null",
      "catvar_id": "null",
      "dpto_id": "null",
      "prov_id": "null",
      "dist_id": "null",
      "tipooferta_id": "null"
    }).then((dynamic res) {
      final _categories = res['ok'][0]["todos"];
      final object = List<EspaciosModel>.from(
          _categories.map((categories) => EspaciosModel.fromJson(categories)));
      return object;
    });
  }

  Future<bool> _postCanje(
      {@required String dateNow,
      @required int usuId,
      @required int sedeId}) async {
    final response = await http.post(_canjeUrl,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "canjeFech": dateNow,
          "est": true,
          "usuId": usuId,
          "ofSedeId": sedeId
        }));
    print('response postCanje: ${jsonDecode(response.body)}');
    return jsonDecode(response.body)['ok'];
  }

  Future<String> _validateCanje(
      {@required int usuId, @required int ofsede}) async {
    final response = await http.post(_validateCanjeUrl,
        headers: {"Content-Type": "application/json"},
        //TODO: CAMBIAR usuId POR EL QUE VIENE
        body: jsonEncode({"usuId": 2, "ofsede": ofsede}));
    print('validate Canje: ${jsonDecode(response.body)}, usuId: $usuId');
    return jsonDecode(response.body)['message'];
  }

  Future<bool> validCajeSecure({@required int sedeId}) async {
    try {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      final int usuId = _preferences.getInt(preff_user_id);
      final String message = await _validateCanje(usuId: usuId, ofsede: sedeId);
      return message == "Usuario habilitado" ? true : false;
    } on SocketException {
      // No Internet connection 😑
      throw Failure('Verifique su conexión a Internet 😑');
    } on HttpException {
      // Couldn't find the post
      throw Failure("Vuelve a intenterlo");
    } on FormatException {
      // Bad response format 👎
      throw Failure("Verifique su información por favor");
    }
  }

  Future<bool> canjeSecure({@required int sedeId}) async {
    try {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      final int usuId = _preferences.getInt(preff_user_id);
      final String dateNow =
          formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
      return await _postCanje(dateNow: dateNow, usuId: usuId, sedeId: sedeId);
    } on SocketException {
      // No Internet connection 😑
      throw Failure('Verifique su conexión a Internet 😑');
    } on HttpException {
      // Couldn't find the post
      throw Failure("Vuelve a intenterlo");
    } on FormatException {
      // Bad response format 👎
      throw Failure("Verifique su información por favor");
    }
  }

  Future<dynamic> _consumos() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    final int usuId = _preferences.getInt(preff_user_id);

    final response = await http.post(_consumosURL,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"usuId": usuId}));
    return jsonDecode(response.body)['resultado'];
  }

  Future<List<Consumos>> consumosSecure() async {
    try {
      final response = await _consumos();
      final object = List<Consumos>.from(
          response.map((consumo) => Consumos.fromJson(consumo)));
      return object ?? [];
    } on SocketException {
      // No Internet connection 😑
      throw Failure('Verifique su conexión a Internet 😑');
    } on HttpException {
      // Couldn't find the post
      throw Failure("Vuelve a intenterlo");
    } on FormatException {
      // Bad response format 👎
      throw Failure("Verifique su información por favor");
    }
  }
}
