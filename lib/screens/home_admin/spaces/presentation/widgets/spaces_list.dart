import 'package:flutter/material.dart';
import 'package:negocia/components/dashed_rect.dart';
import 'package:negocia/screens/home_admin/router/router.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/spaces_admin_titles.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/widgets/spaces_card_component.dart';
import 'package:negocia/screens/home_admin/spaces/presentation/provider/spaces_provide.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class SpacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Selector<SpacesProvider, int>(
            selector: (context, provider) => provider.pago.length,
            builder: (context, spaces, child) {
              int _spaces = spaces ?? 0;
              return HomeAdminTitle(title: "Mis Espacios ($_spaces de 4) ");
            }),
        SizedBox(height: 15),
        Consumer<SpacesProvider>(
          builder: (context, provider, child) {
            if (provider.state == NotifierState.loading) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: kprimaryColorYellow,
              ));
            } else if (provider.state == NotifierState.initial ||
                provider.pago.isEmpty) {
              return Center(
                  child: Text('No se encontro ningun resultado',
                      style: TextStyle(fontSize: 17)));
            } else {
              if (provider.failure != null && provider.pago.isEmpty) {
                return Center(
                    child: Text(provider.failure.toString(),
                        style: TextStyle(fontSize: 17)));
              } else {
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: provider.pago.length,
                      itemBuilder: (context, index) {
                        return BannerCardAdmin(pago: provider.pago[index]);
                      },
                    ),
                    Consumer<SpacesProvider>(
                      builder: (context, provider, child) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 4 - provider.pago.length,
                            itemBuilder: (context, index) {
                              return SpaceToBuy();
                            });
                      },
                    ),
                  ],
                );
              }
            }
          },
        ),
      ],
    );
  }
}

class SpaceToBuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutesAdmin.planScreen),
      child: Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: new BoxDecoration(
            color: Color.fromRGBO(221, 221, 221, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DashedRect(
            color: Colors.grey,
            strokeWidth: 2.0,
            gap: 6.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 36,
                    color: kprimaryColorPurple,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Center(
                      child: Text(
                    "Compra un espacio publicitario disponible",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
