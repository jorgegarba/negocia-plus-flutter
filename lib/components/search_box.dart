import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 55,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Buscar Promociones",
            hintText: "Buscar Promociones",
            prefixIcon: Icon(
              Icons.search,
              color: primaryColorYellow,
            )),
      ),
    );
  }
}
