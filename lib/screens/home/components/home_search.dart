import 'package:flutter/material.dart';
import 'package:negocia/screens/home/providers/home_provider.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class HomeSearch extends StatefulWidget {
  HomeSearch({Key key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Column(
        children: [
          buildNameTextFormField(homeProvider: homeProvider, context: context),
        ],
      ),
    ));
  }

  TextFormField buildNameTextFormField(
      {HomeProvider homeProvider, BuildContext context}) {
    return TextFormField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.search,
      onChanged: (name) => homeProvider.validateSearch(search: name),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        homeProvider.getBannersWithName();
      },
      decoration: InputDecoration(
        labelText: "Buscador",
        hintText: "Buscar promosiones",
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kprimaryColorYellow),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kprimaryColorYellow),
          gapPadding: 10,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kprimaryColorYellow),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kprimaryColorYellow),
          gapPadding: 10,
        ),
      ),
    );
  }
}
