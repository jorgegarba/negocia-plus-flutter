import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileProvider with ChangeNotifier {
  User _user = User();
  User get user => _user;

  SharedPreferences _preferences;

  MyProfileProvider() {
    _getUserData();
  }

  Future<void> _getUserData() async {
    _preferences = await SharedPreferences.getInstance();
    final userData = _preferences.getString(preff_user_object);
    Map userMap = userData == null ? [] : json.decode(userData);
    this._user = User.fromJson(userMap);
    notifyListeners();
  }
}
