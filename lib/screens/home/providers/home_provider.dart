import 'package:flutter/widgets.dart';
import 'package:negocia/models/espacios_model.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/models/validation_item_model.dart';
import 'package:negocia/services/advertising_space_service.dart';

enum NotifierState { initial, loading, loaded }

class HomeProvider with ChangeNotifier {
  List<EspaciosModel> _banners = [];
  List<EspaciosModel> get banners => _banners;

  ValidationItem _search = ValidationItem('', null);
  ValidationItem get search => _search;

  String _planSelected = '';
  String get planSelected => _planSelected;

  bool get isValid {
    if (_search.value != null) {
      return true;
    } else {
      return false;
    }
  }

  validateSearch({String search}) {
    search.isNotEmpty
        ? _search = ValidationItem(search, null)
        : _search = ValidationItem(null, "Campo Buscar vacío");
    notifyListeners();
  }

  HomeProvider() {
    getBannersWithName();
  }

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  void _setListBanners(List<EspaciosModel> banners) {
    this._banners = banners;
    notifyListeners();
  }

  Failure _failure;
  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _banners = [];
    _failure = failure;
    notifyListeners();
  }

  Future<void> getBannersWithName() async {
    _setState(NotifierState.loading);
    try {
      final banners = await AdvertisingSpaceService()
          .getAdvertisingSpaceWithNameSecure(name: this._search.value);
      _setListBanners(banners);
    } on Failure catch (f) {
      print('f: ${f.message}');
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }
}
