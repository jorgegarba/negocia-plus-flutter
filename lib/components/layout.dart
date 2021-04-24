import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final double padding;
  Layout({@required this.child, this.padding = 0.0});

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
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(padding),
            child: child,
          )),
        ),
      ),
    );
  }
}
