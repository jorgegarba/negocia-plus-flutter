import 'package:flutter/material.dart';
import 'package:negocia/components/form_error.dart';
import 'package:negocia/screens/sign_up/providers/sign_up_provider.dart';
import 'package:negocia/size_config.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    print('===== RELOAD =====');
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          buildEmailTextFormField(signUpProvider: signUpProvider),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPaswordTextFormField(signUpProvider: signUpProvider),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPaswordRepeatTextFormField(signUpProvider: signUpProvider),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Consumer<SignUpProvider>(builder: (context, provider, widget) {
            return FormError(errors: provider.error);
          }),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(100),
            child: RaisedButton(
              onPressed: () => signUpProvider.signUpUser(context: context),
              child: Text(
                "Crear Cuenta",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: SizedConfig.screenHeight * 0.02),
          Text(
            "- o -",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizedConfig.screenHeight * 0.02),
          _registerGoogleFacebook(),
        ],
      ),
    );
  }

  Widget _registerGoogleFacebook() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              height: getProportionateScreenHeight(70),
              width: getProportionateScreenWidth(70),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                shape: BoxShape.circle,
              ),
              child: Image(image: AssetImage('assets/icons/google.png'))),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenHeight(70),
            width: getProportionateScreenWidth(70),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              shape: BoxShape.circle,
            ),
            child: Image(image: AssetImage('assets/icons/facebook.png')),
          ),
        )
      ],
    );
  }

  TextFormField buildEmailTextFormField({SignUpProvider signUpProvider}) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: signUpProvider.email ?? '',
      onChanged: (email) => signUpProvider.validateEmail(email: email),
      decoration: InputDecoration(
        labelText: "Correo Electrónico",
        hintText: "Ingresa tu correo electrónico",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPaswordTextFormField({SignUpProvider signUpProvider}) {
    return TextFormField(
      obscureText: true,
      initialValue: signUpProvider.password ?? '',
      onChanged: (password) =>
          signUpProvider.validatePassword(password: password),
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Ingresa tu contraseña",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPaswordRepeatTextFormField(
      {SignUpProvider signUpProvider}) {
    return TextFormField(
      obscureText: true,
      initialValue: signUpProvider.confirmPassword ?? '',
      onChanged: (password) =>
          signUpProvider.validateConfirmPassword(confirmPassword: password),
      decoration: InputDecoration(
        labelText: "Confirmar Contraseña",
        hintText: "Ingrese su contraseña",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
