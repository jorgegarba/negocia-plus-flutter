import 'package:flutter/material.dart';
import 'package:negocia/theme/colors.dart';

class BannerInformation extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget content;
  final double elevation;
  final double width;
  final Color color;
  BannerInformation(
      {@required this.title,
      @required this.icon,
      @required this.content,
      this.elevation = 3,
      this.width = double.infinity,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(15.0),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: kprimaryColorYellow,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              child: Card(
                elevation: elevation,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: content,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
