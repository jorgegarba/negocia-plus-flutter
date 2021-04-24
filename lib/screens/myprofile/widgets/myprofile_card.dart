import 'package:flutter/material.dart';
import 'package:negocia/screens/mysavings/providers/mysavings_provider.dart';
import 'package:provider/provider.dart';

class MyProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/pork.png",
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Mis ahorros",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Selector<MySavingProvider, double>(
                selector: (context, provider) => provider.totalDiscount,
                builder: (context, totalDiscount, widget) {
                  return Row(
                    children: [
                      Text(
                        'S/ ${totalDiscount.toString()}',
                        style: TextStyle(
                            fontFamily: 'Roboto', fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  );
                },
              ),
            ],
          ),
        ));
  }
}
