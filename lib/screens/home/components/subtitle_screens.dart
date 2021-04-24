import 'package:flutter/material.dart';

class SubtitleForScreens extends StatelessWidget {
  const SubtitleForScreens({Key key, @required this.subtitle})
      : super(key: key);
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
        child: Text(
          subtitle ?? '',
          style: TextStyle(
              color: Color.fromRGBO(68, 68, 68, 1),
              fontSize: 18,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
