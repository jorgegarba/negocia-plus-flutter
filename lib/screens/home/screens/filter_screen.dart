import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:negocia/components/dropdown_form_field.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/categories.dart';
import 'package:negocia/models/department_model.dart';
import 'package:negocia/models/district_model.dart';
import 'package:negocia/models/offer_type_model.dart';
import 'package:negocia/models/province_model.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/home/components/filter_category_item.dart';
import 'package:negocia/screens/home/components/filter_subcategory_item.dart';
import 'package:negocia/screens/home/components/subtitle_screens.dart';
import 'package:negocia/services/filter_service.dart';
import 'package:negocia/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeFilter extends StatefulWidget {
  HomeFilter({Key key}) : super(key: key);

  @override
  _HomeFilterState createState() => _HomeFilterState();
}

class _HomeFilterState extends State<HomeFilter> {
  String _offerTypes;

  SharedPreferences _preferences;
  FilterService _filterService = FilterService();

  List<CategoriaNegocio> _listCategory = List<CategoriaNegocio>();
  List<CategoriaItems> _listSubCategory = List<CategoriaItems>();
  List<Department> _listDepartment = List<Department>();
  List<Province> _listProvince = List<Province>();
  List<District> _listDistrict = List<District>();
  List<OfferType> _listOfferType = List<OfferType>();

  List _listCategorySelected = List();
  List _listSubCategorySelected = List();
  Map<String, dynamic> _departmentSelected = Map<String, dynamic>();
  Map<String, dynamic> _provinceSelected = Map<String, dynamic>();
  Map<String, dynamic> _districtSelected = Map<String, dynamic>();
  String _offerTypeSelected = '';
  _getLists() {
    _filterService.getCategories().then((value) {
      _listCategory = value;
      setState(() {});
    });
    _filterService.getCategoriesItems().then((value) {
      _listSubCategory = value;
      setState(() {});
    });
    _filterService.getDepartment().then((value) {
      _listDepartment = value;
      setState(() {});
    });
    _filterService.getProvince().then((value) {
      _listProvince = value;
    });
    _filterService.getDistricts().then((value) {
      _listDistrict = value;
      setState(() {});
    });
    _filterService.getOfferTypes().then((value) {
      _listOfferType = value;
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

    String _departmentPreff =
        _preferences.getString(preff_department_selected) == null
            ? ""
            : _preferences.getString(preff_department_selected);
    _departmentSelected =
        _departmentPreff == "" ? null : json.decode(_departmentPreff);
    setState(() {});

    String _provincePreff =
        _preferences.getString(preff_province_selected) == null
            ? ""
            : _preferences.getString(preff_province_selected);
    _provinceSelected =
        _provincePreff == "" ? null : json.decode(_provincePreff);
    setState(() {});
    String _districtPreff =
        _preferences.getString(preff_district_selected) == null
            ? ""
            : _preferences.getString(preff_district_selected);
    _districtSelected =
        _districtPreff == "" ? null : json.decode(_districtPreff);
    setState(() {});

    _offerTypeSelected =
        _preferences.getString(preff_offer_type_selected) == null
            ? ""
            : _preferences.getString(preff_offer_type_selected);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.purple,
                size: 35,
              ),
              onPressed: () async {
                _preferences = await SharedPreferences.getInstance();
                final userRol = _preferences.getString(preff_user_rol);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.homeRoute, (Route<dynamic> route) => false,
                    arguments: ({'rol': json.decode(userRol)}));
              }),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 15),
            //create Categorias
            SubtitleForScreens(subtitle: "Categorias"),
            _createCategory(),
            SizedBox(height: 5),
            //create filter ¿algo especial?
            SubtitleForScreens(subtitle: "¿Algo en especial?"),
            _createSubCategory(),
            SizedBox(height: 20),
            //Select Forms
            SubtitleForScreens(subtitle: "Ubicación"),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  children: [
                    createDepartament(),
                    SizedBox(width: 10),
                    createProvince(),
                  ],
                )),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                children: [
                  createDistricts(),
                ],
              ),
            ),
            SizedBox(height: 15),
            SubtitleForScreens(subtitle: "Tipo de Oferta"),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        createOfferTypes(),
                      ])),
            ),
            SizedBox(height: 15),
          ],
        ),
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
              onTap: () async {
                var _isSaved = _listCategorySelected
                    .firstWhere((element) => element == id, orElse: () => null);
                if (_isSaved == null) {
                  _listCategorySelected.add(id);
                  _preferences = await SharedPreferences.getInstance();
                  await _preferences.setString(preff_category_selected,
                      _listCategorySelected.toString());
                } else {
                  _listCategorySelected.removeWhere((item) => item == id);
                  _preferences = await SharedPreferences.getInstance();
                  await _preferences.setString(preff_category_selected,
                      _listCategorySelected.toString());
                }
                setState(() {});
              },
              child: FilterCategoryItem(
                backgroundColor: color,
                size: 115,
                icon: FontAwesomeIcons.accessibleIcon,
                padding: EdgeInsets.all(10),
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
                onTap: () async {
                  var _isSaved = _listSubCategorySelected.firstWhere(
                      (element) => element == id,
                      orElse: () => null);
                  if (_isSaved == null) {
                    _listSubCategorySelected.add(id);
                    _preferences = await SharedPreferences.getInstance();
                    await _preferences.setString(preff_category_item_selected,
                        _listSubCategorySelected.toString());
                  } else {
                    _listSubCategorySelected.removeWhere((item) => item == id);
                    _preferences = await SharedPreferences.getInstance();
                    await _preferences.setString(preff_category_item_selected,
                        _listSubCategorySelected.toString());
                  }
                  setState(() {});
                },
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

  Widget createDepartament() {
    List<String> _data = List();
    for (var items in _listDepartment) {
      _data.add(items.dptoNom ?? "none");
    }
    print('_departmentSelected: $_departmentSelected');
    String _value =
        _departmentSelected == null ? "" : _departmentSelected["dptoNom"];
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: DropDownFormField(
          titleText: 'Departamento',
          hintText: 'Seleccione',
          errorText: 'Selecione Uno',
          value: _value,
          dataSource: _data,
          textField: 'dptoNom',
          valueField: 'dptoId',
          onChanged: (value) async {
            Department departament = _listDepartment.firstWhere(
                (element) => element.dptoNom == value.toString(),
                orElse: () => null);
            _departmentSelected = json.decode(jsonEncode(departament));
            print('value select ===== > ${departament.dptoNom}');
            _preferences = await SharedPreferences.getInstance();
            await _preferences.setString(
                preff_department_selected, jsonEncode(departament));
            // clear prefference of province and district
            await _preferences.remove(preff_province_selected);
            _provinceSelected = null;
            await _preferences.remove(preff_district_selected);
            _districtSelected = null;
            setState(() {});
          },
          filled: true,
        ),
      ),
    );
  }

  Widget createProvince() {
    List<String> _data = List();
    if (_departmentSelected != null) {
      final _filterProvinces = _listProvince
          .where((element) => element.dptoId == _departmentSelected["dptoId"])
          .toList();
      for (var item in _filterProvinces) {
        _data.add(item.provNom ?? "none");
      }
    } else {
      _data = [];
    }
    print('_provinceSelected: $_provinceSelected');
    String _value =
        _provinceSelected == null ? "" : _provinceSelected["provNom"];
    setState(() {});
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: DropDownFormField(
          titleText: 'Provincia',
          hintText: 'Seleccione',
          errorText: 'Selecione Uno',
          value: _value,
          dataSource: _data,
          textField: 'textField',
          valueField: 'valueField',
          onChanged: (value) async {
            Province province = _listProvince.firstWhere(
                (element) => element.provNom == value.toString(),
                orElse: () => null);
            _provinceSelected = json.decode(jsonEncode(province));
            print('value select ===== > ${province.provNom}');
            _preferences = await SharedPreferences.getInstance();
            await _preferences.setString(
                preff_province_selected, jsonEncode(province));
            await _preferences.remove(preff_district_selected);
            _districtSelected = null;
            setState(() {});
          },
          filled: true,
        ),
      ),
    );
  }

  Widget createDistricts() {
    List<String> _data = List();
    if (_provinceSelected != null) {
      final _filterDistricts = _listDistrict
          .where((element) => element.provId == _provinceSelected["provId"])
          .toList();
      for (var item in _filterDistricts) {
        _data.add(item.distNom ?? "none");
      }
    } else {
      _data = [];
    }
    print('_districtSelected: $_districtSelected');
    String _value =
        _districtSelected == null ? "" : _districtSelected["distNom"];
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: DropDownFormField(
          titleText: 'Distrito',
          hintText: 'Seleccione',
          errorText: 'Selecione Uno',
          value: _value,
          dataSource: _data,
          textField: 'textField',
          valueField: 'valueField',
          onChanged: (value) async {
            District district = _listDistrict.firstWhere(
                (element) => element.distNom == value.toString(),
                orElse: () => null);
            _districtSelected = json.decode(jsonEncode(district));
            print('value select ===== > ${district.distNom}');
            _preferences = await SharedPreferences.getInstance();
            await _preferences.setString(
                preff_district_selected, jsonEncode(district));
            setState(() {});
          },
          filled: true,
        ),
      ),
    );
  }

  Widget createOfferTypes() {
    return Expanded(
        child: SizedBox(
      height: 70,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _listOfferType.length,
          itemBuilder: (context, index) {
            final id = _listOfferType[index].tipoOfId.toString();
            var color = _offerTypeSelected == id
                ? kprimaryColorPurple
                : kprimaryColorYellow;
            return InkWell(
              onTap: () async {
                if (_offerTypeSelected != id) {
                  _offerTypeSelected = id;
                  _preferences = await SharedPreferences.getInstance();
                  await _preferences.setString(
                      preff_offer_type_selected, _offerTypeSelected);
                }
                setState(() {});
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.symmetric(horizontal: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _listOfferType[index].tipoOfDesc,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
