import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';

class MethodTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  MethodTitle({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: primaryColorYellow,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
