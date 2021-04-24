import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/consumos_model.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/models/user_model.dart';
import 'package:negocia/services/advertising_space_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum NotifierState { initial, loading, loaded }

class MySavingProvider with ChangeNotifier {
  List<Consumos> _consumos = [];
  List<Consumos> get consumos => _consumos;

  double _totalDiscount = 0;
  double get totalDiscount => _totalDiscount;

  // ignore: unused_field
  User _user = User();
  String _fullname = '';
  String get fullname => _fullname;

  SharedPreferences _preferences;

  MySavingProvider() {
    _getConsumos();
    _getUserData();
  }

  Future<void> _getUserData() async {
    _preferences = await SharedPreferences.getInstance();
    final userData = _preferences.getString(preff_user_object);
    Map userMap = userData == null ? [] : json.decode(userData);
    this._user = User.fromJson(userMap);
    String name = _user.perId.perNom ?? '';
    String lastName = _user.perId.perApe ?? '';
    this._fullname = '$name $lastName';
    notifyListeners();
  }

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  void _setListConsumos(List<Consumos> consumos) {
    this._consumos = consumos;
    notifyListeners();
    _getDiscount();
  }

  Failure _failure;
  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _consumos = [];
    _failure = failure;
    notifyListeners();
  }

  Future<void> _getConsumos() async {
    _setState(NotifierState.loading);
    try {
      final consumos = await AdvertisingSpaceService().consumosSecure();
      _setListConsumos(consumos);
    } on Failure catch (f) {
      print('f: ${f.message}');
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }

  void _getDiscount() {
    for (var consumos in this._consumos) {
      final oferta = consumos.ofertaSede.oferta;
      double price = double.parse(oferta.ofertaPreci);
      double priceWithDiscount = double.parse(oferta.ofertaPrecf);
      double totalDiscount = price - priceWithDiscount;
      this._totalDiscount += totalDiscount;
    }
    notifyListeners();
  }
}
