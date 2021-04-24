import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/routing/router.dart';
import 'package:regexed_validator/regexed_validator.dart';

class SignUpProvider extends ChangeNotifier {
  // SignUpProvider({this._error});

  List<String> _error = [];
  List<String> get error => _error;

  String _email;
  String _password;
  String _confirmPassword;

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  bool get isValid {
    if (error.isEmpty &&
        email != null &&
        password != null &&
        confirmPassword != null) {
      return true;
    } else {
      return false;
    }
  }

  validateEmail({String email}) {
    if (validator.email(email) && email.isNotEmpty) {
      _email = email;
      _error.remove(invalidEmailError);
    } else if (!_error.contains(invalidEmailError)) {
      _error.add(invalidEmailError);
    }
    notifyListeners();
  }

  validatePassword({String password}) {
    if (password.length >= 8) {
      _password = password;
      _error.remove(shortPassError);
    } else if (!_error.contains(shortPassError)) {
      _error.add(shortPassError);
    }
    notifyListeners();
  }

  validateConfirmPassword({String confirmPassword}) {
    if (_password == confirmPassword) {
      _confirmPassword = confirmPassword;
      _error.remove(matchPassError);
    } else if (!_error.contains(matchPassError)) {
      _error.add(matchPassError);
    }
    notifyListeners();
  }

  signUpUser({@required BuildContext context}) {
    if (isValid) {
      Navigator.pushNamed(context, Routes.signUpConfirmRoute,
          arguments: ({'email': email, 'password': password}));
    } else {
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
                "Registre Todos los Datos",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }
  }
}
