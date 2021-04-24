import 'package:flutter/material.dart';
import 'package:negocia/screens/sign_up/components/sign_up_confirm_form.dart';
import 'package:negocia/screens/sign_up/providers/sign_up_confirm_provider.dart';
import 'package:negocia/size_config.dart';
import 'package:provider/provider.dart';

class SignUpConfirm extends StatelessWidget {
  const SignUpConfirm({
    Key key,
    @required this.email,
    @required this.password,
  }) : assert(email != null, password != null);
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmar Registro'),
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
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Text(
                    "Confirmar Registro",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.5),
                  ),
                  ChangeNotifierProvider<SignUpConfirmProvider>(
                    create: (context) => SignUpConfirmProvider(),
                    child: SignUpConfirmForm(
                      email: email,
                      password: password,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
