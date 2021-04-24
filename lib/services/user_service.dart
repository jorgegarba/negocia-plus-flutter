import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/globals.dart';
import 'package:negocia/models/user_model.dart';
import 'package:negocia/utils/network-util.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  SharedPreferences _preferences;
  NetworkUtil _netUtil = new NetworkUtil();
  static final _baseUrl = "$API/usuario";
  static final _loginUrl = "$_baseUrl/login";
  static final _userURL = "$_baseUrl";
  static final _personaUrl = "$API/persona/";

  Future<bool> validateATokenAndUserId({@required String response}) async {
    _preferences = await SharedPreferences.getInstance();
    try {
      //GET TOKEN
      dynamic decodedjson = json.decode(response);
      String jsonStringFormat =
          decodedjson['tokens'].toString().replaceAll("'", '"');
      final token = json.decode(jsonStringFormat);
      //Valid and save Token and userId
      bool isValidToken =
          NetworkUtil().validateIfTokenExpired(token: token['access']);
      if (isValidToken) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token['access']);
        await _preferences.setInt(preff_user_id, decodedToken['user_id']);
        await _preferences.setString(preff_token, token['access']);
      } else {
        return false;
      }
      return true;
    } catch (e) {
      // if we have a exception, the user will exit the application.
      print('error: $e');
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      var response = await http
          .post(_loginUrl, body: {"email": username, "password": password});
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      validateATokenAndUserId(response: res).then((isValid) {
        if (!isValid) {
          print('######### Login Return No Valid #########');
          return false;
        }
      });
      // print(new User.map(res).toString());
      print('######### Termina el ciclo de validacion #########');
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  bool isLogged(String token) {
    var status = true;
    return status;
  }

  Future<void> signOut() async {
    print('cleaning');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }

  Future<String> getRolUser(String userId) async {
    _preferences = await SharedPreferences.getInstance();
    return _netUtil.get('$_userURL/$userId').then((dynamic res) async {
      final user = User.fromJson(res['content']);
      await _preferences.setString(preff_user_object, jsonEncode(user));
      await _preferences.setString(preff_user_rol, jsonEncode(user.usuTipo));
      return user.usuTipo;
    });
  }
}
