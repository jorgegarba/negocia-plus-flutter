import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/screens/banner/components/body.dart';

class Banner2Screen extends StatelessWidget {
  const Banner2Screen({this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Don toribio > Restaurante'),
        backgroundColor: secondaryColorYellow,
      ),
      body: Body(id),
    );
  }
}
