import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';

class MethodBarStatus extends StatelessWidget {
  final bool secondStatus;

  MethodBarStatus({this.secondStatus = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      color: primaryColorPurple,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/modo.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1. Elija la modalidad \nde Canje",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: primaryColorYellow,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/140x100'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "2. Negocia",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: primaryColorYellow,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
