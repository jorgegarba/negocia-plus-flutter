import 'package:flutter/material.dart';
import 'package:negocia/components/form_error.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/sign_up/providers/sign_up_confirm_provider.dart';
import 'package:negocia/screens/sign_up/providers/sign_up_provider.dart';
import 'package:negocia/size_config.dart';
import 'package:provider/provider.dart';

class SignUpConfirmForm extends StatelessWidget {
  final String email;
  final String password;
  SignUpConfirmForm({
    Key key,
    @required this.email,
    @required this.password,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var signUpProvider =
        Provider.of<SignUpConfirmProvider>(context, listen: false);
    print('===== RELOAD =====');
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          buildNameTextFormField(signUpProvider: signUpProvider),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildLastNameTextFormField(signUpProvider: signUpProvider),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildDniTextFormField(signUpProvider: signUpProvider),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPhoneTextFormField(signUpProvider: signUpProvider),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Consumer<SignUpConfirmProvider>(builder: (context, provider, widget) {
            return FormError(errors: provider.error);
          }),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(100),
            child: Consumer<SignUpConfirmProvider>(
              // ignore: missing_return
              builder: (_, notifier, __) {
                if (notifier.state == NotifierState.initial) {
                  return FlatButton(
                    color: primaryColorPurple,
                    onPressed: () => signUpProvider.registerUser(
                        context: context, email: email, password: password),
                    child: Text(
                      "Registrarme",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  );
                } else if (notifier.state == NotifierState.loading) {
                  return FlatButton(
                      color: primaryColorPurple,
                      onPressed: () {},
                      child: CircularProgressIndicator());
                } else if (notifier.state == NotifierState.loaded) {
                  return FlatButton(
                    color: primaryColorPurple,
                    onPressed: () {},
                    child: Text(
                      "Registrarme",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  TextFormField buildNameTextFormField({SignUpConfirmProvider signUpProvider}) {
    return TextFormField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      initialValue: signUpProvider.name ?? '',
      onChanged: (name) => signUpProvider.validateName(name: name),
      decoration: InputDecoration(
        labelText: "Nombres",
        hintText: "Ingresa tus nombres",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildLastNameTextFormField(
      {SignUpConfirmProvider signUpProvider}) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      initialValue: signUpProvider.lastName ?? '',
      onChanged: (lastName) =>
          signUpProvider.validateLastName(lastName: lastName),
      decoration: InputDecoration(
        labelText: "Apellidos",
        hintText: "Ingrese su apellido Materno y paterno",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildDniTextFormField({SignUpConfirmProvider signUpProvider}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 8,
      initialValue: signUpProvider.dni ?? '',
      onChanged: (dni) => signUpProvider.validateDni(dni: dni),
      decoration: InputDecoration(
        labelText: "Nro de Dni",
        hintText: "Ingresa Dni",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPhoneTextFormField(
      {SignUpConfirmProvider signUpProvider}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 9,
      initialValue: signUpProvider.cellphone ?? '',
      onChanged: (phone) => signUpProvider.validateCellphone(cellphone: phone),
      decoration: InputDecoration(
        labelText: "Nro Celular",
        hintText: "Ingresa su número de celular",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
