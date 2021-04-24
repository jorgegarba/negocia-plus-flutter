import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';

class NoneOffert extends StatelessWidget {
  const NoneOffert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Layout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
            ),
            Image.asset(
              "assets/images/logo-1.png",
              width: 150,
            ),
            SizedBox(
              height: 30,
            ),
            Text("No hay ofertas disponibles"),
          ],
        ),
      ),
    );
  }
}
