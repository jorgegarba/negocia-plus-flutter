import 'dart:convert';

import 'package:negocia/constants.dart';
import 'package:negocia/globals.dart';
import 'package:negocia/models/categories.dart';
import 'package:negocia/models/department_model.dart';
import 'package:negocia/models/district_model.dart';
import 'package:negocia/models/offer_type_model.dart';
import 'package:negocia/models/province_model.dart';
import 'package:negocia/utils/network-util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterService {
  NetworkUtil _netUtil = new NetworkUtil();
  SharedPreferences _preferences;
  static final _categoriesSpaceUrl = "$API/empresa/catneg";
  static final _categoriesItemsUrl = "$API/empresa/catvar";
  static final _departamentsUrl = "$API/gen/dep";
  static final _provincesUrl = "$API/gen/prov";
  static final _districtsUrl = "$API/gen/dist";
  static final _offerTypesUrl = "$API/oferta/tipoOferta";

  Future<List<CategoriaNegocio>> getCategories() async {
    return await _getData(
            prefference: preff_category_list, url: _categoriesSpaceUrl)
        .then((map) async {
      print(map);
      final list = List<CategoriaNegocio>.from(
          map.map((content) => CategoriaNegocio.fromJson(content)));
      await _preferences.setString(preff_category_list, jsonEncode(list));
      return list;
    });
  }

  Future<List<CategoriaItems>> getCategoriesItems() async {
    return await _getData(
            prefference: preff_category_item_list, url: _categoriesItemsUrl)
        .then((map) async {
      final list = List<CategoriaItems>.from(
          map.map((content) => CategoriaItems.fromJson(content)));
      await _preferences.setString(preff_category_item_list, jsonEncode(list));
      return list;
    });
  }

  Future<List<Department>> getDepartment() async {
    return await _getData(
            prefference: preff_department_list, url: _departamentsUrl)
        .then((map) async {
      final list = List<Department>.from(
          map.map((content) => Department.fromJson(content)));
      await _preferences.setString(preff_department_list, jsonEncode(list));
      return list;
    });
  }

  Future<List<Province>> getProvince() async {
    return await _getData(prefference: preff_province_list, url: _provincesUrl)
        .then((map) async {
      final list =
          List<Province>.from(map.map((content) => Province.fromJson(content)));
      await _preferences.setString(preff_province_list, jsonEncode(list));
      return list;
    });
  }

  Future<List<District>> getDistricts() async {
    return await _getData(prefference: preff_district_list, url: _districtsUrl)
        .then((map) async {
      final list =
          List<District>.from(map.map((content) => District.fromJson(content)));
      await _preferences.setString(preff_district_list, jsonEncode(list));
      return list;
    });
  }

  Future<List<OfferType>> getOfferTypes() async {
    return await _getData(
            prefference: preff_offer_type_list, url: _offerTypesUrl)
        .then((map) async {
      final list = List<OfferType>.from(
          map.map((content) => OfferType.fromJson(content)));
      await _preferences.setString(preff_offer_type_list, jsonEncode(list));
      return list;
    });
  }

  Future<dynamic> _getData({String prefference, String url}) async {
    _preferences = await SharedPreferences.getInstance();
    final _object = _preferences.getString(prefference);
    if (_object == null) {
      print('$prefference isnt saved');
      return await _netUtil.get(url).then((dynamic res) async {
        return res['content'];
      });
    } else {
      print('$prefference is saved');
      return json.decode(_object);
    }
  }
}
