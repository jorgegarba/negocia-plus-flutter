import 'package:flutter/foundation.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/screens/home_admin/spaces/data/models/empresa_model.dart';
import 'package:negocia/screens/home_admin/spaces/data/services/home_admin_services.dart';

enum NotifierState { initial, loading, loaded }

class SpacesProvider with ChangeNotifier {
  final _homeAdminervice = HomeAdminervice();

  String _value = 'value';
  String get value => _value;

  EmpresaModel _empresa = EmpresaModel();
  EmpresaModel get empresa => _empresa;

  List<Pago> _pago = [];
  List<Pago> get pago => _pago;

  SpacesProvider() {
    print('========= PlanProvider inicializado ==========');
    setValue();
    getEmpresaData();
  }

  setValue() {
    _value = 'new value';
  }

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  void _setEmpresaData(EmpresaModel empresa) {
    _empresa = empresa;
    _pago = _empresa.pagos;
    notifyListeners();
  }

  Failure _failure;
  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _empresa = EmpresaModel();
    _failure = failure;
    notifyListeners();
  }

  Future<void> getEmpresaData() async {
    _setState(NotifierState.loading);
    try {
      final empresa = await _homeAdminervice.getEmpresaData(sedeId: '1');
      _setEmpresaData(empresa);
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }
}
