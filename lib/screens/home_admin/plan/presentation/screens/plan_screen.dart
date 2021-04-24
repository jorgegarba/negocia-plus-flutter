import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/screens/home_admin/plan/presentation/widgets/plan_card_component.dart';
import 'package:negocia/screens/home_admin/plan/presentation/widgets/steps_component.dart';
import 'package:negocia/screens/home_admin/plan/presentation/provider/plan_provider.dart';
import 'package:provider/provider.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlanProvider>(
          create: (context) => PlanProvider(),
          lazy: false,
        )
      ],
      child: Scaffold(
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
              StepsComponent(step: 1),
              SizedBox(height: 10),
              PlanCardComponent()
            ],
          ),
        ),
      ),
    );
  }
}
