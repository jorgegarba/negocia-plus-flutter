import 'package:flutter/cupertino.dart';

class PersonRegister {
  String name;
  String lastName;
  String dni;
  String email;

  PersonRegister(
      {@required this.name,
      @required this.lastName,
      @required this.dni,
      @required this.email});

  Map<String, dynamic> toJson() => {
        "perNom": this.name,
        "perApe": this.lastName,
        "perDni": this.dni,
        "email": this.email
      };
}
