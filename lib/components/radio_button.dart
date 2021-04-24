import 'package:flutter/material.dart';
import 'package:negocia/theme/colors.dart';

class RadioButton extends StatelessWidget {
  String text;
  bool selected;
  Function onPressed;
  RadioButton(
      {@required this.selected, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: selected ? kprimaryColorYellow : Colors.white,
      disabledColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
