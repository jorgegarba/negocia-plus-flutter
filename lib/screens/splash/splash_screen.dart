import 'package:flutter/material.dart';
import 'package:negocia/screens/splash/components/body.dart';
import 'package:negocia/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
