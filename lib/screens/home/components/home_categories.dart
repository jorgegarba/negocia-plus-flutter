import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/categories.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/home/components/filter_category_item.dart';
import 'package:negocia/screens/home/components/filter_subcategory_item.dart';
import 'package:negocia/screens/home/components/subtitle_screens.dart';
import 'package:negocia/services/filter_service.dart';
import 'package:negocia/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCategories extends StatefulWidget {
  HomeCategories({Key key}) : super(key: key);

  @override
  _HomeCategoriesState createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  SharedPreferences _preferences;
  FilterService _filterService = FilterService();

  List<CategoriaNegocio> _listCategory = List<CategoriaNegocio>();
  List _listCategorySelected = List();
  List<CategoriaItems> _listSubCategory = List<CategoriaItems>();
  List _listSubCategorySelected = List();

  _getLists() {
    _filterService.getCategories().then((value) {
      _listCategory = value;
      setState(() {});
    });
    _filterService.getCategoriesItems().then((value) {
      _listSubCategory = value;
      setState(() {});
    });
  }

  Future<void> _getListsChanged() async {
    _preferences = await SharedPreferences.getInstance();
    final listCategorySelected =
        _preferences.getString(preff_category_selected);
    _listCategorySelected =
        listCategorySelected == null ? [] : json.decode(listCategorySelected);
    setState(() {});

    final listSubCategorySelected =
        _preferences.getString(preff_category_item_selected);
    _listSubCategorySelected = listSubCategorySelected == null
        ? []
        : json.decode(listSubCategorySelected);
    setState(() {});
  }

  @override
  void initState() {
    _getLists();
    _getListsChanged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              SubtitleForScreens(subtitle: "Categorias"),
              _createCategory(),
              FlatButton(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.homeFilterRoute),
                child: Text(
                  "Filtros",
                  style: TextStyle(
                    color: primaryColorPurple,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              _createSubCategory(),
            ]),
      ),
    );
  }

  Widget _createCategory() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _listCategory.length, //snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            final id = _listCategory[index].catNegId;
            // print('_listCategorySelected: $_listCategorySelected');
            int ispainted = _listCategorySelected
                .firstWhere((element) => element == id, orElse: () => null);
            var color =
                ispainted != null ? kprimaryColorPurple : kprimaryColorYellow;

            return InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.homeFilterRoute),
              child: FilterCategoryItem(
                backgroundColor: color,
                size: 100,
                icon: FontAwesomeIcons.accessibleIcon,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(left: 15),
                text: _listCategory[index].catNegDesc,
              ),
            );
          }),
    );
  }

  Widget _createSubCategory() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _listSubCategory.length,
          itemBuilder: (BuildContext context, int index) {
            final id = _listSubCategory[index].catVarId;
            // print('_listSubCategorySelected: $_listSubCategorySelected');
            int ispainted = _listSubCategorySelected
                .firstWhere((element) => element == id, orElse: () => null);
            var color =
                ispainted != null ? kprimaryColorPurple : kprimaryColorYellow;
            var isVisible;
            if (_listCategorySelected.isEmpty) {
              isVisible = true;
            } else {
              isVisible = _listCategorySelected.firstWhere(
                  (element) => element == _listSubCategory[index].catNegId,
                  orElse: () => false);
              isVisible = isVisible == false ? false : true;
            }
            // print(
            //     'isVisible: $isVisible && _listCategorySelected: $_listCategorySelected');
            return Visibility(
              visible: isVisible,
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.homeFilterRoute),
                child: FilterSubCategoryItem(
                  backgroundColor: color,
                  size: 100,
                  icon: FontAwesomeIcons.accessibleIcon,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 15),
                  text: _listSubCategory[index].catVarDesc,
                ),
              ),
            );
          }),
    );
  }
}
