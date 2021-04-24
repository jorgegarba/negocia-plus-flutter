import 'package:flutter/material.dart';

class TextDot extends StatelessWidget {
  final String description;

  TextDot({@required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Icon(
              Icons.brightness_1,
              size: 8,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              description,
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
