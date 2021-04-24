import 'package:flutter/material.dart';

class FilterSubCategoryItem extends StatelessWidget {
  final Color backgroundColor;
  final double size;
  final IconData icon;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final String text;

  FilterSubCategoryItem(
      {@required this.backgroundColor,
      @required this.size,
      @required this.icon,
      @required this.padding,
      @required this.margin,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: padding,
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          )
        ],
      ),
    );
  }
}
