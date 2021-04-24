import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:negocia/constants.dart';

import 'package:negocia/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  Uninitialized,
  AuthenticatedCLI,
  AuthenticatedADMIN,
  AuthenticatedSUPERADMIN,
  Authenticating,
  Unauthenticated
}

class UserProvider with ChangeNotifier {
  Status _status = Status.Uninitialized;
  Status get status => _status;

  UserService _userService = UserService();
  SharedPreferences _prefs;

  UserProvider({this.load}) {
    loginState();
  }
  bool load = false;
  void loadingAuth(bool loading) {
    load = loading;
    notifyListeners();
  }

  Future<String> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      bool isLogged;
      String rol;
      await _userService.login(email, password).then((value) {
        isLogged = value;
      });
      _prefs = await SharedPreferences.getInstance();
      final userId = _prefs.getInt(preff_user_id).toString();

      await _userService.getRolUser(userId).then((value) async {
        rol = value;
      });

      _prefs.setBool('isLoggedIn', true);
      if (rol != null && isLogged == true) {
        return rol;
      } else {
        return null;
      }
    } catch (e) {
      print("SigInProviderCATCH");
      print(e);
      _status = Status.Unauthenticated;
      notifyListeners();
      return null;
    }
  }

  Future signOut() async {
    _prefs.clear();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void loginState() async {
    print("LOGIN STATE");
    _status = Status.Authenticating;
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('isLoggedIn')) {
      _prefs = await SharedPreferences.getInstance();
      final userRol = json.decode(_prefs.getString(preff_user_rol));
      print('rol ==============> $userRol');
      if (userRol == "CLI") {
        _status = Status.AuthenticatedCLI;
      } else if (userRol == "ADMIN") {
        _status = Status.AuthenticatedADMIN;
      } else if (userRol == "SUPERADMIN") {
        _status = Status.AuthenticatedSUPERADMIN;
      } else {
        _status = Status.Unauthenticated;
      }

      notifyListeners();
    } else {
      _prefs.clear();
      // _loading = false;
      _status = Status.Unauthenticated;
      notifyListeners();
    }
  }
}
