import 'package:flutter/material.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/services/user_service.dart';

AppBar screensWrapperAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Image.asset(
      'assets/icons/logo-1.png',
      height: 20,
    ),
    actions: [
      Row(
        children: [
          // IconButton(
          //     icon: Icon(
          //       Icons.format_list_numbered_rtl,
          //       color: Colors.purple,
          //     ),
          //     onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.input,
                color: Colors.red,
                size: 27,
              ),
              onPressed: () {
                UserService().signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.initialRoute, (Route<dynamic> route) => false);
              }),
        ],
      )
    ],
  );
}
