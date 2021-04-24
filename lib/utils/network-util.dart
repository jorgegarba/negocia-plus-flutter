import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:negocia/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkUtil {
  final JsonDecoder _decoder = new JsonDecoder();
  SharedPreferences _preferences;
  final String noToken = "noToken";
  final String withToken = "withToken";

  bool validateIfTokenExpired({@required String token}) {
    print('token: $token');
    try {
      // validate if token has expired
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (!isTokenExpired) {
        print('with valid token');
        return true;
      } else {
        // send function to renovate token here
        print("with invalid token");
        // if a token is not found in the response, the user will exit the application.
        // create logout function
        return false;
      }
    } catch (e) {
      print('error: $e');
      return false;
    }
  }

  Future<dynamic> get(String url) async {
    _preferences = await SharedPreferences.getInstance();
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      // final token = _preferences.getString(preff_token);
      // bool isValidToken = validateIfTokenExpired(token: token);
      // if (!isValidToken) {
      //   return [];
      // }
      print('######### Termina la peticion GET #########');
      return jsonDecode(res);
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) async {
    _preferences = await SharedPreferences.getInstance();
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) async {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      // final token = _preferences.getString(preff_token) ?? noToken;
      // bool isValidToken = validateIfTokenExpired(token: token);
      // if (!isValidToken) {
      //   return [];
      // }
      print('######### Termina la peticion POST #########');
      return _decoder.convert(res);
    });
  }
}
