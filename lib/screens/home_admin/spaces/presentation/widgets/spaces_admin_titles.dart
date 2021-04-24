import 'package:flutter/material.dart';
import 'package:negocia/theme/colors.dart';

class HomeAdminTitle extends StatelessWidget {
  final String title;
  const HomeAdminTitle({@required this.title}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.info,
          color: kprimaryColorYellow,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        )
      ],
    );
  }
}

class HomeAdminText extends StatelessWidget {
  final String text;
  const HomeAdminText({@required this.text}) : assert(text != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }
}
