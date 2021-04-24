import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/plan_model.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/services/admin_services.dart';

class PlanProvider with ChangeNotifier {
  List<Plan> _planes = [];
  List<Plan> get planes => _planes;

  String _planSelected = '';
  String get planSelected => _planSelected;

  PlanProvider() {
    _getPlanesData();
  }

  Future<void> _getPlanesData() async {
    notifyListeners();
    this._planes = await AdminService().getPlans();
    notifyListeners();
  }

  planItemSelected({String planSelected}) {
    this._planSelected = planSelected;
    notifyListeners();
  }

  navigatePlanProvider({BuildContext context}) {
    if (planSelected != '') {
      Plan _plan = planes.firstWhere(
          (plan) => plan.planId.toString() == planSelected,
          orElse: () => null);
      Navigator.pushNamed(context, Routes.planSpaceRoute,
          arguments: {'object': _plan});
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          duration: animationDuration,
          backgroundColor: Colors.amber,
          content: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Seleccione un Plan 😁",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }
  }
}
