import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/screens/home_admin/plan/presentation/provider/plan_provider.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PlanCardComponent extends StatelessWidget {
  PlanCardComponent({Key key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  List<String> caracteristicas = [
    "04 promociones internas dentro del espacio publicitario.",
    "Reportes diarios de los canjes en tu empresa.",
    "Panel administrativo web y móvil.",
  ];

  @override
  Widget build(BuildContext context) {
    var planProvider = Provider.of<PlanProvider>(context, listen: false);
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<PlanProvider>(
          builder: (context, provider, child) {
            return provider.planes.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    backgroundColor: kprimaryColorYellow,
                  ))
                : Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: Column(
                      children: [
                        ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: provider.planes.length,
                          itemBuilder: (context, index) {
                            final plan = provider.planes[index].planDesc;
                            final precio = provider.planes[index].planPrecio;
                            final dias = provider.planes[index].planDias;
                            return InkWell(
                              onTap: () {
                                planProvider.planItemSelected(
                                    planSelected: provider.planes[index].planId
                                        .toString());
                              },
                              child: Padding(
                                padding: EdgeInsets.all(9),
                                child: SizedBox(
                                  height: 200,
                                  child: Container(
                                    padding: EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Negocia $plan",
                                              style: TextStyle(
                                                color: Color(0xff444444),
                                                fontSize: 20,
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Icon(
                                              provider.planSelected ==
                                                      provider
                                                          .planes[index].planId
                                                          .toString()
                                                  ? Icons.check_circle
                                                  : Icons.check_circle_outline,
                                              size: 40,
                                              color: kprimaryColorPurple,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "S/ $precio / $dias días",
                                          style: TextStyle(
                                            color: Color(0xff444444),
                                            fontSize: 15,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Características:",
                                          style: TextStyle(
                                            color: Color(0xff444444),
                                            fontSize: 15,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        SizedBox(
                                          height: 90,
                                          child: _caracteristicas(
                                              caracteristicas: caracteristicas),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: primaryColorPurple,
                            onPressed: () => planProvider.navigatePlanProvider(
                                context: context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Completar Pago',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 40,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _caracteristicas({List caracteristicas}) {
    final ScrollController _scrollController = ScrollController();
    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: caracteristicas.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Icon(
                  Icons.check,
                  size: 25,
                  color: kprimaryColorPurple,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    caracteristicas[index],
                    style: TextStyle(
                      color: Color(0xff888888),
                      fontSize: 12,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                )
              ],
            );
          }),
    );
  }
}
