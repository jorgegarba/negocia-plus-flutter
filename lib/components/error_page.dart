import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/routing/router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key keym, @required this.rol});
  final String rol;
  _returnPage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.initialRoute, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola!'),
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.purple,
              size: 35,
            ),
            onPressed: () => _returnPage(context),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('PAGINA EN PRODUCCION PARA $rol'),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: primaryColorPurple,
              onPressed: () => _returnPage(context),
              child: Text(
                'VOLVER',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
