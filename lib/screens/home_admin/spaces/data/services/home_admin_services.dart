import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:negocia/globals.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:http/http.dart' as http;
import 'package:negocia/screens/home_admin/spaces/data/models/empresa_model.dart';

class HomeAdminervice {
  static final _baseUrl = "$API/empresa";
  static final _pagos = "$_baseUrl/pagoEmp";

  Future<EmpresaModel> getEmpresaData({@required String sedeId}) async {
    try {
      final response = await http.get('$_pagos/$sedeId');
      final dynamic body = response.body;
      final decode = json.decode(body)['content'];
      final object = EmpresaModel.fromJson(decode);
      return object;
    } on SocketException {
      throw Failure('Verifique su conexión a Internet 😑');
    } on HttpException {
      throw Failure("Vuelve a intenterlo");
    } on FormatException {
      throw Failure("Verifique su información por favor");
    }
  }
}
