import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:negocia/globals.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/providers/user_provider.dart';

class UserRepository {
  final String apiUrl = API;
  static final _personaUrl = "$API/persona/";
  //metodo http

  Future<String> registerPer() async {
    await Future.delayed(Duration(milliseconds: 500));
    //! No Internet Connection
    // throw SocketException('No Internet');
    //! 404
    throw HttpException('404');
    //! Invalid JSON (throws FormatException)
    // return 'abcd';
    // return '{ "perId": 12,"perNom": "Alonso Ernesto","perApe": "Lozano Medez","perDni": "74363102","personas": []}';
  }

  Future<String> _postRegisterPerson(
      {String name, String lastName, String dni, String email}) async {
    final response = await http.post(_personaUrl, headers: {
      "Accept": "application/json"
    }, body: {
      'perNom': name,
      'perApe': lastName,
      'perDni': dni,
      'email': email
    });
    return response.body;
  }

  Future<String> _postRegisterUser(
      {String password, String email, String cellphone, int perId}) async {
    Map user = {
      "password": "$password",
      "is_superuser": false,
      "usuMail": "$email",
      "usuTipo": "CLI",
      "usuFono": "$cellphone",
      "usuModo": "EMAIL",
      "is_active": "true",
      "is_staff": "true",
      "perId": perId
    };
    var body = json.encode(user);
    final response = await http.post(API + '/usuario/registro',
        headers: {"Content-Type": "application/json"}, body: body);
    return response.body;
  }

  Future<void> _registerClient(
      {@required String name,
      @required String lastName,
      @required String dni,
      @required String email,
      @required String password,
      @required String cellphone}) async {
    String responseRegisterPerson = await _postRegisterPerson(
        name: name, lastName: lastName, dni: dni, email: email);
    Map decodeRegisterPerson = json.decode(responseRegisterPerson);
    print('decodeRegisterPerson: $decodeRegisterPerson');
    int personId = decodeRegisterPerson["content"]["perId"];
    if (personId != null) {
      String responseRegisterUser = await _postRegisterUser(
          email: email,
          password: password,
          cellphone: cellphone,
          perId: personId);
      Map decodeRegisterUser = json.decode(responseRegisterUser);
      print('decodeRegisterUser: $decodeRegisterUser');
    }
  }

  Future<String> registerClientSecure(
      {@required String name,
      @required String lastName,
      @required String dni,
      @required String email,
      @required String cellphone,
      @required String password}) async {
    try {
      await _registerClient(
          cellphone: cellphone,
          dni: dni,
          email: email,
          lastName: lastName,
          name: name,
          password: password);
      return UserProvider().signIn(email, password);
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
