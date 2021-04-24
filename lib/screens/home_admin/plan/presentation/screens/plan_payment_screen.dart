import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/models/plan_model.dart';
import 'package:negocia/screens/home_admin/plan/presentation/widgets/facture_component.dart';
import 'package:negocia/screens/home_admin/plan/presentation/widgets/steps_component.dart';
import 'package:negocia/screens/home_admin/plan/presentation/provider/plan_payment_provider.dart';
import 'package:provider/provider.dart';

class PlanPaymentScreen extends StatelessWidget {
  const PlanPaymentScreen({Key key, this.plan}) : super(key: key);
  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/icons/icon-negocia-plus.png',
          height: 30,
        ),
      ),
      body: Layout(
        padding: 25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepsComponent(step: 3),
            SizedBox(height: 10),
            ChangeNotifierProvider<PlanPaymentProvider>(
              create: (context) => PlanPaymentProvider(plan: plan),
              child: FactureComponent(plan: plan),
            ),
          ],
        ),
      ),
    );
  }
}
