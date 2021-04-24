import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/screens/mysavings/components/mysavings_card.dart';
import 'package:negocia/screens/mysavings/components/mysavings_promotion.dart';
import 'package:negocia/screens/mysavings/providers/mysavings_provider.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class MySavingsScreen extends StatelessWidget {
  const MySavingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 10,
          ),
          Selector<MySavingProvider, Tuple2<String, double>>(
            selector: (context, provider) =>
                Tuple2(provider.fullname, provider.totalDiscount),
            builder: (context, data, widget) {
              return MySavingsCard(
                amount: data.item2.toString(),
                name: data.item1,
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child:
                Consumer<MySavingProvider>(builder: (context, provider, child) {
              if (provider.state == NotifierState.loading) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: kprimaryColorYellow,
                ));
              } else if (provider.state == NotifierState.initial ||
                  provider.consumos.isEmpty) {
                return Center(
                    child: Text('No se encontro ningun resultado',
                        style: TextStyle(fontSize: 20)));
              } else {
                if (provider.failure != null && provider.consumos.isEmpty) {
                  return Center(
                      child: Text(provider.failure.toString(),
                          style: TextStyle(fontSize: 20)));
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: provider.consumos.length,
                      itemBuilder: (context, index) {
                        return MySavingsPromotion(
                            consumos: provider.consumos[index], index: index);
                      });
                }
              }
            }),
          )
        ],
      ),
    );
  }
}
