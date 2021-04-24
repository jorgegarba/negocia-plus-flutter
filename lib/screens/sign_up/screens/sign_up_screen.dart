import 'package:flutter/material.dart';
import 'package:negocia/screens/sign_up/components/sign_up_form.dart';
import 'package:negocia/screens/sign_up/providers/sign_up_provider.dart';
import 'package:negocia/size_config.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20.0)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Registrarse",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.5),
                    ),
                    Text(
                      'Regístrate con tu correo electrónico  \ny contraseña o con google',
                      textAlign: TextAlign.center,
                    ),
                    ChangeNotifierProvider<SignUpProvider>(
                        create: (context) => SignUpProvider(),
                        child: SignUpForm()),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
