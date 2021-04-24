import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/models/plan_model.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/home_admin/adSpace/presentation/widgets/create_ad_photo.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/spaces_admin_titles.dart';
import 'package:negocia/screens/home_admin/plan/presentation/widgets/plan_space_form_fields.dart';
import 'package:negocia/screens/home_admin/plan/presentation/widgets/steps_component.dart';
import 'package:negocia/screens/home_admin/plan/presentation/provider/plan_space_provider.dart';
import 'package:provider/provider.dart';

class PlanSpaceScreen extends StatelessWidget {
  const PlanSpaceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plan = Provider.of<Plan>(context);
    PlanSpaceProvider planSpaceProvider =
        Provider.of<PlanSpaceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/icons/icon-negocia-plus.png',
          height: 30,
        ),
      ),
      body: Layout(
        padding: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepsComponent(step: 2),
            SizedBox(height: 10),
            CreateAdPhoto(),
            HomeAdminText(text: 'Título :'),
            formFieldPlanSpaceTitle(provider: planSpaceProvider),
            HomeAdminText(text: 'Descripción :'),
            formFieldPlanSpaceDescription(provider: planSpaceProvider),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.planPaymentRoute,
                      arguments: {'object': plan});
                },
                child: Text(
                  "Siguiente",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
