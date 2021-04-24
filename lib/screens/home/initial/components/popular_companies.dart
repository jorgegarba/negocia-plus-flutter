import 'package:flutter/material.dart';

class PopularCompanies extends StatelessWidget {
  const PopularCompanies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopularCompanie();
  }
}

class PopularCompanie extends StatelessWidget {
  const PopularCompanie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
