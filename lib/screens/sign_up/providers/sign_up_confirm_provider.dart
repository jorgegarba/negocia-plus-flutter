import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/models/user_register.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/services/user_repository.dart';
import 'package:regexed_validator/regexed_validator.dart';

enum NotifierState { initial, loading, loaded }

class SignUpConfirmProvider extends ChangeNotifier {
  final _userRepository = UserRepository();
  List<String> _error = [];
  List<String> get error => _error;

  String _name;
  String _lastName;
  String _dni;
  String _cellphone;

  String get name => _name;
  String get lastName => _lastName;
  String get dni => _dni;
  String get cellphone => _cellphone;

  bool get isValid {
    print(
        'error: $error - name: $name - lastName: $lastName - dni: $dni - cellphone: $cellphone');
    if (error.isEmpty &&
        name != null &&
        lastName != null &&
        dni != null &&
        cellphone != null) {
      return true;
    } else {
      return false;
    }
  }

  validateName({String name}) {
    if (validator.name(name) && name.isNotEmpty) {
      _name = name;
      _error.remove(nameError);
    } else if (!_error.contains(nameError)) {
      _error.add(nameError);
    }
    notifyListeners();
  }

  validateLastName({String lastName}) {
    if (validator.name(lastName) && lastName.isNotEmpty) {
      _lastName = lastName;
      _error.remove(lastNameError);
    } else if (!_error.contains(lastNameError)) {
      _error.add(lastNameError);
    }
    notifyListeners();
  }

  validateDni({String dni}) {
    if (dni.length == 8) {
      _dni = dni;
      _error.remove(dniError);
    } else if (!_error.contains(dniError)) {
      _error.add(dniError);
    }
    notifyListeners();
  }

  validateCellphone({String cellphone}) {
    if (cellphone.length == 9) {
      _cellphone = cellphone;
      _error.remove(cellphoneError);
    } else if (!_error.contains(cellphoneError)) {
      _error.add(cellphoneError);
    }
    notifyListeners();
  }

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Person _post;
  Person get post => _post;
  void _setPost(Person post) {
    _post = post;
    notifyListeners();
  }

  Failure _failure;
  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  Future<void> registerUser(
      {@required BuildContext context,
      @required String email,
      @required String password}) async {
    print('email: $email - password: $password');
    _setState(NotifierState.loading);
    try {
      if (isValid) {
        print('Is Valid');
        String rol = await _userRepository.registerClientSecure(
            name: name,
            email: email,
            dni: dni,
            lastName: lastName,
            cellphone: cellphone,
            password: password);
        if (rol != null) {
          _setState(NotifierState.loaded);
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.homeRoute, (Route<dynamic> route) => false,
              arguments: ({'rol': rol}));
        } else {
          _buildSnackBar(context: context, message: "Vuelva a intentarlo");
          _setState(NotifierState.initial);
        }
      } else {
        _buildSnackBar(context: context, message: "Ingrese todos los campos");
        _setState(NotifierState.initial);
      }
    } on Failure catch (f) {
      // _setFailure(f);
      _setState(NotifierState.initial);
      _buildSnackBar(context: context, message: f.message);
    }
  }

  _buildSnackBar({BuildContext context, String message}) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              message,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
