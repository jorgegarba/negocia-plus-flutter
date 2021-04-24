import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/services/advertising_space_service.dart';

enum NotifierState { initial, loading, loaded }

class ScanResultViewModel with ChangeNotifier {
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Failure _failure;
  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  Future<void> canjear({BuildContext context, int sedeId}) async {
    _setState(NotifierState.loading);
    try {
      final bool response =
          await AdvertisingSpaceService().canjeSecure(sedeId: sedeId);
      if (response) {
        Navigator.pushNamed(context, Routes.scanSuccessRoute);
      } else {
        _setState(NotifierState.initial);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Código QR"),
                  content: Text('Codigo QR ya canjeado'),
                  actions: [],
                ));
      }
    } on Failure catch (f) {
      _setFailure(f);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Código QR"),
                content: Text(f.message),
                actions: [],
              ));
    }
    _setState(NotifierState.loaded);
  }
}
