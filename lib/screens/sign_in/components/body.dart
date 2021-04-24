import 'package:flutter/material.dart';
import 'package:negocia/components/dropdown_form_field.dart';
import 'package:negocia/components/form_error.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/providers/user_provider.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/services/google_sigin_service.dart';
import 'package:negocia/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-4.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: SizedConfig.screenHeight * 0.04),
                  Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                      color: primaryColorPurple,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizedConfig.screenHeight * 0.01),
                  Text(
                    'Inicia Sesion con tu correo y contraseña \n o con una cuenta de google',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizedConfig.screenHeight * 0.07),
                  SignForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  SignForm({Key key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  SharedPreferences _preferences;
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

  List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var user = Provider.of<UserProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildEmailTextFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordTextFormField(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          MultiProvider(
            providers: [
              ChangeNotifierProvider<UserProvider>(
                create: (context) {
                  return UserProvider();
                },
              ),
            ],
            child: Builder(builder: (BuildContext context) {
              BuildContext rootContext = context;
              var user = Provider.of<UserProvider>(rootContext, listen: true);
              return user.status == Status.Authenticating
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(86),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: primaryColorPurple,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              errors = [];
                            });
                            _formKey.currentState.save();
                            FocusScope.of(context).unfocus();
                            String rol = await user.signIn(email, password);
                            if (rol != null) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  Routes.homeRoute,
                                  (Route<dynamic> route) => false,
                                  arguments: ({'rol': rol}));
                            } else {
                              print("false");
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
                                        "Usuario o contraseña incorrecta",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          'Ingresar',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
            }),
          ),
          SizedBox(height: SizedConfig.screenHeight * 0.02),
          Text(
            "- o -",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizedConfig.screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  GoogleSignInService.signInWithGoogle();
                },
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
          ),
          SizedBox(height: SizedConfig.screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿ No tienes un cuenta ?',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                ),
              ),
              Text(
                '   Registrarse',
                style: TextStyle(
                    color: primaryColorYellow,
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPasswordTextFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        setState(() {
          password = newValue;
        });
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.length >= 6) {
          removeError(error: shortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: shortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Ingresa tu contraseña",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        setState(() {
          email = newValue;
        });
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: invalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: invalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Correo Electrónico",
        hintText: "Ingresa tu correo electrónico",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
