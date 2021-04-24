import 'package:negocia/globals.dart';
import 'package:negocia/models/plan_model.dart';
import 'package:negocia/utils/network-util.dart';

class AdminService {
  NetworkUtil _netUtil = new NetworkUtil();
  static final _baseUrl = "$API/empresa";
  static final _planUrl = "$_baseUrl/plan";

  Future<List<Plan>> getPlans() async {
    return _netUtil.get(_planUrl).then((dynamic res) {
      final _categories = res['content'];
      print(_categories);
      final object = List<Plan>.from(
          _categories.map((categories) => Plan.fromJson(categories)));
      return object;
    });
  }
}
