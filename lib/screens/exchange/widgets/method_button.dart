import 'package:flutter/material.dart';
import 'package:negocia/constants.dart';

class MethodButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final IconData icon;

  MethodButton(
      {@required this.onPressed, @required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: FlatButton(
        color: Colors.white,
        textColor: Colors.black,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(12.0),
        splashColor: primaryColorYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onPressed,
        child: Center(
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
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
